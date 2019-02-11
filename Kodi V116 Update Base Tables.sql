/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
USE `Kodi_U01_Video_116`;

  -- GLOBAL FILES --
  RENAME TABLE `files` TO `global_files`;
    -- USER 01 --
    ALTER TABLE `global_files` CHANGE playCount playCount_U01 INT(11);
    ALTER TABLE `global_files` CHANGE lastPlayed lastPlayed_U01 TEXT;
    -- USER 02 --
    ALTER TABLE `global_files` ADD playCount_U02 INT(11) AFTER lastPlayed_U01;
    ALTER TABLE `global_files` ADD lastPlayed_U02 TEXT AFTER playCount_U02;
    -- USER 03 --
    ALTER TABLE `global_files` ADD playCount_U03 INT(11) AFTER lastPlayed_U02;
    ALTER TABLE `global_files` ADD lastPlayed_U03 TEXT AFTER playCount_U03;
    -- USER 04 --
    ALTER TABLE `global_files` ADD playCount_U04 INT(11) AFTER lastPlayed_U03;
    ALTER TABLE `global_files` ADD lastPlayed_U04 TEXT AFTER playCount_U04;
    -- USER 05 --
    ALTER TABLE `global_files` ADD playCount_U05 INT(11) AFTER lastPlayed_U04;
    ALTER TABLE `global_files` ADD lastPlayed_U05 TEXT AFTER playCount_U05;
    -- USER 06 --
    ALTER TABLE `global_files` ADD playCount_U06 INT(11) AFTER lastPlayed_U05;
    ALTER TABLE `global_files` ADD lastPlayed_U06 TEXT AFTER playCount_U06;
    -- USER 07 --
    ALTER TABLE `global_files` ADD playCount_U07 INT(11) AFTER lastPlayed_U06;
    ALTER TABLE `global_files` ADD lastPlayed_U07 TEXT AFTER playCount_U07;
    -- USER 08 --
    ALTER TABLE `global_files` ADD playCount_U08 INT(11) AFTER lastPlayed_U07;
    ALTER TABLE `global_files` ADD lastPlayed_U08 TEXT AFTER playCount_U08;
    -- USER 09 --
    ALTER TABLE `global_files` ADD playCount_U09 INT(11) AFTER lastPlayed_U08;
    ALTER TABLE `global_files` ADD lastPlayed_U09 TEXT AFTER playCount_U09;
    -- FILES VIEW FOR U01 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `files`
    AS SELECT
      `global_files`.`idFile` AS `idFile`,
      `global_files`.`idPath` AS `idPath`,
      `global_files`.`strFilename` AS `strFilename`,
      `global_files`.`playCount_U01` AS `playCount`,
      `global_files`.`lastPlayed_U01` AS `lastPlayed`,
      `global_files`.`dateAdded` AS `dateAdded`
    FROM `global_files`;

  -- GLOBAL EPISODE --
  RENAME TABLE `episode` TO `global_episode`;
    -- USER 01 --
    ALTER TABLE `global_episode` CHANGE userrating userrating_U01 INT(11);
    -- USER 02 --
    ALTER TABLE `global_episode` ADD userrating_U02 INT(11) AFTER userrating_U01;
    -- USER 03 --
    ALTER TABLE `global_episode` ADD userrating_U03 INT(11) AFTER userrating_U02;
    -- USER 04 --
    ALTER TABLE `global_episode` ADD userrating_U04 INT(11) AFTER userrating_U03;
    -- USER 05 --
    ALTER TABLE `global_episode` ADD userrating_U05 INT(11) AFTER userrating_U04;
    -- USER 06 --
    ALTER TABLE `global_episode` ADD userrating_U06 INT(11) AFTER userrating_U05;
    -- USER 07 --
    ALTER TABLE `global_episode` ADD userrating_U07 INT(11) AFTER userrating_U06;
    -- USER 08 --
    ALTER TABLE `global_episode` ADD userrating_U08 INT(11) AFTER userrating_U07;
    -- USER 09 --
    ALTER TABLE `global_episode` ADD userrating_U09 INT(11) AFTER userrating_U08;
    -- EPISODE VIEW FOR U01 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `episode` AS SELECT
      `global_episode`.`idEpisode` AS `idEpisode`,
      `global_episode`.`idFile` AS `idFile`,
      `global_episode`.`c00` AS `c00`,
      `global_episode`.`c01` AS `c01`,
      `global_episode`.`c02` AS `c02`,
      `global_episode`.`c03` AS `c03`,
      `global_episode`.`c04` AS `c04`,
      `global_episode`.`c05` AS `c05`,
      `global_episode`.`c06` AS `c06`,
      `global_episode`.`c07` AS `c07`,
      `global_episode`.`c08` AS `c08`,
      `global_episode`.`c09` AS `c09`,
      `global_episode`.`c10` AS `c10`,
      `global_episode`.`c11` AS `c11`,
      `global_episode`.`c12` AS `c12`,
      `global_episode`.`c13` AS `c13`,
      `global_episode`.`c14` AS `c14`,
      `global_episode`.`c15` AS `c15`,
      `global_episode`.`c16` AS `c16`,
      `global_episode`.`c17` AS `c17`,
      `global_episode`.`c18` AS `c18`,
      `global_episode`.`c19` AS `c19`,
      `global_episode`.`c20` AS `c20`,
      `global_episode`.`c21` AS `c21`,
      `global_episode`.`c22` AS `c22`,
      `global_episode`.`c23` AS `c23`,
      `global_episode`.`idShow` AS `idShow`,
      `global_episode`.`userrating_U01` AS `userrating`,
      `global_episode`.`idSeason` AS `idSeason`
    FROM `global_episode`;

  -- GLOBAL SEASONS --
  RENAME TABLE `seasons` TO `global_seasons`;
    -- USER 01 --
    ALTER TABLE `global_seasons` CHANGE userrating userrating_U01 INT(11);
    -- USER 02 --
    ALTER TABLE `global_seasons` ADD userrating_U02 INT(11) AFTER userrating_U01;
    -- USER 03 --
    ALTER TABLE `global_seasons` ADD userrating_U03 INT(11) AFTER userrating_U02;
    -- USER 04 --
    ALTER TABLE `global_seasons` ADD userrating_U04 INT(11) AFTER userrating_U03;
    -- USER 05 --
    ALTER TABLE `global_seasons` ADD userrating_U05 INT(11) AFTER userrating_U04;
    -- USER 06 --
    ALTER TABLE `global_seasons` ADD userrating_U06 INT(11) AFTER userrating_U05;
    -- USER 07 --
    ALTER TABLE `global_seasons` ADD userrating_U07 INT(11) AFTER userrating_U06;
    -- USER 08 --
    ALTER TABLE `global_seasons` ADD userrating_U08 INT(11) AFTER userrating_U07;
    -- USER 09 --
    ALTER TABLE `global_seasons` ADD userrating_U09 INT(11) AFTER userrating_U08;
    -- SEASONS VIEW FOR U01 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `seasons` AS SELECT
      `global_seasons`.`idSeason` AS `idSeason`,
      `global_seasons`.`idShow` AS `idShow`,
      `global_seasons`.`season` AS `season`,
      `global_seasons`.`name` AS `name`,
      `global_seasons`.`userrating_U01` AS `userrating`
    FROM `global_seasons`;

  -- GLOBAL TVSHOWS --
  RENAME TABLE `tvshow` TO `global_tvshow`;
    -- USER 01 --
    ALTER TABLE `global_tvshow` CHANGE userrating userrating_U01 INT(11);
    -- USER 02 --
    ALTER TABLE `global_tvshow` ADD userrating_U02 INT(11) AFTER userrating_U01;
    -- USER 03 --
    ALTER TABLE `global_tvshow` ADD userrating_U03 INT(11) AFTER userrating_U02;
    -- USER 04 --
    ALTER TABLE `global_tvshow` ADD userrating_U04 INT(11) AFTER userrating_U03;
    -- USER 05 --
    ALTER TABLE `global_tvshow` ADD userrating_U05 INT(11) AFTER userrating_U04;
    -- USER 06 --
    ALTER TABLE `global_tvshow` ADD userrating_U06 INT(11) AFTER userrating_U05;
    -- USER 07 --
    ALTER TABLE `global_tvshow` ADD userrating_U07 INT(11) AFTER userrating_U06;
    -- USER 08 --
    ALTER TABLE `global_tvshow` ADD userrating_U08 INT(11) AFTER userrating_U07;
    -- USER 09 --
    ALTER TABLE `global_tvshow` ADD userrating_U09 INT(11) AFTER userrating_U08;
    -- TVSHOW VIEW FOR U01 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshow` AS SELECT
      `global_tvshow`.`idShow` AS `idShow`,
      `global_tvshow`.`c00` AS `c00`,
      `global_tvshow`.`c01` AS `c01`,
      `global_tvshow`.`c02` AS `c02`,
      `global_tvshow`.`c03` AS `c03`,
      `global_tvshow`.`c04` AS `c04`,
      `global_tvshow`.`c05` AS `c05`,
      `global_tvshow`.`c06` AS `c06`,
      `global_tvshow`.`c07` AS `c07`,
      `global_tvshow`.`c08` AS `c08`,
      `global_tvshow`.`c09` AS `c09`,
      `global_tvshow`.`c10` AS `c10`,
      `global_tvshow`.`c11` AS `c11`,
      `global_tvshow`.`c12` AS `c12`,
      `global_tvshow`.`c13` AS `c13`,
      `global_tvshow`.`c14` AS `c14`,
      `global_tvshow`.`c15` AS `c15`,
      `global_tvshow`.`c16` AS `c16`,
      `global_tvshow`.`c17` AS `c17`,
      `global_tvshow`.`c18` AS `c18`,
      `global_tvshow`.`c19` AS `c19`,
      `global_tvshow`.`c20` AS `c20`,
      `global_tvshow`.`c21` AS `c21`,
      `global_tvshow`.`c22` AS `c22`,
      `global_tvshow`.`c23` AS `c23`,
      `global_tvshow`.`userrating_U01` AS `userrating`,
      `global_tvshow`.`duration` AS `duration`
    FROM `global_tvshow`;

  -- GLOBAL MOVIE --
    RENAME TABLE `movie` TO `global_movie`;
    -- USER 01 --
    ALTER TABLE `global_movie` CHANGE userrating userrating_U01 INT(11);
    -- USER 02 --
    ALTER TABLE `global_movie` ADD userrating_U02 INT(11) AFTER userrating_U01;
    -- USER 03 --
    ALTER TABLE `global_movie` ADD userrating_U03 INT(11) AFTER userrating_U02;
    -- USER 04 --
    ALTER TABLE `global_movie` ADD userrating_U04 INT(11) AFTER userrating_U03;
    -- USER 05 --
    ALTER TABLE `global_movie` ADD userrating_U05 INT(11) AFTER userrating_U04;
    -- USER 06 --
    ALTER TABLE `global_movie` ADD userrating_U06 INT(11) AFTER userrating_U05;
    -- USER 07 --
    ALTER TABLE `global_movie` ADD userrating_U07 INT(11) AFTER userrating_U06;
    -- USER 08 --
    ALTER TABLE `global_movie` ADD userrating_U08 INT(11) AFTER userrating_U07;
    -- USER 09 --
    ALTER TABLE `global_movie` ADD userrating_U09 INT(11) AFTER userrating_U08;
    -- MOVIE VIEW FOR U01 --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `movie` AS SELECT
      `global_movie`.`idMovie` AS `idMovie`,
      `global_movie`.`idFile` AS `idFile`,
      `global_movie`.`c00` AS `c00`,
      `global_movie`.`c01` AS `c01`,
      `global_movie`.`c02` AS `c02`,
      `global_movie`.`c03` AS `c03`,
      `global_movie`.`c04` AS `c04`,
      `global_movie`.`c05` AS `c05`,
      `global_movie`.`c06` AS `c06`,
      `global_movie`.`c07` AS `c07`,
      `global_movie`.`c08` AS `c08`,
      `global_movie`.`c09` AS `c09`,
      `global_movie`.`c10` AS `c10`,
      `global_movie`.`c11` AS `c11`,
      `global_movie`.`c12` AS `c12`,
      `global_movie`.`c13` AS `c13`,
      `global_movie`.`c14` AS `c14`,
      `global_movie`.`c15` AS `c15`,
      `global_movie`.`c16` AS `c16`,
      `global_movie`.`c17` AS `c17`,
      `global_movie`.`c18` AS `c18`,
      `global_movie`.`c19` AS `c19`,
      `global_movie`.`c20` AS `c20`,
      `global_movie`.`c21` AS `c21`,
      `global_movie`.`c22` AS `c22`,
      `global_movie`.`c23` AS `c23`,
      `global_movie`.`idSet` AS `idSet`,
      `global_movie`.`userrating_U01` AS `userrating`,
      `global_movie`.`premiered` AS `premiered`
    FROM `global_movie`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;[/syntax]
