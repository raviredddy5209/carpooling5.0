ROLE TABLE
---------------------------------------------
  CREATE TABLE `role` (
  `roleId` tinyint(1) NOT NULL,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`roleId`));



USER TABLE
--------------------------------------------
CREATE TABLE `user` (
  `employeeId` int(20) NOT NULL DEFAULT '0',
  `fullName` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `roleId` tinyint(1) DEFAULT '0',
  `vehicleId` varchar(20) DEFAULT NULL,
  `phoneno` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`employeeId`),
  KEY `roleId_fk` (`roleId`),
  CONSTRAINT `roleId_fk` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
);



ROUTE TABLE
----------------------------------------------------
 CREATE TABLE `route` (
  `routeId` int(10) NOT NULL AUTO_INCREMENT,
  `source` varchar(50) NOT NULL,
  `dest` varchar(50) NOT NULL,
  PRIMARY KEY (`routeId`)
);


VEHICLE TABLE
------------------------------------------------------

CREATE TABLE `vehicle` (
  `vehicleId` varchar(20) NOT NULL,
  `numberOfSeats` int(20) NOT NULL,
  `employeeId` int(20) NOT NULL,
  `availableSeats` int(20) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`),
  KEY `employeedId_fk` (`employeeId`),
  CONSTRAINT `employeedId_fk` FOREIGN KEY (`employeeId`) REFERENCES `user` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE
);


 ----------------------------------------
CREATE TABLE `schedule` (
  `scheduleId` int(20) NOT NULL AUTO_INCREMENT,
  `employeeId` int(20) NOT NULL,
  `startingPoint` varchar(30) NOT NULL,
  `endingPoint` varchar(50) NOT NULL,
  `startTime` time NOT NULL,
  `vehicleId` varchar(30) NOT NULL,
  `numberOfSeats` int(20) NOT NULL,
  PRIMARY KEY (`scheduleId`),
  KEY `employeeId_fk` (`employeeId`),
  KEY `vehicleId_Fk` (`vehicleId`),
  CONSTRAINT `employeeId_fk` FOREIGN KEY (`employeeId`) REFERENCES `user` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicleId_Fk` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`vehicleId`) ON DELETE CASCADE ON UPDATE CASCADE
);
--------------------------------------------
 CREATE TABLE `trip` (
  `tripId` int(10) NOT NULL AUTO_INCREMENT,
  `scheduleId` int(20) NOT NULL,
  `employeeId` int(20) NOT NULL,
  `vehicleId` varchar(20) NOT NULL,
  `noOfPassengers` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tripId`),
  KEY `employeeIdfk` (`employeeId`),
  KEY `scheduleIdfk` (`scheduleId`),
  KEY `vehicleIdfk` (`vehicleId`),
  CONSTRAINT `employeeIdfk` FOREIGN KEY (`employeeId`) REFERENCES `user` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scheduleIdfk` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`scheduleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicleIdfk` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`vehicleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
----------------------------------------------------
CREATE TABLE `riders` (
  `tripId` int(10) NOT NULL,
  `employeeId` int(20) NOT NULL,
  KEY `tripId_Fk` (`tripId`),
  KEY `employeeId_Rfk` (`employeeId`),
  CONSTRAINT `employeeId_Rfk` FOREIGN KEY (`employeeId`) REFERENCES `user` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tripId_Fk` FOREIGN KEY (`tripId`) REFERENCES `trip` (`tripId`) ON DELETE CASCADE ON UPDATE CASCADE
);