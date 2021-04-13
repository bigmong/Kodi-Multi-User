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

  -- DELETE FILE FIX FOR MULT USERS --
  -- REMOVE THE LINE EG. "DELETE FROM `Kodi_U05_Video_119`.bookmark WHERE idfile = old.idfile;" IF NOT USED --
  DROP TRIGGER IF EXISTS `Kodi_U01_Video_119`.`delete_file`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `Kodi_U01_Video_119`.`delete_file` AFTER DELETE ON `Kodi_U01_Video_119`.`global_files`
  FOR EACH ROW
  BEGIN
    DELETE FROM `Kodi_U01_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U02_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U03_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U03_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U05_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U06_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U07_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U08_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U09_Video_119`.bookmark WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U01_Video_119`.settings WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U01_Video_119`.stacktimes WHERE idfile = old.idfile;
    DELETE FROM `Kodi_U01_Video_119`.streamdetails WHERE idfile = old.idfile;
  END $$
  DELIMITER ;

  -- CORRECT RATINGS FOR _U01 --
  -- A SEASON RATING SHOULD BE THE AVERAGE OF THE EPISODES WITHIN THAT ARE RATED
  -- A SHOW RATING SHOULD BE THE AVERAGE OF ALL THE EPISODES WITHIN THAT ARE RATED
  -- CAN BE CHANGE TO ANY USER IF YOU UPDATE THE "userrating_U01" AND GIVE IT A NEW NAME "update_rating_U01"
  DROP TRIGGER IF EXISTS `Kodi_U01_Video_119`.`update_rating_U01`;
  DELIMITER $$
  CREATE DEFINER=`KODI_19`@`%` TRIGGER `Kodi_U01_Video_119`.`update_rating_U01` AFTER UPDATE ON `Kodi_U01_Video_119`.`global_episode`
  FOR EACH ROW
  BEGIN
    IF (new.userrating_U01 != old.userrating_U01) THEN
      UPDATE `Kodi_U01_Video_119`.global_tvshow SET userrating_U01 = (SELECT ROUND(AVG(userrating_U01)) FROM global_episode WHERE userrating_U01 IS NOT NULL AND idShow=old.idShow) WHERE idShow=old.idShow;
      UPDATE `Kodi_U01_Video_119`.global_seasons SET userrating_U01 = (SELECT ROUND(AVG(userrating_U01)) FROM global_episode WHERE userrating_U01 IS NOT NULL AND idShow=old.idShow AND idSeason=old.idSeason) WHERE idShow=old.idShow AND idSeason=old.idSeason;
    END IF;
  END $$
  DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;