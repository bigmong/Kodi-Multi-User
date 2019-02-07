/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE IF NOT EXISTS `Kodi_U01_Video_116` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON `Kodi\_U01\_Video\_116`.* TO 'KODI_18'@'%' WITH GRANT OPTION;
USE `Kodi_U01_Video_116`;

  -- actor --
  CREATE TABLE IF NOT EXISTS `actor` (
    `actor_id` int(11) NOT NULL,
    `name` text,
    `art_urls` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `actor` ADD PRIMARY KEY (`actor_id`), ADD UNIQUE KEY `ix_actor_1` (`name`(255));
  ALTER TABLE `actor` MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT;

  -- actor_link --
  CREATE TABLE IF NOT EXISTS `actor_link` (
    `actor_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text,
    `role` text,
    `cast_order` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `actor_link` ADD UNIQUE KEY `ix_actor_link_1` (`actor_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_actor_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_actor_link_3` (`media_type`(20));

  -- art --
  CREATE TABLE IF NOT EXISTS `art` (
    `art_id` int(11) NOT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text,
    `type` text,
    `url` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `art` ADD PRIMARY KEY (`art_id`), ADD KEY `ix_art` (`media_id`,`media_type`(20),`type`(20));
  ALTER TABLE `art` MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT;

  -- bookmark --
  CREATE TABLE IF NOT EXISTS `bookmark` (
    `idBookmark` int(11) NOT NULL,
    `idFile` int(11) DEFAULT NULL,
    `timeInSeconds` double DEFAULT NULL,
    `totalTimeInSeconds` double DEFAULT NULL,
    `thumbNailImage` text,
    `player` text,
    `playerState` text,
    `type` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `bookmark` ADD PRIMARY KEY (`idBookmark`), ADD KEY `ix_bookmark` (`idFile`,`type`);
  ALTER TABLE `bookmark` MODIFY `idBookmark` int(11) NOT NULL AUTO_INCREMENT;

  -- country --
  CREATE TABLE IF NOT EXISTS `country` (
    `country_id` int(11) NOT NULL,
    `name` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `country` ADD PRIMARY KEY (`country_id`), ADD UNIQUE KEY `ix_country_1` (`name`(255));
  ALTER TABLE `country` MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

  -- country_link --
  CREATE TABLE IF NOT EXISTS `country_link` (
    `country_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `country_link` ADD UNIQUE KEY `ix_country_link_1` (`country_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_country_link_2` (`media_id`,`media_type`(20),`country_id`), ADD KEY `ix_country_link_3` (`media_type`(20));

  -- director_link --
  CREATE TABLE IF NOT EXISTS `director_link` (
    `actor_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `director_link` ADD UNIQUE KEY `ix_director_link_1` (`actor_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_director_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_director_link_3` (`media_type`(20));

  -- episode --
  CREATE TABLE IF NOT EXISTS `episode` (
    `idEpisode` int(11) NOT NULL,
    `idFile` int(11) DEFAULT NULL,
    `c00` text,
    `c01` text,
    `c02` text,
    `c03` text,
    `c04` text,
    `c05` text,
    `c06` text,
    `c07` text,
    `c08` text,
    `c09` text,
    `c10` text,
    `c11` text,
    `c12` varchar(24) DEFAULT NULL,
    `c13` varchar(24) DEFAULT NULL,
    `c14` text,
    `c15` text,
    `c16` text,
    `c17` varchar(24) DEFAULT NULL,
    `c18` text,
    `c19` text,
    `c20` text,
    `c21` text,
    `c22` text,
    `c23` text,
    `idShow` int(11) DEFAULT NULL,
    `userrating` int(11) DEFAULT NULL,
    `idSeason` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `episode` ADD PRIMARY KEY (`idEpisode`), ADD UNIQUE KEY `ix_episode_file_1` (`idEpisode`,`idFile`), ADD UNIQUE KEY `id_episode_file_2` (`idFile`,`idEpisode`), ADD KEY `ix_episode_season_episode` (`c12`,`c13`), ADD KEY `ix_episode_bookmark` (`c17`), ADD KEY `ix_episode_show1` (`idEpisode`,`idShow`), ADD KEY `ix_episode_show2` (`idShow`,`idEpisode`), ADD KEY `ixEpisodeBasePath` (`c19`(12));
  ALTER TABLE `episode` MODIFY `idEpisode` int(11) NOT NULL AUTO_INCREMENT;

  -- files --
  CREATE TABLE IF NOT EXISTS `files` (
    `idFile` int(11) NOT NULL,
    `idPath` int(11) DEFAULT NULL,
    `strFilename` text,
    `playCount` int(11) DEFAULT NULL,
    `lastPlayed` text,
    `dateAdded` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `files` ADD PRIMARY KEY (`idFile`), ADD KEY `ix_files` (`idPath`,`strFilename`(255));
  ALTER TABLE `files` MODIFY `idFile` int(11) NOT NULL AUTO_INCREMENT;

  -- genre --
  CREATE TABLE IF NOT EXISTS `genre` (
    `genre_id` int(11) NOT NULL,
    `name` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `genre` ADD PRIMARY KEY (`genre_id`), ADD UNIQUE KEY `ix_genre_1` (`name`(255));
  ALTER TABLE `genre` MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT;

  -- genre_link --
  CREATE TABLE IF NOT EXISTS `genre_link` (
    `genre_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `genre_link` ADD UNIQUE KEY `ix_genre_link_1` (`genre_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_genre_link_2` (`media_id`,`media_type`(20),`genre_id`), ADD KEY `ix_genre_link_3` (`media_type`(20));

  -- movie --
  CREATE TABLE IF NOT EXISTS `movie` (
    `idMovie` int(11) NOT NULL,
    `idFile` int(11) DEFAULT NULL,
    `c00` text,
    `c01` text,
    `c02` text,
    `c03` text,
    `c04` text,
    `c05` text,
    `c06` text,
    `c07` text,
    `c08` text,
    `c09` text,
    `c10` text,
    `c11` text,
    `c12` text,
    `c13` text,
    `c14` text,
    `c15` text,
    `c16` text,
    `c17` text,
    `c18` text,
    `c19` text,
    `c20` text,
    `c21` text,
    `c22` text,
    `c23` text,
    `idSet` int(11) DEFAULT NULL,
    `userrating` int(11) DEFAULT NULL,
    `premiered` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `movie` ADD PRIMARY KEY (`idMovie`), ADD UNIQUE KEY `ix_movie_file_1` (`idFile`,`idMovie`), ADD UNIQUE KEY `ix_movie_file_2` (`idMovie`,`idFile`), ADD KEY `ixMovieBasePath` (`c23`(12));
  ALTER TABLE `movie` MODIFY `idMovie` int(11) NOT NULL AUTO_INCREMENT;

  -- movielinktvshow --
  CREATE TABLE IF NOT EXISTS `movielinktvshow` (
    `idMovie` int(11) DEFAULT NULL,
    `IdShow` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `movielinktvshow` ADD UNIQUE KEY `ix_movielinktvshow_1` (`IdShow`,`idMovie`), ADD UNIQUE KEY `ix_movielinktvshow_2` (`idMovie`,`IdShow`);

  -- musicvideo --
  CREATE TABLE IF NOT EXISTS `musicvideo` (
    `idMVideo` int(11) NOT NULL,
    `idFile` int(11) DEFAULT NULL,
    `c00` text,
    `c01` text,
    `c02` text,
    `c03` text,
    `c04` text,
    `c05` text,
    `c06` text,
    `c07` text,
    `c08` text,
    `c09` text,
    `c10` text,
    `c11` text,
    `c12` text,
    `c13` text,
    `c14` text,
    `c15` text,
    `c16` text,
    `c17` text,
    `c18` text,
    `c19` text,
    `c20` text,
    `c21` text,
    `c22` text,
    `c23` text,
    `userrating` int(11) DEFAULT NULL,
    `premiered` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `musicvideo` ADD PRIMARY KEY (`idMVideo`), ADD UNIQUE KEY `ix_musicvideo_file_1` (`idMVideo`,`idFile`), ADD UNIQUE KEY `ix_musicvideo_file_2` (`idFile`,`idMVideo`), ADD KEY `ixMusicVideoBasePath` (`c14`(12));
  ALTER TABLE `musicvideo` MODIFY `idMVideo` int(11) NOT NULL AUTO_INCREMENT;

  -- path --
  CREATE TABLE IF NOT EXISTS `path` (
    `idPath` int(11) NOT NULL,
    `strPath` text,
    `strContent` text,
    `strScraper` text,
    `strHash` text,
    `scanRecursive` int(11) DEFAULT NULL,
    `useFolderNames` tinyint(1) DEFAULT NULL,
    `strSettings` text,
    `noUpdate` tinyint(1) DEFAULT NULL,
    `exclude` tinyint(1) DEFAULT NULL,
    `dateAdded` text,
    `idParentPath` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `path` ADD PRIMARY KEY (`idPath`), ADD KEY `ix_path` (`strPath`(255)), ADD KEY `ix_path2` (`idParentPath`);
  ALTER TABLE `path` MODIFY `idPath` int(11) NOT NULL AUTO_INCREMENT;

  -- rating --
  CREATE TABLE IF NOT EXISTS `rating` (
    `rating_id` int(11) NOT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text,
    `rating_type` text,
    `rating` float DEFAULT NULL,
    `votes` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `rating` ADD PRIMARY KEY (`rating_id`), ADD KEY `ix_rating` (`media_id`,`media_type`(20));
  ALTER TABLE `rating` MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

  -- seasons --
  CREATE TABLE IF NOT EXISTS `seasons` (
    `idSeason` int(11) NOT NULL,
    `idShow` int(11) DEFAULT NULL,
    `season` int(11) DEFAULT NULL,
    `name` text,
    `userrating` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `seasons` ADD PRIMARY KEY (`idSeason`), ADD KEY `ix_seasons` (`idShow`,`season`);
  ALTER TABLE `seasons` MODIFY `idSeason` int(11) NOT NULL AUTO_INCREMENT;

  -- sets --
  CREATE TABLE IF NOT EXISTS `sets` (
    `idSet` int(11) NOT NULL,
    `strSet` text,
    `strOverview` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `sets` ADD PRIMARY KEY (`idSet`);
  ALTER TABLE `sets` MODIFY `idSet` int(11) NOT NULL AUTO_INCREMENT;

  -- settings --
  CREATE TABLE IF NOT EXISTS `settings` (
    `idFile` int(11) DEFAULT NULL,
    `Deinterlace` tinyint(1) DEFAULT NULL,
    `ViewMode` int(11) DEFAULT NULL,
    `ZoomAmount` float DEFAULT NULL,
    `PixelRatio` float DEFAULT NULL,
    `VerticalShift` float DEFAULT NULL,
    `AudioStream` int(11) DEFAULT NULL,
    `SubtitleStream` int(11) DEFAULT NULL,
    `SubtitleDelay` float DEFAULT NULL,
    `SubtitlesOn` tinyint(1) DEFAULT NULL,
    `Brightness` float DEFAULT NULL,
    `Contrast` float DEFAULT NULL,
    `Gamma` float DEFAULT NULL,
    `VolumeAmplification` float DEFAULT NULL,
    `AudioDelay` float DEFAULT NULL,
    `ResumeTime` int(11) DEFAULT NULL,
    `Sharpness` float DEFAULT NULL,
    `NoiseReduction` float DEFAULT NULL,
    `NonLinStretch` tinyint(1) DEFAULT NULL,
    `PostProcess` tinyint(1) DEFAULT NULL,
    `ScalingMethod` int(11) DEFAULT NULL,
    `DeinterlaceMode` int(11) DEFAULT NULL,
    `StereoMode` int(11) DEFAULT NULL,
    `StereoInvert` tinyint(1) DEFAULT NULL,
    `VideoStream` int(11) DEFAULT NULL,
    `TonemapMethod` int(11) DEFAULT NULL,
    `TonemapParam` float DEFAULT NULL,
    `Orientation` int(11) DEFAULT NULL,
    `CenterMixLevel` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `settings` ADD UNIQUE KEY `ix_settings` (`idFile`);

  -- stacktimes --
  CREATE TABLE IF NOT EXISTS `stacktimes` (
    `idFile` int(11) DEFAULT NULL,
    `times` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `stacktimes` ADD UNIQUE KEY `ix_stacktimes` (`idFile`);

  -- streamdetails --
  CREATE TABLE IF NOT EXISTS `streamdetails` (
    `idFile` int(11) DEFAULT NULL,
    `iStreamType` int(11) DEFAULT NULL,
    `strVideoCodec` text,
    `fVideoAspect` float DEFAULT NULL,
    `iVideoWidth` int(11) DEFAULT NULL,
    `iVideoHeight` int(11) DEFAULT NULL,
    `strAudioCodec` text,
    `iAudioChannels` int(11) DEFAULT NULL,
    `strAudioLanguage` text,
    `strSubtitleLanguage` text,
    `iVideoDuration` int(11) DEFAULT NULL,
    `strStereoMode` text,
    `strVideoLanguage` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `streamdetails` ADD KEY `ix_streamdetails` (`idFile`);

  -- studio --
  CREATE TABLE IF NOT EXISTS `studio` (
    `studio_id` int(11) NOT NULL,
    `name` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `studio` ADD PRIMARY KEY (`studio_id`), ADD UNIQUE KEY `ix_studio_1` (`name`(255));
  ALTER TABLE `studio` MODIFY `studio_id` int(11) NOT NULL AUTO_INCREMENT;

  -- studio_link --
  CREATE TABLE IF NOT EXISTS `studio_link` (
    `studio_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `studio_link` ADD UNIQUE KEY `ix_studio_link_1` (`studio_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_studio_link_2` (`media_id`,`media_type`(20),`studio_id`), ADD KEY `ix_studio_link_3` (`media_type`(20));

  -- tag --
  CREATE TABLE IF NOT EXISTS `tag` (
    `tag_id` int(11) NOT NULL,
    `name` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `tag` ADD PRIMARY KEY (`tag_id`), ADD UNIQUE KEY `ix_tag_1` (`name`(255));
  ALTER TABLE `tag` MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;

  -- tag_link --
  CREATE TABLE IF NOT EXISTS `tag_link` (
    `tag_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `tag_link` ADD UNIQUE KEY `ix_tag_link_1` (`tag_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_tag_link_2` (`media_id`,`media_type`(20),`tag_id`), ADD KEY `ix_tag_link_3` (`media_type`(20));

  -- tvshow --
  CREATE TABLE IF NOT EXISTS `tvshow` (
    `idShow` int(11) NOT NULL,
    `c00` text,
    `c01` text,
    `c02` text,
    `c03` text,
    `c04` text,
    `c05` text,
    `c06` text,
    `c07` text,
    `c08` text,
    `c09` text,
    `c10` text,
    `c11` text,
    `c12` text,
    `c13` text,
    `c14` text,
    `c15` text,
    `c16` text,
    `c17` text,
    `c18` text,
    `c19` text,
    `c20` text,
    `c21` text,
    `c22` text,
    `c23` text,
    `userrating` int(11) DEFAULT NULL,
    `duration` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `tvshow` ADD PRIMARY KEY (`idShow`);
  ALTER TABLE `tvshow` MODIFY `idShow` int(11) NOT NULL AUTO_INCREMENT;

  -- tvshowlinkpath --
  CREATE TABLE IF NOT EXISTS `tvshowlinkpath` (
    `idShow` int(11) DEFAULT NULL,
    `idPath` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `tvshowlinkpath` ADD UNIQUE KEY `ix_tvshowlinkpath_1` (`idShow`,`idPath`), ADD UNIQUE KEY `ix_tvshowlinkpath_2` (`idPath`,`idShow`);

  -- uniqueid --
  CREATE TABLE IF NOT EXISTS `uniqueid` (
    `uniqueid_id` int(11) NOT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text,
    `value` text,
    `type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `uniqueid` ADD PRIMARY KEY (`uniqueid_id`), ADD KEY `ix_uniqueid1` (`media_id`,`media_type`(20),`type`(20)), ADD KEY `ix_uniqueid2` (`media_type`(20),`value`(20));
  ALTER TABLE `uniqueid` MODIFY `uniqueid_id` int(11) NOT NULL AUTO_INCREMENT;

  -- version --
  CREATE TABLE IF NOT EXISTS `version` (
    `idVersion` int(11) DEFAULT NULL,
    `iCompressCount` int(11) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  INSERT INTO `version` (`idVersion`, `iCompressCount`) VALUES (116, 0);

  -- writer_link --
  CREATE TABLE IF NOT EXISTS `writer_link` (
    `actor_id` int(11) DEFAULT NULL,
    `media_id` int(11) DEFAULT NULL,
    `media_type` text
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  ALTER TABLE `writer_link` ADD UNIQUE KEY `ix_writer_link_1` (`actor_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_writer_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_writer_link_3` (`media_type`(20));

  -- views --
    -- episode_view --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `episode_view` AS select `episode`.`idEpisode` AS `idEpisode`,`episode`.`idFile` AS `idFile`,`episode`.`c00` AS `c00`,`episode`.`c01` AS `c01`,`episode`.`c02` AS `c02`,`episode`.`c03` AS `c03`,`episode`.`c04` AS `c04`,`episode`.`c05` AS `c05`,`episode`.`c06` AS `c06`,`episode`.`c07` AS `c07`,`episode`.`c08` AS `c08`,`episode`.`c09` AS `c09`,`episode`.`c10` AS `c10`,`episode`.`c11` AS `c11`,`episode`.`c12` AS `c12`,`episode`.`c13` AS `c13`,`episode`.`c14` AS `c14`,`episode`.`c15` AS `c15`,`episode`.`c16` AS `c16`,`episode`.`c17` AS `c17`,`episode`.`c18` AS `c18`,`episode`.`c19` AS `c19`,`episode`.`c20` AS `c20`,`episode`.`c21` AS `c21`,`episode`.`c22` AS `c22`,`episode`.`c23` AS `c23`,`episode`.`idShow` AS `idShow`,`episode`.`userrating` AS `userrating`,`episode`.`idSeason` AS `idSeason`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`tvshow`.`c00` AS `strTitle`,`tvshow`.`c08` AS `genre`,`tvshow`.`c14` AS `studio`,`tvshow`.`c05` AS `premiered`,`tvshow`.`c13` AS `mpaa`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,`bookmark`.`playerState` AS `playerState`,`rating`.`rating` AS `rating`,`rating`.`votes` AS `votes`,`rating`.`rating_type` AS `rating_type`,`uniqueid`.`value` AS `uniqueid_value`,`uniqueid`.`type` AS `uniqueid_type` from (((((((`episode` join `files` on((`files`.`idFile` = `episode`.`idFile`))) join `tvshow` on((`tvshow`.`idShow` = `episode`.`idShow`))) join `seasons` on((`seasons`.`idSeason` = `episode`.`idSeason`))) join `path` on((`files`.`idPath` = `path`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `episode`.`idFile`) and (`bookmark`.`type` = 1)))) left join `rating` on((`rating`.`rating_id` = `episode`.`c03`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `episode`.`c20`)));
    -- movie_view --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `movie_view` AS select `movie`.`idMovie` AS `idMovie`,`movie`.`idFile` AS `idFile`,`movie`.`c00` AS `c00`,`movie`.`c01` AS `c01`,`movie`.`c02` AS `c02`,`movie`.`c03` AS `c03`,`movie`.`c04` AS `c04`,`movie`.`c05` AS `c05`,`movie`.`c06` AS `c06`,`movie`.`c07` AS `c07`,`movie`.`c08` AS `c08`,`movie`.`c09` AS `c09`,`movie`.`c10` AS `c10`,`movie`.`c11` AS `c11`,`movie`.`c12` AS `c12`,`movie`.`c13` AS `c13`,`movie`.`c14` AS `c14`,`movie`.`c15` AS `c15`,`movie`.`c16` AS `c16`,`movie`.`c17` AS `c17`,`movie`.`c18` AS `c18`,`movie`.`c19` AS `c19`,`movie`.`c20` AS `c20`,`movie`.`c21` AS `c21`,`movie`.`c22` AS `c22`,`movie`.`c23` AS `c23`,`movie`.`idSet` AS `idSet`,`movie`.`userrating` AS `userrating`,`movie`.`premiered` AS `premiered`,`sets`.`strSet` AS `strSet`,`sets`.`strOverview` AS `strSetOverview`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,`bookmark`.`playerState` AS `playerState`,`rating`.`rating` AS `rating`,`rating`.`votes` AS `votes`,`rating`.`rating_type` AS `rating_type`,`uniqueid`.`value` AS `uniqueid_value`,`uniqueid`.`type` AS `uniqueid_type` from ((((((`movie` left join `sets` on((`sets`.`idSet` = `movie`.`idSet`))) join `files` on((`files`.`idFile` = `movie`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `movie`.`idFile`) and (`bookmark`.`type` = 1)))) left join `rating` on((`rating`.`rating_id` = `movie`.`c05`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `movie`.`c09`)));
    -- musicvideo_view --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `musicvideo_view` AS select `musicvideo`.`idMVideo` AS `idMVideo`,`musicvideo`.`idFile` AS `idFile`,`musicvideo`.`c00` AS `c00`,`musicvideo`.`c01` AS `c01`,`musicvideo`.`c02` AS `c02`,`musicvideo`.`c03` AS `c03`,`musicvideo`.`c04` AS `c04`,`musicvideo`.`c05` AS `c05`,`musicvideo`.`c06` AS `c06`,`musicvideo`.`c07` AS `c07`,`musicvideo`.`c08` AS `c08`,`musicvideo`.`c09` AS `c09`,`musicvideo`.`c10` AS `c10`,`musicvideo`.`c11` AS `c11`,`musicvideo`.`c12` AS `c12`,`musicvideo`.`c13` AS `c13`,`musicvideo`.`c14` AS `c14`,`musicvideo`.`c15` AS `c15`,`musicvideo`.`c16` AS `c16`,`musicvideo`.`c17` AS `c17`,`musicvideo`.`c18` AS `c18`,`musicvideo`.`c19` AS `c19`,`musicvideo`.`c20` AS `c20`,`musicvideo`.`c21` AS `c21`,`musicvideo`.`c22` AS `c22`,`musicvideo`.`c23` AS `c23`,`musicvideo`.`userrating` AS `userrating`,`musicvideo`.`premiered` AS `premiered`,`files`.`strFilename` AS `strFileName`,`path`.`strPath` AS `strPath`,`files`.`playCount` AS `playCount`,`files`.`lastPlayed` AS `lastPlayed`,`files`.`dateAdded` AS `dateAdded`,`bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`,`bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`,`bookmark`.`playerState` AS `playerState` from (((`musicvideo` join `files` on((`files`.`idFile` = `musicvideo`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `musicvideo`.`idFile`) and (`bookmark`.`type` = 1))));
    -- tvshowlinkpath_minview --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshowlinkpath_minview` AS select `tvshowlinkpath`.`idShow` AS `idShow`,min(`tvshowlinkpath`.`idPath`) AS `idPath` from `tvshowlinkpath` group by `tvshowlinkpath`.`idShow`;
    -- tvshowcounts --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshowcounts` AS select `tvshow`.`idShow` AS `idShow`,max(`files`.`lastPlayed`) AS `lastPlayed`,nullif(count(`episode`.`c12`),0) AS `totalCount`,count(`files`.`playCount`) AS `watchedcount`,nullif(count(distinct `episode`.`c12`),0) AS `totalSeasons`,max(`files`.`dateAdded`) AS `dateAdded` from ((`tvshow` left join `episode` on((`episode`.`idShow` = `tvshow`.`idShow`))) left join `files` on((`files`.`idFile` = `episode`.`idFile`))) group by `tvshow`.`idShow`;
    -- tvshow_view --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `tvshow_view` AS select `tvshow`.`idShow` AS `idShow`,`tvshow`.`c00` AS `c00`,`tvshow`.`c01` AS `c01`,`tvshow`.`c02` AS `c02`,`tvshow`.`c03` AS `c03`,`tvshow`.`c04` AS `c04`,`tvshow`.`c05` AS `c05`,`tvshow`.`c06` AS `c06`,`tvshow`.`c07` AS `c07`,`tvshow`.`c08` AS `c08`,`tvshow`.`c09` AS `c09`,`tvshow`.`c10` AS `c10`,`tvshow`.`c11` AS `c11`,`tvshow`.`c12` AS `c12`,`tvshow`.`c13` AS `c13`,`tvshow`.`c14` AS `c14`,`tvshow`.`c15` AS `c15`,`tvshow`.`c16` AS `c16`,`tvshow`.`c17` AS `c17`,`tvshow`.`c18` AS `c18`,`tvshow`.`c19` AS `c19`,`tvshow`.`c20` AS `c20`,`tvshow`.`c21` AS `c21`,`tvshow`.`c22` AS `c22`,`tvshow`.`c23` AS `c23`,`tvshow`.`userrating` AS `userrating`,`tvshow`.`duration` AS `duration`,`path`.`idParentPath` AS `idParentPath`,`path`.`strPath` AS `strPath`,`tvshowcounts`.`dateAdded` AS `dateAdded`,`tvshowcounts`.`lastPlayed` AS `lastPlayed`,`tvshowcounts`.`totalCount` AS `totalCount`,`tvshowcounts`.`watchedcount` AS `watchedcount`,`tvshowcounts`.`totalSeasons` AS `totalSeasons`,`rating`.`rating` AS `rating`,`rating`.`votes` AS `votes`,`rating`.`rating_type` AS `rating_type`,`uniqueid`.`value` AS `uniqueid_value`,`uniqueid`.`type` AS `uniqueid_type` from (((((`tvshow` left join `tvshowlinkpath_minview` on((`tvshowlinkpath_minview`.`idShow` = `tvshow`.`idShow`))) left join `path` on((`path`.`idPath` = `tvshowlinkpath_minview`.`idPath`))) join `tvshowcounts` on((`tvshow`.`idShow` = `tvshowcounts`.`idShow`))) left join `rating` on((`rating`.`rating_id` = `tvshow`.`c04`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `tvshow`.`c12`)));
    -- season_view --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_18`@`%` SQL SECURITY DEFINER VIEW `season_view` AS select `seasons`.`idSeason` AS `idSeason`,`seasons`.`idShow` AS `idShow`,`seasons`.`season` AS `season`,`seasons`.`name` AS `name`,`seasons`.`userrating` AS `userrating`,`tvshow_view`.`strPath` AS `strPath`,`tvshow_view`.`c00` AS `showTitle`,`tvshow_view`.`c01` AS `plot`,`tvshow_view`.`c05` AS `premiered`,`tvshow_view`.`c08` AS `genre`,`tvshow_view`.`c14` AS `studio`,`tvshow_view`.`c13` AS `mpaa`,count(distinct `episode`.`idEpisode`) AS `episodes`,count(`files`.`playCount`) AS `playCount`,min(`episode`.`c05`) AS `aired` from (((`seasons` join `tvshow_view` on((`tvshow_view`.`idShow` = `seasons`.`idShow`))) join `episode` on(((`episode`.`idShow` = `seasons`.`idShow`) and (`episode`.`c12` = `seasons`.`season`)))) join `files` on((`files`.`idFile` = `episode`.`idFile`))) group by `seasons`.`idSeason`,`seasons`.`idShow`,`seasons`.`season`,`seasons`.`name`,`seasons`.`userrating`,`tvshow_view`.`strPath`,`tvshow_view`.`c00`,`tvshow_view`.`c01`,`tvshow_view`.`c05`,`tvshow_view`.`c08`,`tvshow_view`.`c14`,`tvshow_view`.`c13`;

  -- triggers --
  DROP TRIGGER IF EXISTS `delete_person`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_person` AFTER DELETE ON `actor`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.actor_id AND media_type IN ('actor','artist','writer','director');
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_episode`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_episode` AFTER DELETE ON `episode`
  FOR EACH ROW
  BEGIN
    DELETE FROM actor_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM director_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM writer_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM art WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM rating WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM uniqueid WHERE media_id=old.idEpisode AND media_type='episode';
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_file`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_file` AFTER DELETE ON `files`
  FOR EACH ROW
  BEGIN
    DELETE FROM bookmark WHERE idFile=old.idFile;
    DELETE FROM settings WHERE idFile=old.idFile;
    DELETE FROM stacktimes WHERE idFile=old.idFile;
    DELETE FROM streamdetails WHERE idFile=old.idFile;
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_movie`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_movie` AFTER DELETE ON `movie`
  FOR EACH ROW
  BEGIN
    DELETE FROM genre_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM actor_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM director_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM studio_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM country_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM writer_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM movielinktvshow WHERE idMovie=old.idMovie;
    DELETE FROM art WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM tag_link WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM rating WHERE media_id=old.idMovie AND media_type='movie';
    DELETE FROM uniqueid WHERE media_id=old.idMovie AND media_type='movie';
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_musicvideo`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_musicvideo` AFTER DELETE ON `musicvideo`
  FOR EACH ROW
  BEGIN
    DELETE FROM actor_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM director_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM genre_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM studio_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM art WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM tag_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_season`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_season` AFTER DELETE ON `seasons`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.idSeason AND media_type='season';
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_set`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_set` AFTER DELETE ON `sets`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.idSet AND media_type='set';
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_tag`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_tag` AFTER DELETE ON `tag_link`
  FOR EACH ROW
  BEGIN
    DELETE FROM tag WHERE tag_id=old.tag_id AND tag_id NOT IN (SELECT DISTINCT tag_id FROM tag_link);
  END$$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_tvshow`;
  DELIMITER $$
  CREATE DEFINER=`KODI_18`@`%` TRIGGER `delete_tvshow` AFTER DELETE ON `tvshow`
  FOR EACH ROW
  BEGIN
    DELETE FROM actor_link WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM director_link WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM studio_link WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM tvshowlinkpath WHERE idShow=old.idShow;
    DELETE FROM genre_link WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM movielinktvshow WHERE idShow=old.idShow;
    DELETE FROM seasons WHERE idShow=old.idShow;
    DELETE FROM art WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM tag_link WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM rating WHERE media_id=old.idShow AND media_type='tvshow';
    DELETE FROM uniqueid WHERE media_id=old.idShow AND media_type='tvshow';
  END$$
  DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
