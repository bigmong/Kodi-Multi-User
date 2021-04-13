-----------------------------
-- VARIABLES TO CHANGE
-- DATABASE: Kodi_U01_Video_119
-- USER ACCOUNT: KODI_19
-----------------------------
DELIMITER ;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- CREATE DATABASE --
CREATE DATABASE IF NOT EXISTS `Kodi_U01_Video_119` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- SET USER ACCESS --
GRANT ALL PRIVILEGES ON `Kodi_U01_Video_119`.* TO 'KODI_19'@'%' WITH GRANT OPTION;
-- SET ACTIVE DATABASE --
USE `Kodi_U01_Video_119`;

  -- TABLE STRUCTURE FOR TABLES --
    -- ACTOR --
    CREATE TABLE `actor` (
      `actor_id` int NOT NULL,
      `name` text,
      `art_urls` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `actor` ADD PRIMARY KEY (`actor_id`), ADD UNIQUE KEY `ix_actor_1` (`name`(255));
    ALTER TABLE `actor` MODIFY `actor_id` int NOT NULL AUTO_INCREMENT;

    -- ACTOR_LINK --
    CREATE TABLE `actor_link` (
      `actor_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text,
      `role` text,
      `cast_order` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `actor_link` ADD UNIQUE KEY `ix_actor_link_1` (`actor_id`,`media_type`(20),`media_id`,`role`(255)), ADD KEY `ix_actor_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_actor_link_3` (`media_type`(20));

    -- ART --
    CREATE TABLE `art` (
      `art_id` int NOT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text,
      `type` text,
      `url` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `art` ADD PRIMARY KEY (`art_id`), ADD KEY `ix_art` (`media_id`,`media_type`(20),`type`(20));
    ALTER TABLE `art` MODIFY `art_id` int NOT NULL AUTO_INCREMENT;

    -- BOOKMARK --
    CREATE TABLE `bookmark` (
      `idBookmark` int NOT NULL,
      `idFile` int DEFAULT NULL,
      `timeInSeconds` double DEFAULT NULL,
      `totalTimeInSeconds` double DEFAULT NULL,
      `thumbNailImage` text,
      `player` text,
      `playerState` text,
      `type` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `bookmark` ADD PRIMARY KEY (`idBookmark`), ADD KEY `ix_bookmark` (`idFile`,`type`);
    ALTER TABLE `bookmark` MODIFY `idBookmark` int NOT NULL AUTO_INCREMENT;

    -- COUNTRY --
    CREATE TABLE `country` (
      `country_id` int NOT NULL,
      `name` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `country` ADD PRIMARY KEY (`country_id`), ADD UNIQUE KEY `ix_country_1` (`name`(255));
    ALTER TABLE `country` MODIFY `country_id` int NOT NULL AUTO_INCREMENT;

    -- COUNTRY_LINK --
    CREATE TABLE `country_link` (
      `country_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `country_link` ADD UNIQUE KEY `ix_country_link_1` (`country_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_country_link_2` (`media_id`,`media_type`(20),`country_id`), ADD KEY `ix_country_link_3` (`media_type`(20));

    -- DIRECTOR_LINK --
    CREATE TABLE `director_link` (
      `actor_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `director_link` ADD UNIQUE KEY `ix_director_link_1` (`actor_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_director_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_director_link_3` (`media_type`(20));

    -- EPISODE --
    CREATE TABLE `episode` (
      `idEpisode` int NOT NULL,
      `idFile` int DEFAULT NULL,
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
      `idShow` int DEFAULT NULL,
      `userrating` int DEFAULT NULL,
      `idSeason` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `episode` ADD PRIMARY KEY (`idEpisode`), ADD UNIQUE KEY `ix_episode_file_1` (`idEpisode`,`idFile`), ADD UNIQUE KEY `id_episode_file_2` (`idFile`,`idEpisode`), ADD KEY `ix_episode_season_episode` (`c12`,`c13`), ADD KEY `ix_episode_bookmark` (`c17`), ADD KEY `ix_episode_show1` (`idEpisode`,`idShow`), ADD KEY `ix_episode_show2` (`idShow`,`idEpisode`), ADD KEY `ixEpisodeBasePath` (`c19`(12));
    ALTER TABLE `episode` MODIFY `idEpisode` int NOT NULL AUTO_INCREMENT;

    -- FILES --
    CREATE TABLE `files` (
      `idFile` int NOT NULL,
      `idPath` int DEFAULT NULL,
      `strFilename` text,
      `playCount` int DEFAULT NULL,
      `lastPlayed` text,
      `dateAdded` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `files` ADD PRIMARY KEY (`idFile`), ADD KEY `ix_files` (`idPath`,`strFilename`(255));
    ALTER TABLE `files` MODIFY `idFile` int NOT NULL AUTO_INCREMENT;

    -- GENRE --
    CREATE TABLE `genre` (
      `genre_id` int NOT NULL,
      `name` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `genre` ADD PRIMARY KEY (`genre_id`), ADD UNIQUE KEY `ix_genre_1` (`name`(255));
    ALTER TABLE `genre` MODIFY `genre_id` int NOT NULL AUTO_INCREMENT;

    -- GENRE_LINK --
    CREATE TABLE `genre_link` (
      `genre_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `genre_link` ADD UNIQUE KEY `ix_genre_link_1` (`genre_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_genre_link_2` (`media_id`,`media_type`(20),`genre_id`), ADD KEY `ix_genre_link_3` (`media_type`(20));

    -- MOVIE --
    CREATE TABLE `movie` (
      `idMovie` int NOT NULL,
      `idFile` int DEFAULT NULL,
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
      `idSet` int DEFAULT NULL,
      `userrating` int DEFAULT NULL,
      `premiered` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `movie` ADD PRIMARY KEY (`idMovie`), ADD UNIQUE KEY `ix_movie_file_1` (`idFile`,`idMovie`), ADD UNIQUE KEY `ix_movie_file_2` (`idMovie`,`idFile`), ADD KEY `ixMovieBasePath` (`c23`(12));
    ALTER TABLE `movie` MODIFY `idMovie` int NOT NULL AUTO_INCREMENT;

    -- MOVIELINKTVSHOW --
    CREATE TABLE `movielinktvshow` (
      `idMovie` int DEFAULT NULL,
      `IdShow` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `movielinktvshow` ADD UNIQUE KEY `ix_movielinktvshow_1` (`IdShow`,`idMovie`), ADD UNIQUE KEY `ix_movielinktvshow_2` (`idMovie`,`IdShow`);

    -- MUSICVIDEO --
    CREATE TABLE `musicvideo` (
      `idMVideo` int NOT NULL,
      `idFile` int DEFAULT NULL,
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
      `userrating` int DEFAULT NULL,
      `premiered` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `musicvideo` ADD PRIMARY KEY (`idMVideo`), ADD UNIQUE KEY `ix_musicvideo_file_1` (`idMVideo`,`idFile`), ADD UNIQUE KEY `ix_musicvideo_file_2` (`idFile`,`idMVideo`), ADD KEY `ixMusicVideoBasePath` (`c14`(12));
    ALTER TABLE `musicvideo` MODIFY `idMVideo` int NOT NULL AUTO_INCREMENT;

    -- PATH --
    CREATE TABLE `path` (
      `idPath` int NOT NULL,
      `strPath` text,
      `strContent` text,
      `strScraper` text,
      `strHash` text,
      `scanRecursive` int DEFAULT NULL,
      `useFolderNames` tinyint(1) DEFAULT NULL,
      `strSettings` text,
      `noUpdate` tinyint(1) DEFAULT NULL,
      `exclude` tinyint(1) DEFAULT NULL,
      `allAudio` tinyint(1) DEFAULT NULL,
      `dateAdded` text,
      `idParentPath` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `path` ADD PRIMARY KEY (`idPath`), ADD KEY `ix_path` (`strPath`(255)), ADD KEY `ix_path2` (`idParentPath`);
    ALTER TABLE `path` MODIFY `idPath` int NOT NULL AUTO_INCREMENT;

    -- RATING --
    CREATE TABLE `rating` (
      `rating_id` int NOT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text,
      `rating_type` text,
      `rating` float DEFAULT NULL,
      `votes` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `rating` ADD PRIMARY KEY (`rating_id`), ADD KEY `ix_rating` (`media_id`,`media_type`(20));
    ALTER TABLE `rating` MODIFY `rating_id` int NOT NULL AUTO_INCREMENT;

    -- SEASONS --
    CREATE TABLE `seasons` (
      `idSeason` int NOT NULL,
      `idShow` int DEFAULT NULL,
      `season` int DEFAULT NULL,
      `name` text,
      `userrating` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `seasons` ADD PRIMARY KEY (`idSeason`), ADD KEY `ix_seasons` (`idShow`,`season`);
    ALTER TABLE `seasons` MODIFY `idSeason` int NOT NULL AUTO_INCREMENT;

    -- SETS --
    CREATE TABLE `sets` (
      `idSet` int NOT NULL,
      `strSet` text,
      `strOverview` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `sets` ADD PRIMARY KEY (`idSet`);
    ALTER TABLE `sets` MODIFY `idSet` int NOT NULL AUTO_INCREMENT;

    -- SETTINGS --
    CREATE TABLE `settings` (
      `idFile` int DEFAULT NULL,
      `Deinterlace` tinyint(1) DEFAULT NULL,
      `ViewMode` int DEFAULT NULL,
      `ZoomAmount` float DEFAULT NULL,
      `PixelRatio` float DEFAULT NULL,
      `VerticalShift` float DEFAULT NULL,
      `AudioStream` int DEFAULT NULL,
      `SubtitleStream` int DEFAULT NULL,
      `SubtitleDelay` float DEFAULT NULL,
      `SubtitlesOn` tinyint(1) DEFAULT NULL,
      `Brightness` float DEFAULT NULL,
      `Contrast` float DEFAULT NULL,
      `Gamma` float DEFAULT NULL,
      `VolumeAmplification` float DEFAULT NULL,
      `AudioDelay` float DEFAULT NULL,
      `ResumeTime` int DEFAULT NULL,
      `Sharpness` float DEFAULT NULL,
      `NoiseReduction` float DEFAULT NULL,
      `NonLinStretch` tinyint(1) DEFAULT NULL,
      `PostProcess` tinyint(1) DEFAULT NULL,
      `ScalingMethod` int DEFAULT NULL,
      `DeinterlaceMode` int DEFAULT NULL,
      `StereoMode` int DEFAULT NULL,
      `StereoInvert` tinyint(1) DEFAULT NULL,
      `VideoStream` int DEFAULT NULL,
      `TonemapMethod` int DEFAULT NULL,
      `TonemapParam` float DEFAULT NULL,
      `Orientation` int DEFAULT NULL,
      `CenterMixLevel` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `settings` ADD UNIQUE KEY `ix_settings` (`idFile`);

    -- STACKTIMES --
    CREATE TABLE `stacktimes` (
      `idFile` int DEFAULT NULL,
      `times` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `stacktimes` ADD UNIQUE KEY `ix_stacktimes` (`idFile`);

    -- STREAMDETAILS --
    CREATE TABLE `streamdetails` (
      `idFile` int DEFAULT NULL,
      `iStreamType` int DEFAULT NULL,
      `strVideoCodec` text,
      `fVideoAspect` float DEFAULT NULL,
      `iVideoWidth` int DEFAULT NULL,
      `iVideoHeight` int DEFAULT NULL,
      `strAudioCodec` text,
      `iAudioChannels` int DEFAULT NULL,
      `strAudioLanguage` text,
      `strSubtitleLanguage` text,
      `iVideoDuration` int DEFAULT NULL,
      `strStereoMode` text,
      `strVideoLanguage` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `streamdetails` ADD KEY `ix_streamdetails` (`idFile`);

    -- STUDIO --
    CREATE TABLE `studio` (
      `studio_id` int NOT NULL,
      `name` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `studio` ADD PRIMARY KEY (`studio_id`), ADD UNIQUE KEY `ix_studio_1` (`name`(255));
    ALTER TABLE `studio` MODIFY `studio_id` int NOT NULL AUTO_INCREMENT;

    -- STUDIO_LINK --
    CREATE TABLE `studio_link` (
      `studio_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `studio_link` ADD UNIQUE KEY `ix_studio_link_1` (`studio_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_studio_link_2` (`media_id`,`media_type`(20),`studio_id`), ADD KEY `ix_studio_link_3` (`media_type`(20));

    -- TAG --
    CREATE TABLE `tag` (
      `tag_id` int NOT NULL,
      `name` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `tag` ADD PRIMARY KEY (`tag_id`), ADD UNIQUE KEY `ix_tag_1` (`name`(255));
    ALTER TABLE `tag` MODIFY `tag_id` int NOT NULL AUTO_INCREMENT;

    -- TAG_LINK --
    CREATE TABLE `tag_link` (
      `tag_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `tag_link` ADD UNIQUE KEY `ix_tag_link_1` (`tag_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_tag_link_2` (`media_id`,`media_type`(20),`tag_id`), ADD KEY `ix_tag_link_3` (`media_type`(20));

    -- TVSHOW --
    CREATE TABLE `tvshow` (
      `idShow` int NOT NULL,
      `c00` text,
      `c01` text,
      `c02` text,
      `c03` text,
      `c04` text,
      `c05` text,
      `c06` mediumtext,
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
      `userrating` int DEFAULT NULL,
      `duration` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `tvshow` ADD PRIMARY KEY (`idShow`);
    ALTER TABLE `tvshow` MODIFY `idShow` int NOT NULL AUTO_INCREMENT;

    -- TVSHOWLINKPATH --
    CREATE TABLE `tvshowlinkpath` (
      `idShow` int DEFAULT NULL,
      `idPath` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `tvshowlinkpath` ADD UNIQUE KEY `ix_tvshowlinkpath_1` (`idShow`,`idPath`), ADD UNIQUE KEY `ix_tvshowlinkpath_2` (`idPath`,`idShow`);

    -- UNIQUEID --
    CREATE TABLE `uniqueid` (
      `uniqueid_id` int NOT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text,
      `value` text,
      `type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `uniqueid` ADD PRIMARY KEY (`uniqueid_id`), ADD KEY `ix_uniqueid1` (`media_id`,`media_type`(20),`type`(20)), ADD KEY `ix_uniqueid2` (`media_type`(20),`value`(20));
    ALTER TABLE `uniqueid` MODIFY `uniqueid_id` int NOT NULL AUTO_INCREMENT;

    -- VERSION --
    CREATE TABLE `version` (
      `idVersion` int DEFAULT NULL,
      `iCompressCount` int DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    INSERT INTO `version` (`idVersion`, `iCompressCount`) VALUES (119, 0);

    -- WRITER_LINK --
    CREATE TABLE `writer_link` (
      `actor_id` int DEFAULT NULL,
      `media_id` int DEFAULT NULL,
      `media_type` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ALTER TABLE `writer_link` ADD UNIQUE KEY `ix_writer_link_1` (`actor_id`,`media_type`(20),`media_id`), ADD UNIQUE KEY `ix_writer_link_2` (`media_id`,`media_type`(20),`actor_id`), ADD KEY `ix_writer_link_3` (`media_type`(20));

  -- VIEWS --
    -- EPISODE_VIEW --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `episode_view` AS SELECT `episode`.`idEpisode` AS `idEpisode`, `episode`.`idFile` AS `idFile`, `episode`.`c00` AS `c00`, `episode`.`c01` AS `c01`, `episode`.`c02` AS `c02`, `episode`.`c03` AS `c03`, `episode`.`c04` AS `c04`, `episode`.`c05` AS `c05`, `episode`.`c06` AS `c06`, `episode`.`c07` AS `c07`, `episode`.`c08` AS `c08`, `episode`.`c09` AS `c09`, `episode`.`c10` AS `c10`, `episode`.`c11` AS `c11`, `episode`.`c12` AS `c12`, `episode`.`c13` AS `c13`, `episode`.`c14` AS `c14`, `episode`.`c15` AS `c15`, `episode`.`c16` AS `c16`, `episode`.`c17` AS `c17`, `episode`.`c18` AS `c18`, `episode`.`c19` AS `c19`, `episode`.`c20` AS `c20`, `episode`.`c21` AS `c21`, `episode`.`c22` AS `c22`, `episode`.`c23` AS `c23`, `episode`.`idShow` AS `idShow`, `episode`.`userrating` AS `userrating`, `episode`.`idSeason` AS `idSeason`, `files`.`strFilename` AS `strFileName`, `path`.`strPath` AS `strPath`, `files`.`playCount` AS `playCount`, `files`.`lastPlayed` AS `lastPlayed`, `files`.`dateAdded` AS `dateAdded`, `tvshow`.`c00` AS `strTitle`, `tvshow`.`c08` AS `genre`, `tvshow`.`c14` AS `studio`, `tvshow`.`c05` AS `premiered`, `tvshow`.`c13` AS `mpaa`, `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`, `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`, `bookmark`.`playerState` AS `playerState`, `rating`.`rating` AS `rating`, `rating`.`votes` AS `votes`, `rating`.`rating_type` AS `rating_type`, `uniqueid`.`value` AS `uniqueid_value`, `uniqueid`.`type` AS `uniqueid_type` FROM (((((((`episode` join `files` on((`files`.`idFile` = `episode`.`idFile`))) join `tvshow` on((`tvshow`.`idShow` = `episode`.`idShow`))) join `seasons` on((`seasons`.`idSeason` = `episode`.`idSeason`))) join `path` on((`files`.`idPath` = `path`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `episode`.`idFile`) and (`bookmark`.`type` = 1)))) left join `rating` on((`rating`.`rating_id` = `episode`.`c03`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `episode`.`c20`))) ;
    -- MOVIE_VIEW --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `movie_view` AS SELECT `movie`.`idMovie` AS `idMovie`, `movie`.`idFile` AS `idFile`, `movie`.`c00` AS `c00`, `movie`.`c01` AS `c01`, `movie`.`c02` AS `c02`, `movie`.`c03` AS `c03`, `movie`.`c04` AS `c04`, `movie`.`c05` AS `c05`, `movie`.`c06` AS `c06`, `movie`.`c07` AS `c07`, `movie`.`c08` AS `c08`, `movie`.`c09` AS `c09`, `movie`.`c10` AS `c10`, `movie`.`c11` AS `c11`, `movie`.`c12` AS `c12`, `movie`.`c13` AS `c13`, `movie`.`c14` AS `c14`, `movie`.`c15` AS `c15`, `movie`.`c16` AS `c16`, `movie`.`c17` AS `c17`, `movie`.`c18` AS `c18`, `movie`.`c19` AS `c19`, `movie`.`c20` AS `c20`, `movie`.`c21` AS `c21`, `movie`.`c22` AS `c22`, `movie`.`c23` AS `c23`, `movie`.`idSet` AS `idSet`, `movie`.`userrating` AS `userrating`, `movie`.`premiered` AS `premiered`, `sets`.`strSet` AS `strSet`, `sets`.`strOverview` AS `strSetOverview`, `files`.`strFilename` AS `strFileName`, `path`.`strPath` AS `strPath`, `files`.`playCount` AS `playCount`, `files`.`lastPlayed` AS `lastPlayed`, `files`.`dateAdded` AS `dateAdded`, `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`, `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`, `bookmark`.`playerState` AS `playerState`, `rating`.`rating` AS `rating`, `rating`.`votes` AS `votes`, `rating`.`rating_type` AS `rating_type`, `uniqueid`.`value` AS `uniqueid_value`, `uniqueid`.`type` AS `uniqueid_type` FROM ((((((`movie` left join `sets` on((`sets`.`idSet` = `movie`.`idSet`))) join `files` on((`files`.`idFile` = `movie`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `movie`.`idFile`) and (`bookmark`.`type` = 1)))) left join `rating` on((`rating`.`rating_id` = `movie`.`c05`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `movie`.`c09`))) ;
    -- MUSICVIDEO_VIEW --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `musicvideo_view` AS SELECT `musicvideo`.`idMVideo` AS `idMVideo`, `musicvideo`.`idFile` AS `idFile`, `musicvideo`.`c00` AS `c00`, `musicvideo`.`c01` AS `c01`, `musicvideo`.`c02` AS `c02`, `musicvideo`.`c03` AS `c03`, `musicvideo`.`c04` AS `c04`, `musicvideo`.`c05` AS `c05`, `musicvideo`.`c06` AS `c06`, `musicvideo`.`c07` AS `c07`, `musicvideo`.`c08` AS `c08`, `musicvideo`.`c09` AS `c09`, `musicvideo`.`c10` AS `c10`, `musicvideo`.`c11` AS `c11`, `musicvideo`.`c12` AS `c12`, `musicvideo`.`c13` AS `c13`, `musicvideo`.`c14` AS `c14`, `musicvideo`.`c15` AS `c15`, `musicvideo`.`c16` AS `c16`, `musicvideo`.`c17` AS `c17`, `musicvideo`.`c18` AS `c18`, `musicvideo`.`c19` AS `c19`, `musicvideo`.`c20` AS `c20`, `musicvideo`.`c21` AS `c21`, `musicvideo`.`c22` AS `c22`, `musicvideo`.`c23` AS `c23`, `musicvideo`.`userrating` AS `userrating`, `musicvideo`.`premiered` AS `premiered`, `files`.`strFilename` AS `strFileName`, `path`.`strPath` AS `strPath`, `files`.`playCount` AS `playCount`, `files`.`lastPlayed` AS `lastPlayed`, `files`.`dateAdded` AS `dateAdded`, `bookmark`.`timeInSeconds` AS `resumeTimeInSeconds`, `bookmark`.`totalTimeInSeconds` AS `totalTimeInSeconds`, `bookmark`.`playerState` AS `playerState` FROM (((`musicvideo` join `files` on((`files`.`idFile` = `musicvideo`.`idFile`))) join `path` on((`path`.`idPath` = `files`.`idPath`))) left join `bookmark` on(((`bookmark`.`idFile` = `musicvideo`.`idFile`) and (`bookmark`.`type` = 1)))) ;
    -- TVSHOWLINKPATH_MINVIEW --
    CREATE ALGORITHM=UNDEFINED DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `tvshowlinkpath_minview` AS SELECT `tvshowlinkpath`.`idShow` AS `idShow`, min(`tvshowlinkpath`.`idPath`) AS `idPath` FROM `tvshowlinkpath` GROUP BY `tvshowlinkpath`.`idShow` ;
    -- TVSHOWCOUNTS --
    CREATE ALGORITHM=UNDEFINED DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `tvshowcounts` AS SELECT `tvshow`.`idShow` AS `idShow`, max(`files`.`lastPlayed`) AS `lastPlayed`, nullif(count(`episode`.`c12`),0) AS `totalCount`, count(`files`.`playCount`) AS `watchedcount`, nullif(count(distinct `episode`.`c12`),0) AS `totalSeasons`, max(`files`.`dateAdded`) AS `dateAdded` FROM ((`tvshow` left join `episode` on((`episode`.`idShow` = `tvshow`.`idShow`))) left join `files` on((`files`.`idFile` = `episode`.`idFile`))) GROUP BY `tvshow`.`idShow` ;
    -- TVSHOW_VIEW --
    CREATE ALGORITHM=MERGE DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `tvshow_view` AS SELECT `tvshow`.`idShow` AS `idShow`, `tvshow`.`c00` AS `c00`, `tvshow`.`c01` AS `c01`, `tvshow`.`c02` AS `c02`, `tvshow`.`c03` AS `c03`, `tvshow`.`c04` AS `c04`, `tvshow`.`c05` AS `c05`, `tvshow`.`c06` AS `c06`, `tvshow`.`c07` AS `c07`, `tvshow`.`c08` AS `c08`, `tvshow`.`c09` AS `c09`, `tvshow`.`c10` AS `c10`, `tvshow`.`c11` AS `c11`, `tvshow`.`c12` AS `c12`, `tvshow`.`c13` AS `c13`, `tvshow`.`c14` AS `c14`, `tvshow`.`c15` AS `c15`, `tvshow`.`c16` AS `c16`, `tvshow`.`c17` AS `c17`, `tvshow`.`c18` AS `c18`, `tvshow`.`c19` AS `c19`, `tvshow`.`c20` AS `c20`, `tvshow`.`c21` AS `c21`, `tvshow`.`c22` AS `c22`, `tvshow`.`c23` AS `c23`, `tvshow`.`userrating` AS `userrating`, `tvshow`.`duration` AS `duration`, `path`.`idParentPath` AS `idParentPath`, `path`.`strPath` AS `strPath`, `tvshowcounts`.`dateAdded` AS `dateAdded`, `tvshowcounts`.`lastPlayed` AS `lastPlayed`, `tvshowcounts`.`totalCount` AS `totalCount`, `tvshowcounts`.`watchedcount` AS `watchedcount`, `tvshowcounts`.`totalSeasons` AS `totalSeasons`, `rating`.`rating` AS `rating`, `rating`.`votes` AS `votes`, `rating`.`rating_type` AS `rating_type`, `uniqueid`.`value` AS `uniqueid_value`, `uniqueid`.`type` AS `uniqueid_type` FROM (((((`tvshow` left join `tvshowlinkpath_minview` on((`tvshowlinkpath_minview`.`idShow` = `tvshow`.`idShow`))) left join `path` on((`path`.`idPath` = `tvshowlinkpath_minview`.`idPath`))) join `tvshowcounts` on((`tvshow`.`idShow` = `tvshowcounts`.`idShow`))) left join `rating` on((`rating`.`rating_id` = `tvshow`.`c04`))) left join `uniqueid` on((`uniqueid`.`uniqueid_id` = `tvshow`.`c12`))) ;
    -- SEASON_VIEW --
    CREATE ALGORITHM=UNDEFINED DEFINER=`KODI_19`@`%` SQL SECURITY DEFINER VIEW `season_view` AS SELECT `seasons`.`idSeason` AS `idSeason`, `seasons`.`idShow` AS `idShow`, `seasons`.`season` AS `season`, `seasons`.`name` AS `name`, `seasons`.`userrating` AS `userrating`, `tvshow_view`.`strPath` AS `strPath`, `tvshow_view`.`c00` AS `showTitle`, `tvshow_view`.`c01` AS `plot`, `tvshow_view`.`c05` AS `premiered`, `tvshow_view`.`c08` AS `genre`, `tvshow_view`.`c14` AS `studio`, `tvshow_view`.`c13` AS `mpaa`, count(distinct `episode`.`idEpisode`) AS `episodes`, count(`files`.`playCount`) AS `playCount`, min(`episode`.`c05`) AS `aired` FROM (((`seasons` join `tvshow_view` on((`tvshow_view`.`idShow` = `seasons`.`idShow`))) join `episode` on(((`episode`.`idShow` = `seasons`.`idShow`) and (`episode`.`c12` = `seasons`.`season`)))) join `files` on((`files`.`idFile` = `episode`.`idFile`))) GROUP BY `seasons`.`idSeason`, `seasons`.`idShow`, `seasons`.`season`, `seasons`.`name`, `seasons`.`userrating`, `tvshow_view`.`strPath`, `tvshow_view`.`c00`, `tvshow_view`.`c01`, `tvshow_view`.`c05`, `tvshow_view`.`c08`, `tvshow_view`.`c14`, `tvshow_view`.`c13` ;

  -- TRIGGERS --
  DROP TRIGGER IF EXISTS `delete_person`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_person` AFTER DELETE ON `actor`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.actor_id AND media_type IN ('actor','artist','writer','director');
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_episode`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_episode` AFTER DELETE ON `episode`
  FOR EACH ROW
  BEGIN
    DELETE FROM actor_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM director_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM writer_link WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM art WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM rating WHERE media_id=old.idEpisode AND media_type='episode';
    DELETE FROM uniqueid WHERE media_id=old.idEpisode AND media_type='episode';
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_file`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_file` AFTER DELETE ON `files`
  FOR EACH ROW
  BEGIN
    DELETE FROM bookmark WHERE idFile=old.idFile; DELETE FROM settings WHERE idFile=old.idFile; DELETE FROM stacktimes WHERE idFile=old.idFile; DELETE FROM streamdetails WHERE idFile=old.idFile;
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_movie`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_movie` AFTER DELETE ON `movie`
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
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_musicvideo`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_musicvideo` AFTER DELETE ON `musicvideo`
  FOR EACH ROW
  BEGIN
    DELETE FROM actor_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM director_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM genre_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM studio_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM art WHERE media_id=old.idMVideo AND media_type='musicvideo';
    DELETE FROM tag_link WHERE media_id=old.idMVideo AND media_type='musicvideo';
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_season`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_season` AFTER DELETE ON `seasons`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.idSeason AND media_type='season';
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_set`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_set` AFTER DELETE ON `sets`
  FOR EACH ROW
  BEGIN
    DELETE FROM art WHERE media_id=old.idSet AND media_type='set';
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_tag`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_tag` AFTER DELETE ON `tag_link`
  FOR EACH ROW
  BEGIN
    DELETE FROM tag WHERE tag_id=old.tag_id AND tag_id NOT IN (SELECT DISTINCT tag_id FROM tag_link);
  END $$
  DELIMITER ;

  DROP TRIGGER IF EXISTS `delete_tvshow`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `delete_tvshow` AFTER DELETE ON `tvshow`
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
    END $$
  DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;