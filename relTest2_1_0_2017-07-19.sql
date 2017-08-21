# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: relTest2_1_0
# Generation Time: 2017-07-19 16:07:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accession
# ------------------------------------------------------------

CREATE TABLE `accession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(255) NOT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `display_string` text,
  `publish` int(11) DEFAULT NULL,
  `content_description` text,
  `condition_description` text,
  `disposition` text,
  `inventory` text,
  `provenance` text,
  `general_note` text,
  `resource_type_id` int(11) DEFAULT NULL,
  `acquisition_type_id` int(11) DEFAULT NULL,
  `accession_date` date DEFAULT NULL,
  `restrictions_apply` int(11) DEFAULT NULL,
  `retention_rule` text,
  `access_restrictions` int(11) DEFAULT NULL,
  `access_restrictions_note` text,
  `use_restrictions` int(11) DEFAULT NULL,
  `use_restrictions_note` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accession_unique_identifier` (`repo_id`,`identifier`),
  KEY `resource_type_id` (`resource_type_id`),
  KEY `acquisition_type_id` (`acquisition_type_id`),
  KEY `accession_system_mtime_index` (`system_mtime`),
  KEY `accession_user_mtime_index` (`user_mtime`),
  KEY `accession_suppressed_index` (`suppressed`),
  CONSTRAINT `accession_ibfk_1` FOREIGN KEY (`resource_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `accession_ibfk_2` FOREIGN KEY (`acquisition_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `accession_ibfk_3` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table active_edit
# ------------------------------------------------------------

CREATE TABLE `active_edit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active_edit_timestamp_index` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table agent_contact
# ------------------------------------------------------------

CREATE TABLE `agent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `salutation_id` int(11) DEFAULT NULL,
  `address_1` text,
  `address_2` text,
  `address_3` text,
  `city` text,
  `region` text,
  `country` text,
  `post_code` text,
  `email` text,
  `email_signature` text,
  `note` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salutation_id` (`salutation_id`),
  KEY `agent_contact_system_mtime_index` (`system_mtime`),
  KEY `agent_contact_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `agent_software_id` (`agent_software_id`),
  CONSTRAINT `agent_contact_ibfk_1` FOREIGN KEY (`salutation_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `agent_contact_ibfk_2` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `agent_contact_ibfk_3` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `agent_contact_ibfk_4` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `agent_contact_ibfk_5` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table agent_corporate_entity
# ------------------------------------------------------------

CREATE TABLE `agent_corporate_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `agent_sha1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sha1_agent_corporate_entity` (`agent_sha1`),
  KEY `agent_corporate_entity_system_mtime_index` (`system_mtime`),
  KEY `agent_corporate_entity_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table agent_family
# ------------------------------------------------------------

CREATE TABLE `agent_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `agent_sha1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sha1_agent_family` (`agent_sha1`),
  KEY `agent_family_system_mtime_index` (`system_mtime`),
  KEY `agent_family_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table agent_person
# ------------------------------------------------------------

CREATE TABLE `agent_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `agent_sha1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sha1_agent_person` (`agent_sha1`),
  KEY `agent_person_system_mtime_index` (`system_mtime`),
  KEY `agent_person_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table agent_software
# ------------------------------------------------------------

CREATE TABLE `agent_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_role` varchar(255) NOT NULL DEFAULT 'none',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `agent_sha1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sha1_agent_software` (`agent_sha1`),
  KEY `agent_software_system_role_index` (`system_role`),
  KEY `agent_software_system_mtime_index` (`system_mtime`),
  KEY `agent_software_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table archival_object
# ------------------------------------------------------------

CREATE TABLE `archival_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `root_record_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `ref_id` varchar(255) NOT NULL,
  `component_id` varchar(255) DEFAULT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `display_string` text,
  `level_id` int(11) NOT NULL,
  `other_level` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `system_generated` int(11) DEFAULT '0',
  `restrictions_apply` int(11) DEFAULT NULL,
  `repository_processing_note` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ao_unique_refid` (`root_record_id`,`ref_id`),
  UNIQUE KEY `uniq_ao_pos` (`parent_name`,`position`),
  KEY `level_id` (`level_id`),
  KEY `language_id` (`language_id`),
  KEY `archival_object_system_mtime_index` (`system_mtime`),
  KEY `archival_object_user_mtime_index` (`user_mtime`),
  KEY `repo_id` (`repo_id`),
  KEY `ao_parent_root_idx` (`parent_id`,`root_record_id`),
  KEY `archival_object_ref_id_index` (`ref_id`),
  KEY `archival_object_component_id_index` (`component_id`),
  CONSTRAINT `archival_object_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `archival_object_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `archival_object_ibfk_3` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`),
  CONSTRAINT `archival_object_ibfk_4` FOREIGN KEY (`root_record_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `archival_object_ibfk_5` FOREIGN KEY (`parent_id`) REFERENCES `archival_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_db
# ------------------------------------------------------------

CREATE TABLE `auth_db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `pwhash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `auth_db_system_mtime_index` (`system_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table classification
# ------------------------------------------------------------

CREATE TABLE `classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `title` varchar(8704) NOT NULL,
  `description` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `publish` int(11) DEFAULT '1',
  `suppressed` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `classification_system_mtime_index` (`system_mtime`),
  KEY `classification_user_mtime_index` (`user_mtime`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table classification_creator_rlshp
# ------------------------------------------------------------

CREATE TABLE `classification_creator_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `classification_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `classification_creator_rlshp_system_mtime_index` (`system_mtime`),
  KEY `classification_creator_rlshp_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `agent_software_id` (`agent_software_id`),
  KEY `classification_id` (`classification_id`),
  CONSTRAINT `classification_creator_rlshp_ibfk_1` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `classification_creator_rlshp_ibfk_2` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `classification_creator_rlshp_ibfk_3` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `classification_creator_rlshp_ibfk_4` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `classification_creator_rlshp_ibfk_5` FOREIGN KEY (`classification_id`) REFERENCES `classification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table classification_rlshp
# ------------------------------------------------------------

CREATE TABLE `classification_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `classification_id` int(11) DEFAULT NULL,
  `classification_term_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `classification_rlshp_system_mtime_index` (`system_mtime`),
  KEY `classification_rlshp_user_mtime_index` (`user_mtime`),
  KEY `resource_id` (`resource_id`),
  KEY `accession_id` (`accession_id`),
  KEY `classification_id` (`classification_id`),
  KEY `classification_term_id` (`classification_term_id`),
  CONSTRAINT `classification_rlshp_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `classification_rlshp_ibfk_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `classification_rlshp_ibfk_3` FOREIGN KEY (`classification_id`) REFERENCES `classification` (`id`),
  CONSTRAINT `classification_rlshp_ibfk_4` FOREIGN KEY (`classification_term_id`) REFERENCES `classification_term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table classification_term
# ------------------------------------------------------------

CREATE TABLE `classification_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `title` varchar(8704) NOT NULL,
  `title_sha1` varchar(255) NOT NULL,
  `description` text,
  `root_record_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `publish` int(11) DEFAULT '1',
  `suppressed` int(11) DEFAULT '0',
  `display_string` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classification_term_parent_name_title_sha1_index` (`parent_name`,`title_sha1`),
  UNIQUE KEY `classification_term_parent_name_identifier_index` (`parent_name`,`identifier`),
  UNIQUE KEY `uniq_ct_pos` (`parent_name`,`position`),
  KEY `classification_term_system_mtime_index` (`system_mtime`),
  KEY `classification_term_user_mtime_index` (`user_mtime`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `classification_term_ibfk_1` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table classification_term_creator_rlshp
# ------------------------------------------------------------

CREATE TABLE `classification_term_creator_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `classification_term_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `classification_term_creator_rlshp_system_mtime_index` (`system_mtime`),
  KEY `classification_term_creator_rlshp_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `agent_software_id` (`agent_software_id`),
  KEY `classification_term_id` (`classification_term_id`),
  CONSTRAINT `classification_term_creator_rlshp_ibfk_1` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `classification_term_creator_rlshp_ibfk_2` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `classification_term_creator_rlshp_ibfk_3` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `classification_term_creator_rlshp_ibfk_4` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `classification_term_creator_rlshp_ibfk_5` FOREIGN KEY (`classification_term_id`) REFERENCES `classification_term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table collection_management
# ------------------------------------------------------------

CREATE TABLE `collection_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `processing_hours_per_foot_estimate` varchar(255) DEFAULT NULL,
  `processing_total_extent` varchar(255) DEFAULT NULL,
  `processing_total_extent_type_id` int(11) DEFAULT NULL,
  `processing_hours_total` varchar(255) DEFAULT NULL,
  `processing_plan` text,
  `processing_priority_id` int(11) DEFAULT NULL,
  `processing_status_id` int(11) DEFAULT NULL,
  `processing_funding_source` text,
  `processors` text,
  `rights_determined` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `processing_total_extent_type_id` (`processing_total_extent_type_id`),
  KEY `processing_priority_id` (`processing_priority_id`),
  KEY `processing_status_id` (`processing_status_id`),
  KEY `collection_management_system_mtime_index` (`system_mtime`),
  KEY `collection_management_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `resource_id` (`resource_id`),
  KEY `digital_object_id` (`digital_object_id`),
  CONSTRAINT `collection_management_ibfk_1` FOREIGN KEY (`processing_total_extent_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `collection_management_ibfk_2` FOREIGN KEY (`processing_priority_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `collection_management_ibfk_3` FOREIGN KEY (`processing_status_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `collection_management_ibfk_4` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `collection_management_ibfk_5` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `collection_management_ibfk_6` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table container_profile
# ------------------------------------------------------------

CREATE TABLE `container_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `extent_dimension` varchar(255) DEFAULT NULL,
  `dimension_units_id` int(11) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `depth` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `stacking_limit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `container_profile_name_uniq` (`name`),
  KEY `dimension_units_id` (`dimension_units_id`),
  KEY `container_profile_system_mtime_index` (`system_mtime`),
  KEY `container_profile_user_mtime_index` (`user_mtime`),
  CONSTRAINT `container_profile_ibfk_1` FOREIGN KEY (`dimension_units_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table date
# ------------------------------------------------------------

CREATE TABLE `date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `deaccession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `related_agents_rlshp_id` int(11) DEFAULT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `name_person_id` int(11) DEFAULT NULL,
  `name_family_id` int(11) DEFAULT NULL,
  `name_corporate_entity_id` int(11) DEFAULT NULL,
  `name_software_id` int(11) DEFAULT NULL,
  `date_type_id` int(11) DEFAULT NULL,
  `label_id` int(11) NOT NULL,
  `certainty_id` int(11) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `begin` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `era_id` int(11) DEFAULT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_type_id` (`date_type_id`),
  KEY `label_id` (`label_id`),
  KEY `certainty_id` (`certainty_id`),
  KEY `era_id` (`era_id`),
  KEY `calendar_id` (`calendar_id`),
  KEY `date_system_mtime_index` (`system_mtime`),
  KEY `date_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `resource_id` (`resource_id`),
  KEY `event_id` (`event_id`),
  KEY `deaccession_id` (`deaccession_id`),
  KEY `related_agents_rlshp_id` (`related_agents_rlshp_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `agent_person_date_fk` (`agent_person_id`),
  KEY `agent_family_date_fk` (`agent_family_id`),
  KEY `agent_corporate_entity_date_fk` (`agent_corporate_entity_id`),
  KEY `agent_software_date_fk` (`agent_software_id`),
  KEY `name_person_date_fk` (`name_person_id`),
  KEY `name_family_date_fk` (`name_family_id`),
  KEY `name_corporate_entity_date_fk` (`name_corporate_entity_id`),
  KEY `name_software_date_fk` (`name_software_id`),
  CONSTRAINT `agent_corporate_entity_date_fk` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `agent_family_date_fk` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `agent_person_date_fk` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `agent_software_date_fk` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `date_ibfk_1` FOREIGN KEY (`date_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `date_ibfk_10` FOREIGN KEY (`deaccession_id`) REFERENCES `deaccession` (`id`),
  CONSTRAINT `date_ibfk_11` FOREIGN KEY (`related_agents_rlshp_id`) REFERENCES `related_agents_rlshp` (`id`),
  CONSTRAINT `date_ibfk_12` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `date_ibfk_13` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `date_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `date_ibfk_3` FOREIGN KEY (`certainty_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `date_ibfk_4` FOREIGN KEY (`era_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `date_ibfk_5` FOREIGN KEY (`calendar_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `date_ibfk_6` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `date_ibfk_7` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `date_ibfk_8` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `date_ibfk_9` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `name_corporate_entity_date_fk` FOREIGN KEY (`name_corporate_entity_id`) REFERENCES `name_corporate_entity` (`id`),
  CONSTRAINT `name_family_date_fk` FOREIGN KEY (`name_family_id`) REFERENCES `name_family` (`id`),
  CONSTRAINT `name_person_date_fk` FOREIGN KEY (`name_person_id`) REFERENCES `name_person` (`id`),
  CONSTRAINT `name_software_date_fk` FOREIGN KEY (`name_software_id`) REFERENCES `name_software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deaccession
# ------------------------------------------------------------

CREATE TABLE `deaccession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `scope_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `reason` text,
  `disposition` text,
  `notification` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scope_id` (`scope_id`),
  KEY `deaccession_system_mtime_index` (`system_mtime`),
  KEY `deaccession_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `deaccession_ibfk_1` FOREIGN KEY (`scope_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `deaccession_ibfk_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `deaccession_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table default_values
# ------------------------------------------------------------

CREATE TABLE `default_values` (
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL,
  `blob` blob NOT NULL,
  `repo_id` int(11) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `default_values_system_mtime_index` (`system_mtime`),
  KEY `default_values_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deleted_records
# ------------------------------------------------------------

CREATE TABLE `deleted_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table digital_object
# ------------------------------------------------------------

CREATE TABLE `digital_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `digital_object_id` varchar(255) NOT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `digital_object_type_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `restrictions` int(11) DEFAULT NULL,
  `system_generated` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `digital_object_repo_id_digital_object_id_index` (`repo_id`,`digital_object_id`),
  KEY `level_id` (`level_id`),
  KEY `digital_object_type_id` (`digital_object_type_id`),
  KEY `language_id` (`language_id`),
  KEY `digital_object_system_mtime_index` (`system_mtime`),
  KEY `digital_object_user_mtime_index` (`user_mtime`),
  CONSTRAINT `digital_object_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `digital_object_ibfk_2` FOREIGN KEY (`digital_object_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `digital_object_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `digital_object_ibfk_4` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table digital_object_component
# ------------------------------------------------------------

CREATE TABLE `digital_object_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `root_record_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `component_id` varchar(255) DEFAULT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `display_string` text,
  `label` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `system_generated` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc_unique_identifier` (`repo_id`,`component_id`),
  UNIQUE KEY `uniq_do_pos` (`parent_name`,`position`),
  KEY `language_id` (`language_id`),
  KEY `digital_object_component_system_mtime_index` (`system_mtime`),
  KEY `digital_object_component_user_mtime_index` (`user_mtime`),
  KEY `root_record_id` (`root_record_id`),
  KEY `parent_id` (`parent_id`),
  KEY `digital_object_component_component_id_index` (`component_id`),
  CONSTRAINT `digital_object_component_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `digital_object_component_ibfk_2` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`),
  CONSTRAINT `digital_object_component_ibfk_3` FOREIGN KEY (`root_record_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `digital_object_component_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `digital_object_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table enumeration
# ------------------------------------------------------------

CREATE TABLE `enumeration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `default_value` int(11) DEFAULT NULL,
  `editable` int(11) DEFAULT '1',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enumeration_system_mtime_index` (`system_mtime`),
  KEY `enumeration_user_mtime_index` (`user_mtime`),
  KEY `default_value` (`default_value`),
  CONSTRAINT `enumeration_ibfk_1` FOREIGN KEY (`default_value`) REFERENCES `enumeration_value` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table enumeration_value
# ------------------------------------------------------------

CREATE TABLE `enumeration_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enumeration_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `readonly` int(11) DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `suppressed` int(11) DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL DEFAULT '1',
  `created_by` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_modified_by` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `system_mtime` datetime DEFAULT NULL,
  `user_mtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enumeration_value_uniq` (`enumeration_id`,`value`),
  UNIQUE KEY `enumeration_position_uniq` (`enumeration_id`,`position`),
  KEY `enumeration_value_enumeration_id_index` (`enumeration_id`),
  KEY `enumeration_value_value_index` (`value`),
  CONSTRAINT `enumeration_value_ibfk_1` FOREIGN KEY (`enumeration_id`) REFERENCES `enumeration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table event
# ------------------------------------------------------------

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `repo_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `outcome_id` int(11) DEFAULT NULL,
  `outcome_note` varchar(17408) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_type_id` (`event_type_id`),
  KEY `outcome_id` (`outcome_id`),
  KEY `event_system_mtime_index` (`system_mtime`),
  KEY `event_user_mtime_index` (`user_mtime`),
  KEY `event_suppressed_index` (`suppressed`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`outcome_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table event_link_rlshp
# ------------------------------------------------------------

CREATE TABLE `event_link_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `event_link_rlshp_system_mtime_index` (`system_mtime`),
  KEY `event_link_rlshp_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `resource_id` (`resource_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `agent_software_id` (`agent_software_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_link_rlshp_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_10` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_4` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_5` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_6` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_7` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_8` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `event_link_rlshp_ibfk_9` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table extent
# ------------------------------------------------------------

CREATE TABLE `extent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `deaccession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `portion_id` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `extent_type_id` int(11) NOT NULL,
  `container_summary` text,
  `physical_details` text,
  `dimensions` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extent_type_id` (`extent_type_id`),
  KEY `extent_system_mtime_index` (`system_mtime`),
  KEY `extent_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `resource_id` (`resource_id`),
  KEY `deaccession_id` (`deaccession_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  CONSTRAINT `extent_ibfk_1` FOREIGN KEY (`extent_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `extent_ibfk_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `extent_ibfk_3` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `extent_ibfk_4` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `extent_ibfk_5` FOREIGN KEY (`deaccession_id`) REFERENCES `deaccession` (`id`),
  CONSTRAINT `extent_ibfk_6` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `extent_ibfk_7` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table external_document
# ------------------------------------------------------------

CREATE TABLE `external_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `title` varchar(8704) NOT NULL,
  `location` varchar(8704) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `location_sha1` varchar(255) DEFAULT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `rights_statement_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `identifier_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_exdoc_acc` (`accession_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_arc_obj` (`archival_object_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_res` (`resource_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_sub` (`subject_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_age_per` (`agent_person_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_age_fam` (`agent_family_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_age_cor_ent` (`agent_corporate_entity_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_age_sof` (`agent_software_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_rig_sta` (`rights_statement_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_dig_obj` (`digital_object_id`,`location_sha1`),
  UNIQUE KEY `uniq_exdoc_dig_obj_com` (`digital_object_component_id`,`location_sha1`),
  KEY `external_document_system_mtime_index` (`system_mtime`),
  KEY `external_document_user_mtime_index` (`user_mtime`),
  KEY `event_external_document_fk` (`event_id`),
  KEY `external_document_identifier_type_id_fk` (`identifier_type_id`),
  CONSTRAINT `event_external_document_fk` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `external_document_ibfk_1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `external_document_ibfk_10` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `external_document_ibfk_11` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `external_document_ibfk_2` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `external_document_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `external_document_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `external_document_ibfk_5` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `external_document_ibfk_6` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `external_document_ibfk_7` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `external_document_ibfk_8` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `external_document_ibfk_9` FOREIGN KEY (`rights_statement_id`) REFERENCES `rights_statement` (`id`),
  CONSTRAINT `external_document_identifier_type_id_fk` FOREIGN KEY (`identifier_type_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table external_id
# ------------------------------------------------------------

CREATE TABLE `external_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `collection_management_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `external_id_system_mtime_index` (`system_mtime`),
  KEY `external_id_user_mtime_index` (`user_mtime`),
  KEY `subject_id` (`subject_id`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `collection_management_id` (`collection_management_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `event_id` (`event_id`),
  KEY `location_id` (`location_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `external_id_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `external_id_ibfk_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `external_id_ibfk_3` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `external_id_ibfk_4` FOREIGN KEY (`collection_management_id`) REFERENCES `collection_management` (`id`),
  CONSTRAINT `external_id_ibfk_5` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `external_id_ibfk_6` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `external_id_ibfk_7` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `external_id_ibfk_8` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `external_id_ibfk_9` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table file_version
# ------------------------------------------------------------

CREATE TABLE `file_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `use_statement_id` int(11) DEFAULT NULL,
  `checksum_method_id` int(11) DEFAULT NULL,
  `file_uri` varchar(17408) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  `xlink_actuate_attribute_id` int(11) DEFAULT NULL,
  `xlink_show_attribute_id` int(11) DEFAULT NULL,
  `file_format_name_id` int(11) DEFAULT NULL,
  `file_format_version` varchar(255) DEFAULT NULL,
  `file_size_bytes` int(11) DEFAULT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `checksum_method` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `is_representative` int(11) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `digital_object_one_representative_file_version` (`is_representative`,`digital_object_id`),
  KEY `use_statement_id` (`use_statement_id`),
  KEY `checksum_method_id` (`checksum_method_id`),
  KEY `xlink_actuate_attribute_id` (`xlink_actuate_attribute_id`),
  KEY `xlink_show_attribute_id` (`xlink_show_attribute_id`),
  KEY `file_format_name_id` (`file_format_name_id`),
  KEY `file_version_system_mtime_index` (`system_mtime`),
  KEY `file_version_user_mtime_index` (`user_mtime`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  CONSTRAINT `file_version_ibfk_1` FOREIGN KEY (`use_statement_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `file_version_ibfk_2` FOREIGN KEY (`checksum_method_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `file_version_ibfk_3` FOREIGN KEY (`xlink_actuate_attribute_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `file_version_ibfk_4` FOREIGN KEY (`xlink_show_attribute_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `file_version_ibfk_5` FOREIGN KEY (`file_format_name_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `file_version_ibfk_6` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `file_version_ibfk_7` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table group
# ------------------------------------------------------------

CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `group_code` varchar(255) NOT NULL,
  `group_code_norm` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_uniq` (`repo_id`,`group_code_norm`),
  KEY `group_system_mtime_index` (`system_mtime`),
  KEY `group_user_mtime_index` (`user_mtime`),
  CONSTRAINT `group_repo_id_fk` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table group_permission
# ------------------------------------------------------------

CREATE TABLE `group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_permission_permission_id_group_id_index` (`permission_id`,`group_id`),
  KEY `group_permission_permission_id_index` (`permission_id`),
  KEY `group_permission_group_id_index` (`group_id`),
  CONSTRAINT `group_permission_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_permission_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table group_user
# ------------------------------------------------------------

CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_user_group_id_index` (`group_id`),
  KEY `group_user_user_id_index` (`user_id`),
  CONSTRAINT `group_user_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table instance
# ------------------------------------------------------------

CREATE TABLE `instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `instance_type_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `is_representative` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_one_representative_instance` (`is_representative`,`resource_id`),
  UNIQUE KEY `component_one_representative_instance` (`is_representative`,`archival_object_id`),
  KEY `instance_type_id` (`instance_type_id`),
  KEY `instance_system_mtime_index` (`system_mtime`),
  KEY `instance_user_mtime_index` (`user_mtime`),
  KEY `resource_id` (`resource_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `accession_id` (`accession_id`),
  CONSTRAINT `instance_ibfk_1` FOREIGN KEY (`instance_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `instance_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `instance_ibfk_3` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `instance_ibfk_4` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table instance_do_link_rlshp
# ------------------------------------------------------------

CREATE TABLE `instance_do_link_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `digital_object_id` int(11) DEFAULT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `instance_do_link_rlshp_system_mtime_index` (`system_mtime`),
  KEY `instance_do_link_rlshp_user_mtime_index` (`user_mtime`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `instance_do_link_rlshp_ibfk_1` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `instance_do_link_rlshp_ibfk_2` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job
# ------------------------------------------------------------

CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `job_blob` mediumblob NOT NULL,
  `time_submitted` datetime NOT NULL,
  `time_started` datetime DEFAULT NULL,
  `time_finished` datetime DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `job_params` varchar(255) DEFAULT NULL,
  `job_type` varchar(255) NOT NULL DEFAULT 'unknown_job_type',
  PRIMARY KEY (`id`),
  KEY `job_system_mtime_index` (`system_mtime`),
  KEY `job_user_mtime_index` (`user_mtime`),
  KEY `job_status_idx` (`status`),
  KEY `job_repo_id_fk` (`repo_id`),
  KEY `job_owner_id_fk` (`owner_id`),
  CONSTRAINT `job_owner_id_fk` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_repo_id_fk` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_created_record
# ------------------------------------------------------------

CREATE TABLE `job_created_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `record_uri` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_created_record_system_mtime_index` (`system_mtime`),
  KEY `job_created_record_user_mtime_index` (`user_mtime`),
  KEY `job_created_record_job_id_fk` (`job_id`),
  CONSTRAINT `job_created_record_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_input_file
# ------------------------------------------------------------

CREATE TABLE `job_input_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_input_file_job_id_fk` (`job_id`),
  CONSTRAINT `job_input_file_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table job_modified_record
# ------------------------------------------------------------

CREATE TABLE `job_modified_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `record_uri` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_modified_record_system_mtime_index` (`system_mtime`),
  KEY `job_modified_record_user_mtime_index` (`user_mtime`),
  KEY `job_modified_record_job_id_fk` (`job_id`),
  CONSTRAINT `job_modified_record_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table linked_agent_term
# ------------------------------------------------------------

CREATE TABLE `linked_agent_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linked_agents_rlshp_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `term_id` (`term_id`),
  KEY `linked_agent_term_idx` (`linked_agents_rlshp_id`,`term_id`),
  CONSTRAINT `linked_agent_term_ibfk_1` FOREIGN KEY (`linked_agents_rlshp_id`) REFERENCES `linked_agents_rlshp` (`id`),
  CONSTRAINT `linked_agent_term_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table linked_agents_rlshp
# ------------------------------------------------------------

CREATE TABLE `linked_agents_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `relator_id` int(11) DEFAULT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `rights_statement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `relator_id` (`relator_id`),
  KEY `linked_agents_rlshp_system_mtime_index` (`system_mtime`),
  KEY `linked_agents_rlshp_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_software_id` (`agent_software_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `event_id` (`event_id`),
  KEY `resource_id` (`resource_id`),
  KEY `rights_statement_id` (`rights_statement_id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_10` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_11` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_12` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_13` FOREIGN KEY (`rights_statement_id`) REFERENCES `rights_statement` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_2` FOREIGN KEY (`relator_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_3` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_4` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_5` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_6` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_7` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_8` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `linked_agents_rlshp_ibfk_9` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table location
# ------------------------------------------------------------

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `building` varchar(255) NOT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `coordinate_1_label` varchar(255) DEFAULT NULL,
  `coordinate_1_indicator` varchar(255) DEFAULT NULL,
  `coordinate_2_label` varchar(255) DEFAULT NULL,
  `coordinate_2_indicator` varchar(255) DEFAULT NULL,
  `coordinate_3_label` varchar(255) DEFAULT NULL,
  `coordinate_3_indicator` varchar(255) DEFAULT NULL,
  `temporary_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `temporary_id` (`temporary_id`),
  KEY `location_system_mtime_index` (`system_mtime`),
  KEY `location_user_mtime_index` (`user_mtime`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`temporary_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table location_function
# ------------------------------------------------------------

CREATE TABLE `location_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `location_function_type_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_function_type_id` (`location_function_type_id`),
  KEY `location_function_system_mtime_index` (`system_mtime`),
  KEY `location_function_user_mtime_index` (`user_mtime`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `location_function_ibfk_1` FOREIGN KEY (`location_function_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `location_function_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table location_profile
# ------------------------------------------------------------

CREATE TABLE `location_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dimension_units_id` int(11) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `depth` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_profile_name_uniq` (`name`),
  KEY `dimension_units_id` (`dimension_units_id`),
  KEY `location_profile_system_mtime_index` (`system_mtime`),
  KEY `location_profile_user_mtime_index` (`user_mtime`),
  CONSTRAINT `location_profile_ibfk_1` FOREIGN KEY (`dimension_units_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table location_profile_rlshp
# ------------------------------------------------------------

CREATE TABLE `location_profile_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `location_profile_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_profile_rlshp_system_mtime_index` (`system_mtime`),
  KEY `location_profile_rlshp_user_mtime_index` (`user_mtime`),
  KEY `location_id` (`location_id`),
  KEY `location_profile_id` (`location_profile_id`),
  CONSTRAINT `location_profile_rlshp_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `location_profile_rlshp_ibfk_2` FOREIGN KEY (`location_profile_id`) REFERENCES `location_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table name_authority_id
# ------------------------------------------------------------

CREATE TABLE `name_authority_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `name_person_id` int(11) DEFAULT NULL,
  `name_family_id` int(11) DEFAULT NULL,
  `name_software_id` int(11) DEFAULT NULL,
  `name_corporate_entity_id` int(11) DEFAULT NULL,
  `authority_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority_id` (`authority_id`),
  KEY `name_authority_id_system_mtime_index` (`system_mtime`),
  KEY `name_authority_id_user_mtime_index` (`user_mtime`),
  KEY `name_person_id` (`name_person_id`),
  KEY `name_family_id` (`name_family_id`),
  KEY `name_software_id` (`name_software_id`),
  KEY `name_corporate_entity_id` (`name_corporate_entity_id`),
  CONSTRAINT `name_authority_id_ibfk_1` FOREIGN KEY (`name_person_id`) REFERENCES `name_person` (`id`),
  CONSTRAINT `name_authority_id_ibfk_2` FOREIGN KEY (`name_family_id`) REFERENCES `name_family` (`id`),
  CONSTRAINT `name_authority_id_ibfk_3` FOREIGN KEY (`name_software_id`) REFERENCES `name_software` (`id`),
  CONSTRAINT `name_authority_id_ibfk_4` FOREIGN KEY (`name_corporate_entity_id`) REFERENCES `name_corporate_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table name_corporate_entity
# ------------------------------------------------------------

CREATE TABLE `name_corporate_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `agent_corporate_entity_id` int(11) NOT NULL,
  `primary_name` text NOT NULL,
  `subordinate_name_1` text,
  `subordinate_name_2` text,
  `number` varchar(255) DEFAULT NULL,
  `dates` varchar(255) DEFAULT NULL,
  `qualifier` text,
  `source_id` int(11) DEFAULT NULL,
  `rules_id` int(11) DEFAULT NULL,
  `sort_name` text NOT NULL,
  `sort_name_auto_generate` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `authorized` int(11) DEFAULT NULL,
  `is_display_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `corporate_entity_one_authorized` (`authorized`,`agent_corporate_entity_id`),
  UNIQUE KEY `corporate_entity_one_display_name` (`is_display_name`,`agent_corporate_entity_id`),
  KEY `source_id` (`source_id`),
  KEY `rules_id` (`rules_id`),
  KEY `name_corporate_entity_system_mtime_index` (`system_mtime`),
  KEY `name_corporate_entity_user_mtime_index` (`user_mtime`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  CONSTRAINT `name_corporate_entity_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_corporate_entity_ibfk_2` FOREIGN KEY (`rules_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_corporate_entity_ibfk_3` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table name_family
# ------------------------------------------------------------

CREATE TABLE `name_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `agent_family_id` int(11) NOT NULL,
  `family_name` text NOT NULL,
  `prefix` text,
  `dates` varchar(255) DEFAULT NULL,
  `qualifier` text,
  `source_id` int(11) DEFAULT NULL,
  `rules_id` int(11) DEFAULT NULL,
  `sort_name` text NOT NULL,
  `sort_name_auto_generate` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `authorized` int(11) DEFAULT NULL,
  `is_display_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `family_one_authorized` (`authorized`,`agent_family_id`),
  UNIQUE KEY `family_one_display_name` (`is_display_name`,`agent_family_id`),
  KEY `source_id` (`source_id`),
  KEY `rules_id` (`rules_id`),
  KEY `name_family_system_mtime_index` (`system_mtime`),
  KEY `name_family_user_mtime_index` (`user_mtime`),
  KEY `agent_family_id` (`agent_family_id`),
  CONSTRAINT `name_family_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_family_ibfk_2` FOREIGN KEY (`rules_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_family_ibfk_3` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table name_person
# ------------------------------------------------------------

CREATE TABLE `name_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `agent_person_id` int(11) NOT NULL,
  `primary_name` varchar(255) NOT NULL,
  `name_order_id` int(11) NOT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `prefix` text,
  `rest_of_name` text,
  `suffix` text,
  `fuller_form` text,
  `number` varchar(255) DEFAULT NULL,
  `dates` varchar(255) DEFAULT NULL,
  `qualifier` text,
  `source_id` int(11) DEFAULT NULL,
  `rules_id` int(11) DEFAULT NULL,
  `sort_name` text NOT NULL,
  `sort_name_auto_generate` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `authorized` int(11) DEFAULT NULL,
  `is_display_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_one_authorized` (`authorized`,`agent_person_id`),
  UNIQUE KEY `person_one_display_name` (`is_display_name`,`agent_person_id`),
  KEY `name_order_id` (`name_order_id`),
  KEY `source_id` (`source_id`),
  KEY `rules_id` (`rules_id`),
  KEY `name_person_system_mtime_index` (`system_mtime`),
  KEY `name_person_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id` (`agent_person_id`),
  CONSTRAINT `name_person_ibfk_1` FOREIGN KEY (`name_order_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_person_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_person_ibfk_3` FOREIGN KEY (`rules_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_person_ibfk_4` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table name_software
# ------------------------------------------------------------

CREATE TABLE `name_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `agent_software_id` int(11) NOT NULL,
  `software_name` text NOT NULL,
  `version` text,
  `manufacturer` text,
  `dates` varchar(255) DEFAULT NULL,
  `qualifier` text,
  `source_id` int(11) DEFAULT NULL,
  `rules_id` int(11) DEFAULT NULL,
  `sort_name` text NOT NULL,
  `sort_name_auto_generate` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `authorized` int(11) DEFAULT NULL,
  `is_display_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `software_one_authorized` (`authorized`,`agent_software_id`),
  UNIQUE KEY `software_one_display_name` (`is_display_name`,`agent_software_id`),
  KEY `source_id` (`source_id`),
  KEY `rules_id` (`rules_id`),
  KEY `name_software_system_mtime_index` (`system_mtime`),
  KEY `name_software_user_mtime_index` (`user_mtime`),
  KEY `agent_software_id` (`agent_software_id`),
  CONSTRAINT `name_software_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_software_ibfk_2` FOREIGN KEY (`rules_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `name_software_ibfk_3` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table note
# ------------------------------------------------------------

CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '1',
  `resource_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `notes_json_schema_version` int(11) NOT NULL,
  `notes` mediumblob NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `rights_statement_act_id` int(11) DEFAULT NULL,
  `rights_statement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `note_system_mtime_index` (`system_mtime`),
  KEY `note_user_mtime_index` (`user_mtime`),
  KEY `resource_id` (`resource_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `agent_person_id` (`agent_person_id`),
  KEY `agent_corporate_entity_id` (`agent_corporate_entity_id`),
  KEY `agent_family_id` (`agent_family_id`),
  KEY `agent_software_id` (`agent_software_id`),
  KEY `rights_statement_act_id` (`rights_statement_act_id`),
  KEY `rights_statement_id` (`rights_statement_id`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `note_ibfk_10` FOREIGN KEY (`rights_statement_id`) REFERENCES `rights_statement` (`id`),
  CONSTRAINT `note_ibfk_2` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `note_ibfk_3` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `note_ibfk_4` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `note_ibfk_5` FOREIGN KEY (`agent_person_id`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `note_ibfk_6` FOREIGN KEY (`agent_corporate_entity_id`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `note_ibfk_7` FOREIGN KEY (`agent_family_id`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `note_ibfk_8` FOREIGN KEY (`agent_software_id`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `note_ibfk_9` FOREIGN KEY (`rights_statement_act_id`) REFERENCES `rights_statement_act` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table note_persistent_id
# ------------------------------------------------------------

CREATE TABLE `note_persistent_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `persistent_id` varchar(255) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `note_persistent_id_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table notification
# ------------------------------------------------------------

CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `code` varchar(255) NOT NULL,
  `params` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_time_index` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table owner_repo_rlshp
# ------------------------------------------------------------

CREATE TABLE `owner_repo_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_repo_rlshp_system_mtime_index` (`system_mtime`),
  KEY `owner_repo_rlshp_user_mtime_index` (`user_mtime`),
  KEY `location_id` (`location_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `owner_repo_rlshp_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `owner_repo_rlshp_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repository` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table permission
# ------------------------------------------------------------

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `level` varchar(255) DEFAULT 'repository',
  `system` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_code` (`permission_code`),
  KEY `permission_system_mtime_index` (`system_mtime`),
  KEY `permission_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table preference
# ------------------------------------------------------------

CREATE TABLE `preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_uniq` varchar(255) NOT NULL,
  `defaults` mediumblob NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preference_uniq` (`repo_id`,`user_uniq`),
  KEY `preference_system_mtime_index` (`system_mtime`),
  KEY `preference_user_mtime_index` (`user_mtime`),
  KEY `preference_user_id_fk` (`user_id`),
  CONSTRAINT `preference_repo_id_fk` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`) ON DELETE CASCADE,
  CONSTRAINT `preference_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rde_template
# ------------------------------------------------------------

CREATE TABLE `rde_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` blob,
  `visible` blob,
  `defaults` blob,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rde_template_system_mtime_index` (`system_mtime`),
  KEY `rde_template_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table related_accession_rlshp
# ------------------------------------------------------------

CREATE TABLE `related_accession_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_id_0` int(11) DEFAULT NULL,
  `accession_id_1` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `relator_id` int(11) NOT NULL,
  `relator_type_id` int(11) NOT NULL,
  `relationship_target_record_type` varchar(255) NOT NULL,
  `relationship_target_id` int(11) NOT NULL,
  `jsonmodel_type` varchar(255) NOT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relator_id` (`relator_id`),
  KEY `relator_type_id` (`relator_type_id`),
  KEY `related_accession_rlshp_system_mtime_index` (`system_mtime`),
  KEY `related_accession_rlshp_user_mtime_index` (`user_mtime`),
  KEY `accession_id_0` (`accession_id_0`),
  KEY `accession_id_1` (`accession_id_1`),
  CONSTRAINT `related_accession_rlshp_ibfk_1` FOREIGN KEY (`relator_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `related_accession_rlshp_ibfk_2` FOREIGN KEY (`relator_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `related_accession_rlshp_ibfk_3` FOREIGN KEY (`accession_id_0`) REFERENCES `accession` (`id`),
  CONSTRAINT `related_accession_rlshp_ibfk_4` FOREIGN KEY (`accession_id_1`) REFERENCES `accession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table related_agents_rlshp
# ------------------------------------------------------------

CREATE TABLE `related_agents_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_person_id_0` int(11) DEFAULT NULL,
  `agent_person_id_1` int(11) DEFAULT NULL,
  `agent_corporate_entity_id_0` int(11) DEFAULT NULL,
  `agent_corporate_entity_id_1` int(11) DEFAULT NULL,
  `agent_software_id_0` int(11) DEFAULT NULL,
  `agent_software_id_1` int(11) DEFAULT NULL,
  `agent_family_id_0` int(11) DEFAULT NULL,
  `agent_family_id_1` int(11) DEFAULT NULL,
  `relator` varchar(255) NOT NULL,
  `jsonmodel_type` varchar(255) NOT NULL,
  `description` text,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `relationship_target_record_type` varchar(255) NOT NULL,
  `relationship_target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `related_agents_rlshp_system_mtime_index` (`system_mtime`),
  KEY `related_agents_rlshp_user_mtime_index` (`user_mtime`),
  KEY `agent_person_id_0` (`agent_person_id_0`),
  KEY `agent_person_id_1` (`agent_person_id_1`),
  KEY `agent_corporate_entity_id_0` (`agent_corporate_entity_id_0`),
  KEY `agent_corporate_entity_id_1` (`agent_corporate_entity_id_1`),
  KEY `agent_software_id_0` (`agent_software_id_0`),
  KEY `agent_software_id_1` (`agent_software_id_1`),
  KEY `agent_family_id_0` (`agent_family_id_0`),
  KEY `agent_family_id_1` (`agent_family_id_1`),
  CONSTRAINT `related_agents_rlshp_ibfk_1` FOREIGN KEY (`agent_person_id_0`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_2` FOREIGN KEY (`agent_person_id_1`) REFERENCES `agent_person` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_3` FOREIGN KEY (`agent_corporate_entity_id_0`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_4` FOREIGN KEY (`agent_corporate_entity_id_1`) REFERENCES `agent_corporate_entity` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_5` FOREIGN KEY (`agent_software_id_0`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_6` FOREIGN KEY (`agent_software_id_1`) REFERENCES `agent_software` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_7` FOREIGN KEY (`agent_family_id_0`) REFERENCES `agent_family` (`id`),
  CONSTRAINT `related_agents_rlshp_ibfk_8` FOREIGN KEY (`agent_family_id_1`) REFERENCES `agent_family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table repository
# ------------------------------------------------------------

CREATE TABLE `repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `org_code` varchar(255) DEFAULT NULL,
  `parent_institution_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `contact_persons` text,
  `country_id` int(11) DEFAULT NULL,
  `agent_representation_id` int(11) DEFAULT NULL,
  `hidden` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `publish` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_code` (`repo_code`),
  KEY `country_id` (`country_id`),
  KEY `repository_system_mtime_index` (`system_mtime`),
  KEY `repository_user_mtime_index` (`user_mtime`),
  KEY `agent_representation_id` (`agent_representation_id`),
  CONSTRAINT `repository_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `repository_ibfk_2` FOREIGN KEY (`agent_representation_id`) REFERENCES `agent_corporate_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table resource
# ------------------------------------------------------------

CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `repo_id` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `title` varchar(8704) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `level_id` int(11) NOT NULL,
  `other_level` varchar(255) DEFAULT NULL,
  `resource_type_id` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `restrictions` int(11) DEFAULT NULL,
  `repository_processing_note` text,
  `ead_id` varchar(255) DEFAULT NULL,
  `ead_location` varchar(255) DEFAULT NULL,
  `finding_aid_title` text,
  `finding_aid_filing_title` text,
  `finding_aid_date` varchar(255) DEFAULT NULL,
  `finding_aid_author` text,
  `finding_aid_description_rules_id` int(11) DEFAULT NULL,
  `finding_aid_language` varchar(255) DEFAULT NULL,
  `finding_aid_sponsor` text,
  `finding_aid_edition_statement` text,
  `finding_aid_series_statement` text,
  `finding_aid_status_id` int(11) DEFAULT NULL,
  `finding_aid_note` text,
  `system_generated` int(11) DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `finding_aid_subtitle` text,
  `finding_aid_sponsor_sha1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_unique_identifier` (`repo_id`,`identifier`),
  UNIQUE KEY `resource_unique_ead_id` (`repo_id`,`ead_id`),
  KEY `language_id` (`language_id`),
  KEY `level_id` (`level_id`),
  KEY `resource_type_id` (`resource_type_id`),
  KEY `finding_aid_description_rules_id` (`finding_aid_description_rules_id`),
  KEY `finding_aid_status_id` (`finding_aid_status_id`),
  KEY `resource_system_mtime_index` (`system_mtime`),
  KEY `resource_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `resource_ibfk_3` FOREIGN KEY (`resource_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `resource_ibfk_4` FOREIGN KEY (`finding_aid_description_rules_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `resource_ibfk_5` FOREIGN KEY (`finding_aid_status_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `resource_ibfk_6` FOREIGN KEY (`repo_id`) REFERENCES `repository` (`id`),
  CONSTRAINT `resource_ibfk_7` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table revision_statement
# ------------------------------------------------------------

CREATE TABLE `revision_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `description` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `revision_statement_system_mtime_index` (`system_mtime`),
  KEY `revision_statement_user_mtime_index` (`user_mtime`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `revision_statement_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rights_restriction
# ------------------------------------------------------------

CREATE TABLE `rights_restriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `restriction_note_type` varchar(255) DEFAULT NULL,
  `begin` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`),
  KEY `archival_object_id` (`archival_object_id`),
  CONSTRAINT `rights_restriction_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `rights_restriction_ibfk_2` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rights_restriction_type
# ------------------------------------------------------------

CREATE TABLE `rights_restriction_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rights_restriction_id` int(11) NOT NULL,
  `restriction_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restriction_type_id` (`restriction_type_id`),
  KEY `rights_restriction_id` (`rights_restriction_id`),
  CONSTRAINT `rights_restriction_type_ibfk_1` FOREIGN KEY (`restriction_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_restriction_type_ibfk_2` FOREIGN KEY (`rights_restriction_id`) REFERENCES `rights_restriction` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rights_statement
# ------------------------------------------------------------

CREATE TABLE `rights_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `repo_id` int(11) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `rights_type_id` int(11) NOT NULL,
  `statute_citation` varchar(255) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `determination_date` date DEFAULT NULL,
  `license_terms` varchar(255) DEFAULT NULL,
  `other_rights_basis_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rights_type_id` (`rights_type_id`),
  KEY `jurisdiction_id` (`jurisdiction_id`),
  KEY `rights_statement_system_mtime_index` (`system_mtime`),
  KEY `rights_statement_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `resource_id` (`resource_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `rights_statement_status_id_fk` (`status_id`),
  KEY `rights_statement_other_rights_basis_id_fk` (`other_rights_basis_id`),
  CONSTRAINT `rights_statement_ibfk_1` FOREIGN KEY (`rights_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_statement_ibfk_3` FOREIGN KEY (`jurisdiction_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_statement_ibfk_4` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `rights_statement_ibfk_5` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `rights_statement_ibfk_6` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `rights_statement_ibfk_7` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `rights_statement_ibfk_8` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `rights_statement_other_rights_basis_id_fk` FOREIGN KEY (`other_rights_basis_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_statement_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rights_statement_act
# ------------------------------------------------------------

CREATE TABLE `rights_statement_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rights_statement_id` int(11) NOT NULL,
  `act_type_id` int(11) NOT NULL,
  `restriction_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `act_type_id` (`act_type_id`),
  KEY `restriction_id` (`restriction_id`),
  KEY `rights_statement_act_system_mtime_index` (`system_mtime`),
  KEY `rights_statement_act_user_mtime_index` (`user_mtime`),
  KEY `rights_statement_id` (`rights_statement_id`),
  CONSTRAINT `rights_statement_act_ibfk_1` FOREIGN KEY (`act_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_statement_act_ibfk_2` FOREIGN KEY (`restriction_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `rights_statement_act_ibfk_3` FOREIGN KEY (`rights_statement_id`) REFERENCES `rights_statement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table rights_statement_pre_088
# ------------------------------------------------------------

CREATE TABLE `rights_statement_pre_088` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `repo_id` int(11) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `rights_type_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `materials` varchar(255) DEFAULT NULL,
  `ip_status_id` int(11) DEFAULT NULL,
  `ip_expiration_date` date DEFAULT NULL,
  `license_identifier_terms` varchar(255) DEFAULT NULL,
  `statute_citation` varchar(255) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `type_note` varchar(255) DEFAULT NULL,
  `permissions` text,
  `restrictions` text,
  `restriction_start_date` date DEFAULT NULL,
  `restriction_end_date` date DEFAULT NULL,
  `granted_note` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `agent_person_id` int(11) DEFAULT NULL,
  `agent_family_id` int(11) DEFAULT NULL,
  `agent_corporate_entity_id` int(11) DEFAULT NULL,
  `agent_software_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table schema_info
# ------------------------------------------------------------

CREATE TABLE `schema_info` (
  `version` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sequence
# ------------------------------------------------------------

CREATE TABLE `sequence` (
  `sequence_name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`sequence_name`),
  KEY `sequence_namevalue_idx` (`sequence_name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table session
# ------------------------------------------------------------

CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `system_mtime` datetime NOT NULL,
  `expirable` int(11) DEFAULT '1',
  `session_data` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `session_system_mtime_index` (`system_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table spawned_rlshp
# ------------------------------------------------------------

CREATE TABLE `spawned_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spawned_rlshp_system_mtime_index` (`system_mtime`),
  KEY `spawned_rlshp_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `spawned_rlshp_ibfk_1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `spawned_rlshp_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sub_container
# ------------------------------------------------------------

CREATE TABLE `sub_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `instance_id` int(11) DEFAULT NULL,
  `type_2_id` int(11) DEFAULT NULL,
  `indicator_2` varchar(255) DEFAULT NULL,
  `type_3_id` int(11) DEFAULT NULL,
  `indicator_3` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_2_id` (`type_2_id`),
  KEY `type_3_id` (`type_3_id`),
  KEY `sub_container_system_mtime_index` (`system_mtime`),
  KEY `sub_container_user_mtime_index` (`user_mtime`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `sub_container_ibfk_1` FOREIGN KEY (`type_2_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `sub_container_ibfk_2` FOREIGN KEY (`type_3_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `sub_container_ibfk_3` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table subject
# ------------------------------------------------------------

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `vocab_id` int(11) NOT NULL,
  `title` varchar(8704) DEFAULT NULL,
  `terms_sha1` varchar(255) NOT NULL,
  `authority_id` varchar(255) DEFAULT NULL,
  `scope_note` text,
  `source_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subj_auth_source_uniq` (`vocab_id`,`authority_id`,`source_id`),
  UNIQUE KEY `subj_terms_uniq` (`vocab_id`,`terms_sha1`,`source_id`),
  KEY `source_id` (`source_id`),
  KEY `subject_terms_sha1_index` (`terms_sha1`),
  KEY `subject_system_mtime_index` (`system_mtime`),
  KEY `subject_user_mtime_index` (`user_mtime`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`vocab_id`) REFERENCES `vocabulary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table subject_rlshp
# ------------------------------------------------------------

CREATE TABLE `subject_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accession_id` int(11) DEFAULT NULL,
  `archival_object_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `digital_object_component_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `subject_rlshp_system_mtime_index` (`system_mtime`),
  KEY `subject_rlshp_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `archival_object_id` (`archival_object_id`),
  KEY `resource_id` (`resource_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `digital_object_component_id` (`digital_object_component_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `subject_rlshp_ibfk_1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `subject_rlshp_ibfk_2` FOREIGN KEY (`archival_object_id`) REFERENCES `archival_object` (`id`),
  CONSTRAINT `subject_rlshp_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `subject_rlshp_ibfk_4` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `subject_rlshp_ibfk_5` FOREIGN KEY (`digital_object_component_id`) REFERENCES `digital_object_component` (`id`),
  CONSTRAINT `subject_rlshp_ibfk_6` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table subject_term
# ------------------------------------------------------------

CREATE TABLE `subject_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `term_id` (`term_id`),
  KEY `subject_term_idx` (`subject_id`,`term_id`),
  CONSTRAINT `subject_term_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `subject_term_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table subnote_metadata
# ------------------------------------------------------------

CREATE TABLE `subnote_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `publish` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `subnote_metadata_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table system_event
# ------------------------------------------------------------

CREATE TABLE `system_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_time_index` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table telephone
# ------------------------------------------------------------

CREATE TABLE `telephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_contact_id` int(11) DEFAULT NULL,
  `number` text NOT NULL,
  `ext` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `number_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `telephone_system_mtime_index` (`system_mtime`),
  KEY `telephone_user_mtime_index` (`user_mtime`),
  KEY `agent_contact_id` (`agent_contact_id`),
  KEY `number_type_id` (`number_type_id`),
  CONSTRAINT `telephone_ibfk_1` FOREIGN KEY (`agent_contact_id`) REFERENCES `agent_contact` (`id`),
  CONSTRAINT `telephone_ibfk_2` FOREIGN KEY (`number_type_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table term
# ------------------------------------------------------------

CREATE TABLE `term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `vocab_id` int(11) NOT NULL,
  `term` varchar(255) NOT NULL,
  `term_type_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term_vocab_id_term_term_type_id_index` (`vocab_id`,`term`,`term_type_id`),
  KEY `term_type_id` (`term_type_id`),
  KEY `term_system_mtime_index` (`system_mtime`),
  KEY `term_user_mtime_index` (`user_mtime`),
  CONSTRAINT `term_ibfk_1` FOREIGN KEY (`term_type_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `term_ibfk_2` FOREIGN KEY (`vocab_id`) REFERENCES `vocabulary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table top_container
# ------------------------------------------------------------

CREATE TABLE `top_container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `ils_holding_id` varchar(255) DEFAULT NULL,
  `ils_item_id` varchar(255) DEFAULT NULL,
  `exported_to_ils` datetime DEFAULT NULL,
  `indicator` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_for_collection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `top_container_uniq_barcode` (`repo_id`,`barcode`),
  KEY `top_container_indicator_index` (`indicator`),
  KEY `top_container_system_mtime_index` (`system_mtime`),
  KEY `top_container_user_mtime_index` (`user_mtime`),
  KEY `top_container_type_fk` (`type_id`),
  CONSTRAINT `top_container_type_fk` FOREIGN KEY (`type_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table top_container_housed_at_rlshp
# ------------------------------------------------------------

CREATE TABLE `top_container_housed_at_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `top_container_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `jsonmodel_type` varchar(255) NOT NULL DEFAULT 'container_location',
  `status` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `top_container_housed_at_rlshp_system_mtime_index` (`system_mtime`),
  KEY `top_container_housed_at_rlshp_user_mtime_index` (`user_mtime`),
  KEY `top_container_id` (`top_container_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `top_container_housed_at_rlshp_ibfk_1` FOREIGN KEY (`top_container_id`) REFERENCES `top_container` (`id`),
  CONSTRAINT `top_container_housed_at_rlshp_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table top_container_link_rlshp
# ------------------------------------------------------------

CREATE TABLE `top_container_link_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `top_container_id` int(11) DEFAULT NULL,
  `sub_container_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `top_container_link_rlshp_system_mtime_index` (`system_mtime`),
  KEY `top_container_link_rlshp_user_mtime_index` (`user_mtime`),
  KEY `top_container_id` (`top_container_id`),
  KEY `sub_container_id` (`sub_container_id`),
  CONSTRAINT `top_container_link_rlshp_ibfk_1` FOREIGN KEY (`top_container_id`) REFERENCES `top_container` (`id`),
  CONSTRAINT `top_container_link_rlshp_ibfk_2` FOREIGN KEY (`sub_container_id`) REFERENCES `sub_container` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table top_container_profile_rlshp
# ------------------------------------------------------------

CREATE TABLE `top_container_profile_rlshp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `top_container_id` int(11) DEFAULT NULL,
  `container_profile_id` int(11) DEFAULT NULL,
  `aspace_relationship_position` int(11) DEFAULT NULL,
  `suppressed` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `top_container_profile_rlshp_system_mtime_index` (`system_mtime`),
  KEY `top_container_profile_rlshp_user_mtime_index` (`user_mtime`),
  KEY `top_container_id` (`top_container_id`),
  KEY `container_profile_id` (`container_profile_id`),
  CONSTRAINT `top_container_profile_rlshp_ibfk_1` FOREIGN KEY (`top_container_id`) REFERENCES `top_container` (`id`),
  CONSTRAINT `top_container_profile_rlshp_ibfk_2` FOREIGN KEY (`container_profile_id`) REFERENCES `container_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `agent_record_id` int(11) DEFAULT NULL,
  `agent_record_type` varchar(255) DEFAULT NULL,
  `is_system_user` int(11) NOT NULL DEFAULT '0',
  `is_hidden_user` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `additional_contact` text,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_system_mtime_index` (`system_mtime`),
  KEY `user_user_mtime_index` (`user_mtime`),
  KEY `agent_record_id` (`agent_record_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`agent_record_id`) REFERENCES `agent_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_defined
# ------------------------------------------------------------

CREATE TABLE `user_defined` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `json_schema_version` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `digital_object_id` int(11) DEFAULT NULL,
  `boolean_1` int(11) DEFAULT NULL,
  `boolean_2` int(11) DEFAULT NULL,
  `boolean_3` int(11) DEFAULT NULL,
  `integer_1` varchar(255) DEFAULT NULL,
  `integer_2` varchar(255) DEFAULT NULL,
  `integer_3` varchar(255) DEFAULT NULL,
  `real_1` varchar(255) DEFAULT NULL,
  `real_2` varchar(255) DEFAULT NULL,
  `real_3` varchar(255) DEFAULT NULL,
  `string_1` varchar(255) DEFAULT NULL,
  `string_2` varchar(255) DEFAULT NULL,
  `string_3` varchar(255) DEFAULT NULL,
  `string_4` varchar(255) DEFAULT NULL,
  `text_1` text,
  `text_2` text,
  `text_3` text,
  `text_4` text,
  `text_5` text,
  `date_1` date DEFAULT NULL,
  `date_2` date DEFAULT NULL,
  `date_3` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  `enum_1_id` int(11) DEFAULT NULL,
  `enum_2_id` int(11) DEFAULT NULL,
  `enum_3_id` int(11) DEFAULT NULL,
  `enum_4_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_defined_system_mtime_index` (`system_mtime`),
  KEY `user_defined_user_mtime_index` (`user_mtime`),
  KEY `accession_id` (`accession_id`),
  KEY `resource_id` (`resource_id`),
  KEY `digital_object_id` (`digital_object_id`),
  KEY `enum_1_id` (`enum_1_id`),
  KEY `enum_2_id` (`enum_2_id`),
  KEY `enum_3_id` (`enum_3_id`),
  KEY `enum_4_id` (`enum_4_id`),
  CONSTRAINT `user_defined_ibfk_1` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`),
  CONSTRAINT `user_defined_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  CONSTRAINT `user_defined_ibfk_3` FOREIGN KEY (`digital_object_id`) REFERENCES `digital_object` (`id`),
  CONSTRAINT `user_defined_ibfk_4` FOREIGN KEY (`enum_1_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `user_defined_ibfk_5` FOREIGN KEY (`enum_2_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `user_defined_ibfk_6` FOREIGN KEY (`enum_3_id`) REFERENCES `enumeration_value` (`id`),
  CONSTRAINT `user_defined_ibfk_7` FOREIGN KEY (`enum_4_id`) REFERENCES `enumeration_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table vocabulary
# ------------------------------------------------------------

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ref_id` varchar(255) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `system_mtime` datetime NOT NULL,
  `user_mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ref_id` (`ref_id`),
  KEY `vocabulary_system_mtime_index` (`system_mtime`),
  KEY `vocabulary_user_mtime_index` (`user_mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Dumping routines (FUNCTION) for database 'relTest2_1_0'
--
DELIMITER ;;

# Dump of FUNCTION generateLocationTitle
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE=""*/;;
# Dump of FUNCTION GetAccessionAcknowledgementSent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionCataloged
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionCatalogedDate
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionContainerSummary
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionDateExpression
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionDatePart
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionExtentType
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionIdForInstance
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionProcessed
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionProcessedDate
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionRightsTransferred
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionRightsTransferredNote
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionsCataloged
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionsExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionsProcessed
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionsWithRestrictions
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAccessionsWithRightsTransferred
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentMatch
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentsCorporate
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentsFamily
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentSortName
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentsPersonal
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentsSoftware
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetAgentUniqueName
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetBoolean
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetCoordinate
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetDeaccessionDate
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetDeaccessionExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetDeaccessionExtentType
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetDigitalObjectDateExpression
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetDigitalObjectId
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetEnumValue
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetEnumValueUF
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetEventDateExpression
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetFaxNumber
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetInstanceCount
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetLanguageCount
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetPhoneNumber
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetRepositoryName
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceContainerSummary
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceCreator
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceDateExpression
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceDeaccessionExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceExtentType
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceHasCreator
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceHasDeaccession
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceHasSource
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceId
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceIdentiferForInstance
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceIdForInstance
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourcesExtent
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourcesWithFindingAids
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourcesWithRestrictions
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetResourceTitleForInstance
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetStatusCount
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTermType
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTermTypeCount
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTotalAccessions
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTotalResources
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTotalResourcesItems
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
# Dump of FUNCTION GetTotalSubjects
# ------------------------------------------------------------

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES"*/;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
