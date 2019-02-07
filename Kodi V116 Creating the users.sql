/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `Kodi_U02_Video_116` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON `Kodi\_U02\_Video\_116`.* TO 'KODI_18'@'%' WITH GRANT OPTION;
  USE `Kodi_U02_Video_116`;

    -- FILES VIEW FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `files` AS SELECT
      `Kodi_U01_Video_116`.`global_files`.`idFile` AS `idFile`,
      `Kodi_U01_Video_116`.`global_files`.`idPath` AS `idPath`,
      `Kodi_U01_Video_116`.`global_files`.`strFilename` AS `strFilename`,
      `Kodi_U01_Video_116`.`global_files`.`playCount_U02` AS `playCount`,
      `Kodi_U01_Video_116`.`global_files`.`lastPlayed_U02` AS `lastPlayed`,
      `Kodi_U01_Video_116`.`global_files`.`dateAdded` AS `dateAdded`
    FROM `Kodi_U01_Video_116`.`global_files`;

    -- BOOKMARKS FOR _U02 --
    CREATE TABLE `bookmark` (
      `idBookmark` INT(11) NOT NULL,
      `idFile` INT(11) DEFAULT NULL,
      `timeInSeconds` DOUBLE DEFAULT NULL,
      `totalTimeInSeconds` DOUBLE DEFAULT NULL,
      `thumbNailImage` text,
      `player` text,
      `playerState` text,
      `type` INT(11) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    ALTER TABLE `bookmark` ADD PRIMARY KEY (`idBookmark`), ADD KEY `ix_bookmark` (`idFile`,`type`);
    ALTER TABLE `bookmark` MODIFY `idBookmark` INT(11) NOT NULL AUTO_INCREMENT;

    -- EPISODE VIEW FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `episode` AS SELECT
      `Kodi_U01_Video_116`.`global_episode`.`idEpisode` AS `idEpisode`,
      `Kodi_U01_Video_116`.`global_episode`.`idFile` AS `idFile`,
      `Kodi_U01_Video_116`.`global_episode`.`c00` AS `c00`,
      `Kodi_U01_Video_116`.`global_episode`.`c01` AS `c01`,
      `Kodi_U01_Video_116`.`global_episode`.`c02` AS `c02`,
      `Kodi_U01_Video_116`.`global_episode`.`c03` AS `c03`,
      `Kodi_U01_Video_116`.`global_episode`.`c04` AS `c04`,
      `Kodi_U01_Video_116`.`global_episode`.`c05` AS `c05`,
      `Kodi_U01_Video_116`.`global_episode`.`c06` AS `c06`,
      `Kodi_U01_Video_116`.`global_episode`.`c07` AS `c07`,
      `Kodi_U01_Video_116`.`global_episode`.`c08` AS `c08`,
      `Kodi_U01_Video_116`.`global_episode`.`c09` AS `c09`,
      `Kodi_U01_Video_116`.`global_episode`.`c10` AS `c10`,
      `Kodi_U01_Video_116`.`global_episode`.`c11` AS `c11`,
      `Kodi_U01_Video_116`.`global_episode`.`c12` AS `c12`,
      `Kodi_U01_Video_116`.`global_episode`.`c13` AS `c13`,
      `Kodi_U01_Video_116`.`global_episode`.`c14` AS `c14`,
      `Kodi_U01_Video_116`.`global_episode`.`c15` AS `c15`,
      `Kodi_U01_Video_116`.`global_episode`.`c16` AS `c16`,
      `Kodi_U01_Video_116`.`global_episode`.`c17` AS `c17`,
      `Kodi_U01_Video_116`.`global_episode`.`c18` AS `c18`,
      `Kodi_U01_Video_116`.`global_episode`.`c19` AS `c19`,
      `Kodi_U01_Video_116`.`global_episode`.`c20` AS `c20`,
      `Kodi_U01_Video_116`.`global_episode`.`c21` AS `c21`,
      `Kodi_U01_Video_116`.`global_episode`.`c22` AS `c22`,
      `Kodi_U01_Video_116`.`global_episode`.`c23` AS `c23`,
      `Kodi_U01_Video_116`.`global_episode`.`idShow` AS `idShow`,
      `Kodi_U01_Video_116`.`global_episode`.`userrating_U02` AS `userrating`,
      `Kodi_U01_Video_116`.`global_episode`.`idSeason` AS `idSeason`
    FROM `Kodi_U01_Video_116`.`global_episode`;

    -- SEASONS VIEW FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `seasons` AS SELECT
      `Kodi_U01_Video_116`.`global_seasons`.`idSeason` AS `idSeason`,
      `Kodi_U01_Video_116`.`global_seasons`.`idShow` AS `idShow`,
      `Kodi_U01_Video_116`.`global_seasons`.`season` AS `season`,
      `Kodi_U01_Video_116`.`global_seasons`.`name` AS `name`,
      `Kodi_U01_Video_116`.`global_seasons`.`userrating_U02` AS `userrating`
    FROM `Kodi_U01_Video_116`.`global_seasons`;

    -- TVSHOW VIEW FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshow` AS SELECT
      `Kodi_U01_Video_116`.`global_tvshow`.`idShow` AS `idShow`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c00` AS `c00`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c01` AS `c01`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c02` AS `c02`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c03` AS `c03`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c04` AS `c04`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c05` AS `c05`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c06` AS `c06`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c07` AS `c07`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c08` AS `c08`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c09` AS `c09`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c10` AS `c10`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c11` AS `c11`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c12` AS `c12`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c13` AS `c13`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c14` AS `c14`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c15` AS `c15`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c16` AS `c16`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c17` AS `c17`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c18` AS `c18`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c19` AS `c19`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c20` AS `c20`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c21` AS `c21`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c22` AS `c22`,
      `Kodi_U01_Video_116`.`global_tvshow`.`c23` AS `c23`,
      `Kodi_U01_Video_116`.`global_tvshow`.`userrating_U02` AS `userrating`,
      `Kodi_U01_Video_116`.`global_tvshow`.`duration` AS `duration`
    FROM `Kodi_U01_Video_116`.`global_tvshow`;

    -- MOVIE VIEW FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `movie` AS SELECT
      `Kodi_U01_Video_116`.`global_movie`.`idMovie` AS `idMovie`,
      `Kodi_U01_Video_116`.`global_movie`.`idFile` AS `idFile`,
      `Kodi_U01_Video_116`.`global_movie`.`c00` AS `c00`,
      `Kodi_U01_Video_116`.`global_movie`.`c01` AS `c01`,
      `Kodi_U01_Video_116`.`global_movie`.`c02` AS `c02`,
      `Kodi_U01_Video_116`.`global_movie`.`c03` AS `c03`,
      `Kodi_U01_Video_116`.`global_movie`.`c04` AS `c04`,
      `Kodi_U01_Video_116`.`global_movie`.`c05` AS `c05`,
      `Kodi_U01_Video_116`.`global_movie`.`c06` AS `c06`,
      `Kodi_U01_Video_116`.`global_movie`.`c07` AS `c07`,
      `Kodi_U01_Video_116`.`global_movie`.`c08` AS `c08`,
      `Kodi_U01_Video_116`.`global_movie`.`c09` AS `c09`,
      `Kodi_U01_Video_116`.`global_movie`.`c10` AS `c10`,
      `Kodi_U01_Video_116`.`global_movie`.`c11` AS `c11`,
      `Kodi_U01_Video_116`.`global_movie`.`c12` AS `c12`,
      `Kodi_U01_Video_116`.`global_movie`.`c13` AS `c13`,
      `Kodi_U01_Video_116`.`global_movie`.`c14` AS `c14`,
      `Kodi_U01_Video_116`.`global_movie`.`c15` AS `c15`,
      `Kodi_U01_Video_116`.`global_movie`.`c16` AS `c16`,
      `Kodi_U01_Video_116`.`global_movie`.`c17` AS `c17`,
      `Kodi_U01_Video_116`.`global_movie`.`c18` AS `c18`,
      `Kodi_U01_Video_116`.`global_movie`.`c19` AS `c19`,
      `Kodi_U01_Video_116`.`global_movie`.`c20` AS `c20`,
      `Kodi_U01_Video_116`.`global_movie`.`c21` AS `c21`,
      `Kodi_U01_Video_116`.`global_movie`.`c22` AS `c22`,
      `Kodi_U01_Video_116`.`global_movie`.`c23` AS `c23`,
      `Kodi_U01_Video_116`.`global_movie`.`idSet` AS `idSet`,
      `Kodi_U01_Video_116`.`global_movie`.`userrating_U02` AS `userrating`,
      `Kodi_U01_Video_116`.`global_movie`.`premiered` AS `premiered`
    FROM `Kodi_U01_Video_116`.`global_movie`;

    -- REST OF THE VIEWS FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `actor` AS SELECT * FROM `Kodi_U01_Video_116`.`actor`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `actor_link` AS SELECT * FROM `Kodi_U01_Video_116`.`actor_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `art` AS SELECT * FROM `Kodi_U01_Video_116`.`art`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `country` AS SELECT * FROM `Kodi_U01_Video_116`.`country`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `country_link` AS SELECT * FROM `Kodi_U01_Video_116`.`country_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `director_link` AS SELECT * FROM `Kodi_U01_Video_116`.`director_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `genre` AS SELECT * FROM `Kodi_U01_Video_116`.`genre`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `genre_link` AS SELECT * FROM `Kodi_U01_Video_116`.`genre_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `movielinktvshow` AS SELECT * FROM `Kodi_U01_Video_116`.`movielinktvshow`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `musicvideo` AS SELECT * FROM `Kodi_U01_Video_116`.`musicvideo`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `path` AS SELECT * FROM `Kodi_U01_Video_116`.`path`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `rating` AS SELECT * FROM `Kodi_U01_Video_116`.`rating`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `sets` AS SELECT * FROM `Kodi_U01_Video_116`.`sets`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `settings` AS SELECT * FROM `Kodi_U01_Video_116`.`settings`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `stacktimes` AS SELECT * FROM `Kodi_U01_Video_116`.`stacktimes`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `streamdetails` AS SELECT * FROM `Kodi_U01_Video_116`.`streamdetails`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `studio` AS SELECT * FROM `Kodi_U01_Video_116`.`studio`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `studio_link` AS SELECT * FROM `Kodi_U01_Video_116`.`studio_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tag` AS SELECT * FROM `Kodi_U01_Video_116`.`tag`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tag_link` AS SELECT * FROM `Kodi_U01_Video_116`.`tag_link`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshowlinkpath` AS SELECT * FROM `Kodi_U01_Video_116`.`tvshowlinkpath`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `uniqueid` AS SELECT * FROM `Kodi_U01_Video_116`.`uniqueid`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `version` AS SELECT * FROM `Kodi_U01_Video_116`.`version`;
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `writer_link` AS SELECT * FROM `Kodi_U01_Video_116`.`writer_link`;

    -- DEFAULT VIEWS FOR _U02 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `episode_view` AS SELECT
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
    FROM (((((((`episode` JOIN `files` ON((`files`.`idFile` = `episode`.`idFile`)))
      JOIN `tvshow` ON((`tvshow`.`idShow` = `episode`.`idShow`)))
      JOIN `seasons` ON((`seasons`.`idSeason` = `episode`.`idSeason`)))
      JOIN `path` ON((`files`.`idPath` = `path`.`idPath`)))
      LEFT JOIN `bookmark` ON(((`bookmark`.`idFile` = `episode`.`idFile`) AND (`bookmark`.`type` = 1))))
      LEFT JOIN `rating` ON((`rating`.`rating_id` = `episode`.`c03`)))
      LEFT JOIN `uniqueid` ON((`uniqueid`.`uniqueid_id` = `episode`.`c20`)));

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `movie_view` AS SELECT
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
      `rating`.`rating` AS `rating`,`rating`.`votes` AS `votes`,
      `rating`.`rating_type` AS `rating_type`,
      `uniqueid`.`value` AS `uniqueid_value`,
      `uniqueid`.`type` AS `uniqueid_type`
    FROM ((((((`movie` LEFT JOIN `sets` ON((`sets`.`idSet` = `movie`.`idSet`)))
      JOIN `files` ON((`files`.`idFile` = `movie`.`idFile`)))
      JOIN `path` ON((`path`.`idPath` = `files`.`idPath`)))
      LEFT JOIN `bookmark` ON(((`bookmark`.`idFile` = `movie`.`idFile`) AND (`bookmark`.`type` = 1))))
      LEFT JOIN `rating` ON((`rating`.`rating_id` = `movie`.`c05`)))
      LEFT JOIN `uniqueid` ON((`uniqueid`.`uniqueid_id` = `movie`.`c09`)));

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `musicvideo_view` AS SELECT
      `musicvideo`.`idMVideo` AS `idMVideo`,
      `musicvideo`.`idFile` AS `idFile`,
      `musicvideo`.`c00` AS `c00`,
      `musicvideo`.`c01` AS `c01`,
      `musicvideo`.`c02` AS `c02`,
      `musicvideo`.`c03` AS `c03`,
      `musicvideo`.`c04` AS `c04`,
      `musicvideo`.`c05` AS `c05`,
      `musicvideo`.`c06` AS `c06`,
      `musicvideo`.`c07` AS `c07`,
      `musicvideo`.`c08` AS `c08`,
      `musicvideo`.`c09` AS `c09`,
      `musicvideo`.`c10` AS `c10`,
      `musicvideo`.`c11` AS `c11`,
      `musicvideo`.`c12` AS `c12`,
      `musicvideo`.`c13` AS `c13`,
      `musicvideo`.`c14` AS `c14`,
      `musicvideo`.`c15` AS `c15`,
      `musicvideo`.`c16` AS `c16`,
      `musicvideo`.`c17` AS `c17`,
      `musicvideo`.`c18` AS `c18`,
      `musicvideo`.`c19` AS `c19`,
      `musicvideo`.`c20` AS `c20`,
      `musicvideo`.`c21` AS `c21`,
      `musicvideo`.`c22` AS `c22`,
      `musicvideo`.`c23` AS `c23`,
      `musicvideo`.`userrating` AS `userrating`,
      `musicvideo`.`premiered` AS `premiered`,
      `files`.`strFilename` AS `strFileName`,
      `path`.`strPath` AS `strPath`,
      `files`.`playCount` AS `playCount`,
      `files`.`lastPlayed` AS `lastPlayed`,
      `files`.`dateAdded` AS `dateAdded`,
      `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,
      `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,
      `bookmark`.`playerState` AS `playerState`
    FROM (((`musicvideo` join `files` ON((`files`.`idFile` = `musicvideo`.`idFile`)))
      JOIN `path` ON((`path`.`idPath` = `files`.`idPath`)))
      LEFT JOIN `bookmark` ON(((`bookmark`.`idFile` = `musicvideo`.`idFile`) AND (`bookmark`.`type` = 1))));

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshowlinkpath_minview` AS SELECT
      `tvshowlinkpath`.`idShow` AS `idShow`,
      MIN(`tvshowlinkpath`.`idPath`) AS `idPath`
    FROM `tvshowlinkpath`
    GROUP BY `tvshowlinkpath`.`idShow`;

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshowcounts` AS SELECT
      `tvshow`.`idShow` AS `idShow`,
      MAX(`files`.`lastPlayed`) AS `lastPlayed`,
      NULLIF(COUNT(`episode`.`c12`),0) AS `totalCount`,
      COUNT(`files`.`playCount`) AS `watchedcount`,
      NULLIF(COUNT(DISTINCT `episode`.`c12`),0) AS `totalSeasons`,
      MAX(`files`.`dateAdded`) AS `dateAdded`
    FROM ((`tvshow` LEFT JOIN `episode` ON((`episode`.`idShow` = `tvshow`.`idShow`)))
      LEFT JOIN `files` ON((`files`.`idFile` = `episode`.`idFile`)))
    GROUP BY `tvshow`.`idShow`;

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshow_view` AS SELECT
      `tvshow`.`idShow` AS `idShow`,
      `tvshow`.`c00` AS `c00`,
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
    FROM (((((`tvshow` LEFT JOIN `tvshowlinkpath_minview` ON((`tvshowlinkpath_minview`.`idShow` = `tvshow`.`idShow`)))
      LEFT JOIN `path` ON((`path`.`idPath` = `tvshowlinkpath_minview`.`idPath`)))
      JOIN `tvshowcounts` ON((`tvshow`.`idShow` = `tvshowcounts`.`idShow`)))
      LEFT JOIN `rating` ON((`rating`.`rating_id` = `tvshow`.`c04`)))
      LEFT JOIN `uniqueid` ON((`uniqueid`.`uniqueid_id` = `tvshow`.`c12`)));

    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `season_view` AS SELECT
      `seasons`.`idSeason` AS `idSeason`,
      `seasons`.`idShow` AS `idShow`,
      `seasons`.`season` AS `season`,
      `seasons`.`name` AS `name`,
      `seasons`.`userrating` AS `userrating`,
      `tvshow_view`.`strPath` AS `strPath`,
      `tvshow_view`.`c00` AS `showTitle`,
      `tvshow_view`.`c01` AS `plot`,
      `tvshow_view`.`c05` AS `premiered`,
      `tvshow_view`.`c08` AS `genre`,
      `tvshow_view`.`c14` AS `studio`,
      `tvshow_view`.`c13` AS `mpaa`,
      COUNT(DISTINCT `episode`.`idEpisode`) AS `episodes`,
      COUNT(`files`.`playCount`) AS `playCount`,
      MIN(`episode`.`c05`) AS `aired`
    FROM (((`seasons` JOIN `tvshow_view` ON((`tvshow_view`.`idShow` = `seasons`.`idShow`)))
      JOIN `episode` ON(((`episode`.`idShow` = `seasons`.`idShow`) AND (`episode`.`c12` = `seasons`.`season`))))
      JOIN `files` ON((`files`.`idFile` = `episode`.`idFile`)))
    group by `seasons`.`idSeason`,
      `seasons`.`idShow`,
      `seasons`.`season`,
      `seasons`.`name`,
      `seasons`.`userrating`,
      `tvshow_view`.`strPath`,
      `tvshow_view`.`c00`,
      `tvshow_view`.`c01`,
      `tvshow_view`.`c05`,
      `tvshow_view`.`c08`,
      `tvshow_view`.`c14`,
      `tvshow_view`.`c13`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
