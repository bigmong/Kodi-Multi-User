-----------------------------
-- VARIABLES TO CHANGE
-- DATABASE: Kodi_U02_Video_119
-- USER ACCOUNT: KODI_19
-----------------------------
DELIMITER ;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- SET ACTIVE DATABASE --
USE `Kodi_U02_Video_119`;

  DROP VIEW IF EXISTS `episode_view`;
  CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `episode_view` AS SELECT
    `episode`.`idEpisode` AS `idEpisode`,
    `episode`.`idFile` AS `idFile`,
    `episode`.`c00` AS `c00`,
    `episode`.`c01` AS `c01`,
    `episode`.`c02` AS `c02`,
    `episode`.`c03` AS `c03`,
    `episode`.`c04` AS `c04`,
    `episode`.`c05` AS `c05`,
    `episode`.`c06` AS `c06`,
    `episode`.`c07` AS `c07`,
    `episode`.`c08` AS `c08`,
    `episode`.`c09` AS `c09`,
    `episode`.`c10` AS `c10`,
    `episode`.`c11` AS `c11`,
    `episode`.`c12` AS `c12`,
    `episode`.`c13` AS `c13`,
    `episode`.`c14` AS `c14`,
    `episode`.`c15` AS `c15`,
    `episode`.`c16` AS `c16`,
    `episode`.`c17` AS `c17`,
    `episode`.`c18` AS `c18`,
    `episode`.`c19` AS `c19`,
    `episode`.`c20` AS `c20`,
    `episode`.`c21` AS `c21`,
    `episode`.`c22` AS `c22`,
    `episode`.`c23` AS `c23`,
    `episode`.`idShow` AS `idShow`,
    `episode`.`userrating` AS `userrating`,
    `episode`.`idSeason` AS `idSeason`,
    `files`.`strFilename` AS `strFileName`,
    `path`.`strPath` AS `strPath`,
    `files`.`playCount` AS `playCount`,
    `files`.`lastPlayed` AS `lastPlayed`,
    `files`.`dateAdded` AS `dateAdded`,
    `tvshow`.`c00` AS `strTitle`,
    `tvshow`.`c08` AS `genre`,
    `tvshow`.`c14` AS `studio`,
    `tvshow`.`c05` AS `premiered`,
    `tvshow`.`c13` AS `mpaa`,
    `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,
    `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,
    `bookmark`.`playerState` AS `playerState`,
    `rating`.`rating` AS `rating`,
    `rating`.`votes` AS `votes`,
    `rating`.`rating_type` AS `rating_type`,
    `uniqueid`.`value` AS `uniqueid_value`,
    `uniqueid`.`type` AS `uniqueid_type`
   FROM (((((((`episode` join `files` on((`files`.`idFile` = `episode`.`idFile`)))
    join `tvshow` on((`tvshow`.`idShow` = `episode`.`idShow`)))
    join `seasons` on((`seasons`.`idSeason` = `episode`.`idSeason`)))
    join `path` on((`files`.`idPath` = `path`.`idPath`)))
    left join `bookmark` on(((`bookmark`.`idFile` = `episode`.`idFile`) and (`bookmark`.`type` = 1))))
    left join `rating` on((`rating`.`rating_id` = `episode`.`c03`)))
    left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `episode`.`c20`)))
  WHERE
    `path`.`strPath` LIKE '%movies-12%' OR
    `path`.`strPath` LIKE '%movies-pg%' OR
    `path`.`strPath` LIKE '%tv-kids%';

  DROP VIEW IF EXISTS `movie_view`;
  CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `movie_view` AS SELECT
    `movie`.`idMovie` AS `idMovie`,
    `movie`.`idFile` AS `idFile`,
    `movie`.`c00` AS `c00`,
    `movie`.`c01` AS `c01`,
    `movie`.`c02` AS `c02`,
    `movie`.`c03` AS `c03`,
    `movie`.`c04` AS `c04`,
    `movie`.`c05` AS `c05`,
    `movie`.`c06` AS `c06`,
    `movie`.`c07` AS `c07`,
    `movie`.`c08` AS `c08`,
    `movie`.`c09` AS `c09`,
    `movie`.`c10` AS `c10`,
    `movie`.`c11` AS `c11`,
    `movie`.`c12` AS `c12`,
    `movie`.`c13` AS `c13`,
    `movie`.`c14` AS `c14`,
    `movie`.`c15` AS `c15`,
    `movie`.`c16` AS `c16`,
    `movie`.`c17` AS `c17`,
    `movie`.`c18` AS `c18`,
    `movie`.`c19` AS `c19`,
    `movie`.`c20` AS `c20`,
    `movie`.`c21` AS `c21`,
    `movie`.`c22` AS `c22`,
    `movie`.`c23` AS `c23`,
    `movie`.`idSet` AS `idSet`,
    `movie`.`userrating` AS `userrating`,
    `movie`.`premiered` AS `premiered`,
    `sets`.`strSet` AS `strSet`,
    `sets`.`strOverview` AS `strSetOverview`,
    `files`.`strFilename` AS `strFileName`,
    `path`.`strPath` AS `strPath`,
    `files`.`playCount` AS `playCount`,
    `files`.`lastPlayed` AS `lastPlayed`,
    `files`.`dateAdded` AS `dateAdded`,
    `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,
    `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,
    `bookmark`.`playerState` AS `playerState`,
    `rating`.`rating` AS `rating`,
    `rating`.`votes` AS `votes`,
    `rating`.`rating_type` AS `rating_type`,
    `uniqueid`.`value` AS `uniqueid_value`,
    `uniqueid`.`type` AS `uniqueid_type`
  FROM ((((((`movie` left join `sets` on((`sets`.`idSet` = `movie`.`idSet`)))
    join `files` on((`files`.`idFile` = `movie`.`idFile`)))
    join `path` on((`path`.`idPath` = `files`.`idPath`)))
    left join `bookmark` on(((`bookmark`.`idFile` = `movie`.`idFile`) and (`bookmark`.`type` = 1))))
    left join `rating` on((`rating`.`rating_id` = `movie`.`c05`)))
    left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `movie`.`c09`)))
  WHERE
    `path`.`strPath` LIKE '%movies-12%' OR
    `path`.`strPath` LIKE '%movies-pg%' OR
    `path`.`strPath` LIKE '%tv-kids%';

  DROP VIEW IF EXISTS `tvshow_view`;
  CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `tvshow_view` AS SELECT
    `tvshow`.`idShow` AS `idShow`, `tvshow`.`c00` AS `c00`,
    `tvshow`.`c01` AS `c01`,
    `tvshow`.`c02` AS `c02`,
    `tvshow`.`c03` AS `c03`,
    `tvshow`.`c04` AS `c04`,
    `tvshow`.`c05` AS `c05`,
    `tvshow`.`c06` AS `c06`,
    `tvshow`.`c07` AS `c07`,
    `tvshow`.`c08` AS `c08`,
    `tvshow`.`c09` AS `c09`,
    `tvshow`.`c10` AS `c10`,
    `tvshow`.`c11` AS `c11`,
    `tvshow`.`c12` AS `c12`,
    `tvshow`.`c13` AS `c13`,
    `tvshow`.`c14` AS `c14`,
    `tvshow`.`c15` AS `c15`,
    `tvshow`.`c16` AS `c16`,
    `tvshow`.`c17` AS `c17`,
    `tvshow`.`c18` AS `c18`,
    `tvshow`.`c19` AS `c19`,
    `tvshow`.`c20` AS `c20`,
    `tvshow`.`c21` AS `c21`,
    `tvshow`.`c22` AS `c22`,
    `tvshow`.`c23` AS `c23`,
    `tvshow`.`userrating` AS `userrating`,
    `tvshow`.`duration` AS `duration`,
    `path`.`idParentPath` AS `idParentPath`,
    `path`.`strPath` AS `strPath`,
    `tvshowcounts`.`dateAdded` AS `dateAdded`,
    `tvshowcounts`.`lastPlayed` AS `lastPlayed`,
    `tvshowcounts`.`totalCount` AS `totalCount`,
    `tvshowcounts`.`watchedcount` AS `watchedcount`,
    `tvshowcounts`.`totalSeasons` AS `totalSeasons`,
    `rating`.`rating` AS `rating`,
    `rating`.`votes` AS `votes`,
    `rating`.`rating_type` AS `rating_type`,
    `uniqueid`.`value` AS `uniqueid_value`,
    `uniqueid`.`type` AS `uniqueid_type`
  FROM (((((`tvshow` left join `tvshowlinkpath_minview` on((`tvshowlinkpath_minview`.`idShow` = `tvshow`.`idShow`)))
    left join `path` on((`path`.`idPath` = `tvshowlinkpath_minview`.`idPath`)))
    join `tvshowcounts` on((`tvshow`.`idShow` = `tvshowcounts`.`idShow`)))
    left join `rating` on((`rating`.`rating_id` = `tvshow`.`c04`)))
    left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `tvshow`.`c12`)))
  WHERE
    `path`.`strPath` LIKE '%movies-12%' OR
    `path`.`strPath` LIKE '%movies-pg%' OR
    `path`.`strPath` LIKE '%tv-kids%';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;