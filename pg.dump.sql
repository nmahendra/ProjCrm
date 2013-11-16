--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actions_required; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actions_required (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    action_id integer,
    officer_id integer NOT NULL,
    permit_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    action_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    audit_date timestamp(0) without time zone NOT NULL,
    review_date timestamp(0) without time zone NOT NULL,
    description text
);


--
-- Name: actions_required_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actions_required_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    street_type_id integer,
    state_id integer,
    country_id integer,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    verified boolean NOT NULL,
    building_name character varying(50) DEFAULT NULL::character varying,
    sub_unit character varying(50) DEFAULT NULL::character varying,
    floor character varying(20) DEFAULT NULL::character varying,
    mail_box character varying(100) NOT NULL,
    po_box character varying(50) DEFAULT NULL::character varying,
    lot_number character varying(20) DEFAULT NULL::character varying,
    street_number character varying(20) DEFAULT NULL::character varying,
    street_name character varying(100) DEFAULT NULL::character varying,
    post_code character varying(25) DEFAULT NULL::character varying,
    suburb character varying(250) DEFAULT NULL::character varying
);


--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advice; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE advice (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    required boolean NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    requested_date timestamp(0) without time zone NOT NULL,
    received_date timestamp(0) without time zone NOT NULL,
    description text
);


--
-- Name: advice_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE advice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE app_user (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    username_canonical character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_canonical character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    locked boolean NOT NULL,
    expired boolean NOT NULL,
    expires_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    roles text NOT NULL,
    credentials_expired boolean NOT NULL,
    credentials_expire_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    failed_login_count integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    class character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL
);


--
-- Name: COLUMN app_user.roles; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN app_user.roles IS '(DC2Type:array)';


--
-- Name: app_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE app_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: appeal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE appeal (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    appellant_id integer NOT NULL,
    decision_id integer,
    action_required_id integer NOT NULL,
    permit_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    mine_number character varying(20) DEFAULT NULL::character varying,
    decision_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    decision_description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    description text
);


--
-- Name: appeal_dms_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE appeal_dms_links (
    appeal_id integer NOT NULL,
    dms_model_id integer NOT NULL
);


--
-- Name: appeal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE appeal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assessment_activity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assessment_activity (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    accessor_id integer,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    reference_code character varying(10) DEFAULT NULL::character varying,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: assessment_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assessment_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE audit (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type_id integer NOT NULL,
    object_type character varying(100) NOT NULL,
    object_id integer NOT NULL,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: audit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comment (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    variance_id integer,
    commenter_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    methodology text,
    offset_variance boolean NOT NULL,
    offset_area double precision NOT NULL,
    public_comment boolean NOT NULL,
    decision boolean NOT NULL,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: comment_clearing_principles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comment_clearing_principles (
    comment_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: comment_criterion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comment_criterion (
    comment_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: comment_dms_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comment_dms_links (
    comment_id integer NOT NULL,
    dms_model_id integer NOT NULL
);


--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    entity_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    company_name character varying(100) DEFAULT NULL::character varying,
    company_abbrev character varying(50) DEFAULT NULL::character varying
);


--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: compliance_activity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE compliance_activity (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    outcome_id integer NOT NULL,
    action_id integer,
    officer_id integer NOT NULL,
    level_of_compliance_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    action_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    compliant boolean NOT NULL,
    icms_number character varying(20) DEFAULT NULL::character varying,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: compliance_activity_dms_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE compliance_activity_dms_links (
    compliance_activity_id integer NOT NULL,
    dms_model_id integer NOT NULL
);


--
-- Name: compliance_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE compliance_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    proponent_id integer NOT NULL,
    type_id integer NOT NULL
);


--
-- Name: correspondence; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE correspondence (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    workflow_id integer NOT NULL,
    to_user_id integer,
    from_user_id integer,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    bring_up_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    completed boolean,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: correspondence_dms_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE correspondence_dms_links (
    correspondence_id integer NOT NULL,
    dms_model_id integer NOT NULL
);


--
-- Name: correspondence_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE correspondence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashlet; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashlet (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


--
-- Name: dashlet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dashlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dashlet_read_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashlet_read_users (
    dashlet_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: dashlet_variables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashlet_variables (
    dashlet_id integer NOT NULL,
    variable_id integer NOT NULL
);


--
-- Name: dashlet_write_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dashlet_write_users (
    dashlet_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: db_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE db_user (
    id integer NOT NULL,
    password_requested_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    salt character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    confirmation_token character varying(255) DEFAULT NULL::character varying
);


--
-- Name: dms_model; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dms_model (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    dms_id character varying(20) NOT NULL,
    reference character varying(20) NOT NULL,
    title character varying(200) NOT NULL,
    version character varying(100) DEFAULT NULL::character varying
);


--
-- Name: dms_model_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dms_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entity (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    caution boolean NOT NULL
);


--
-- Name: entity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_comment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE external_comment (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    comment_id integer NOT NULL,
    variance_id integer,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: external_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE external_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: geometry; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    model_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    sequence integer NOT NULL
);


--
-- Name: geometry_features; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_features (
    geometry_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: geometry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE geometry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: geometry_layers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_layers (
    geometry_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: gis_model; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gis_model (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


--
-- Name: gis_model_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gis_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: glossary; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE glossary (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    glossary_id integer NOT NULL,
    permit_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


--
-- Name: glossary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glossary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: holder; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE holder (
    id integer NOT NULL,
    address_id integer NOT NULL
);


--
-- Name: internal_db_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE internal_db_user (
    id integer NOT NULL,
    agency_id integer NOT NULL,
    job_title_id integer NOT NULL
);


--
-- Name: internal_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE internal_user (
    id integer NOT NULL,
    job_title_id integer NOT NULL,
    agency_id integer NOT NULL
);


--
-- Name: item_of_interest; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE item_of_interest (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    proposal_id integer NOT NULL,
    layer_id integer NOT NULL,
    clearing_principle_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    value character varying(200) NOT NULL,
    within_meters double precision NOT NULL
);


--
-- Name: item_of_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE item_of_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lookup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lookup (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    type_id integer,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    display character varying(200) NOT NULL,
    value character varying(200) NOT NULL,
    actionable boolean NOT NULL,
    description text
);


--
-- Name: lookup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lookup_parent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lookup_parent (
    lookup_id integer NOT NULL,
    parent_id integer NOT NULL
);


--
-- Name: media; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    reference_type_id integer,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    name character varying(50) NOT NULL,
    reference character varying(12) NOT NULL,
    main_file boolean NOT NULL,
    decision boolean NOT NULL
);


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mining_parcel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mining_parcel (
    id integer NOT NULL,
    start_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    end_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    grant_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: objection; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE objection (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    objector_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    response_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    response_comment text,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: objection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE objection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offset_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE offset_details (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    description text
);


--
-- Name: offset_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE offset_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parcel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parcel (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    address_id integer NOT NULL,
    status_id integer,
    locality_id integer,
    gis_model_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    valid boolean NOT NULL,
    title character varying(200) DEFAULT NULL::character varying,
    land_description text NOT NULL,
    register_number character varying(100) NOT NULL,
    reserve_number character varying(6) DEFAULT NULL::character varying,
    colloquial_name character varying(2000) DEFAULT NULL::character varying,
    parcel_id character varying(25) DEFAULT NULL::character varying,
    road_reserve boolean,
    class character varying(255) NOT NULL
);


--
-- Name: parcel_entity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE parcel_entity (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    parcel_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    class character varying(255) NOT NULL,
    first_name character varying(256) DEFAULT NULL::character varying
);


--
-- Name: parcel_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parcel_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parcel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE parcel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    status_id integer NOT NULL,
    assessing_officer_id integer NOT NULL,
    approving_officer_id integer NOT NULL,
    fee_type_id integer NOT NULL,
    parent_id integer,
    level_of_assessment_id integer NOT NULL,
    compliance_risk_id integer NOT NULL,
    potential_environmental_impact_id integer NOT NULL,
    admendment_reason_id integer NOT NULL,
    workflow_id integer NOT NULL,
    primary_container_id integer,
    agency_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    number integer NOT NULL,
    version integer NOT NULL,
    approving_officer_job_title character varying(100) DEFAULT NULL::character varying,
    advertisment_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    submission_closing_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    commencement_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    expiry_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    project_name character varying(2000) DEFAULT NULL::character varying,
    undertaking boolean NOT NULL,
    fee double precision NOT NULL,
    fee_comment text,
    status_comment character varying(4000) DEFAULT NULL::character varying,
    advertisment_reason text,
    days_with_department integer NOT NULL,
    days_since_received integer NOT NULL,
    days_with_applicant integer NOT NULL,
    days_until_due_for_qa integer NOT NULL,
    decision_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    accepted_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    on_behalf_of boolean,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    assessment_due_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    validation_due_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    decision_due_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: permit_activity; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_activity (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    activity_id integer NOT NULL,
    permit_id integer NOT NULL,
    gis_model_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    sequence integer NOT NULL
);


--
-- Name: permit_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_activity_variables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_activity_variables (
    permit_activity_id integer NOT NULL,
    variable_id integer NOT NULL
);


--
-- Name: permit_audit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_audit (
    id integer NOT NULL,
    permit_id integer NOT NULL,
    object_type character varying(100) NOT NULL,
    object_id integer NOT NULL,
    description text,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: permit_condition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_condition (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    condition_id integer NOT NULL,
    permit_id integer NOT NULL,
    gis_model_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    sequence integer NOT NULL
);


--
-- Name: permit_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_condition_variables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_condition_variables (
    permit_condition_id integer NOT NULL,
    variable_id integer NOT NULL
);


--
-- Name: permit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_offset; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_offset (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    total_offset_area double precision NOT NULL,
    cover_all_variances boolean NOT NULL,
    offset_attempted boolean NOT NULL,
    demonstrated_mitigation boolean NOT NULL,
    net_environmental_benifit boolean NOT NULL,
    general_objective_provided boolean NOT NULL,
    vegetation_complexes_match boolean NOT NULL
);


--
-- Name: permit_offset_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_offset_details (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    criteria_id integer NOT NULL,
    condition_status_id integer NOT NULL,
    bio_region_id integer NOT NULL,
    agent_id integer NOT NULL,
    advisor_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    gis_model_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    impact text,
    rationale text,
    security text,
    governance text,
    other_advisor text,
    area double precision NOT NULL,
    advice text
);


--
-- Name: permit_offset_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_offset_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_offset_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_offset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_offset_milestone; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_offset_milestone (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_offset_details_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    time_frame timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    time_frame_text text,
    status boolean NOT NULL
);


--
-- Name: permit_offset_milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_offset_milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_offset_uncovered_variances; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_offset_uncovered_variances (
    permit_offset_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: permit_parcels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_parcels (
    permit_id integer NOT NULL,
    parcel_id integer NOT NULL
);


--
-- Name: permit_rating; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_rating (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    size_id integer NOT NULL,
    location_id integer NOT NULL,
    urgency_id integer NOT NULL,
    environment_values_id integer NOT NULL,
    public_interest_id integer NOT NULL,
    public_benifit_id integer NOT NULL,
    mitigation_id integer NOT NULL,
    other_approvals_id integer NOT NULL,
    environment_conditions_id integer NOT NULL,
    purpose_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


--
-- Name: permit_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permit_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permit_regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permit_regions (
    permit_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: person; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    entity_id integer NOT NULL,
    salutation_id integer NOT NULL,
    company_id integer,
    address_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    first_name character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    "position" character varying(50) DEFAULT NULL::character varying,
    email character varying(250) DEFAULT NULL::character varying,
    url character varying(250) DEFAULT NULL::character varying,
    phone character varying(50) DEFAULT NULL::character varying,
    mobile character varying(50) DEFAULT NULL::character varying,
    fax character varying(50) DEFAULT NULL::character varying,
    class character varying(255) NOT NULL
);


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: petroleum_parcel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE petroleum_parcel (
    id integer NOT NULL,
    type_id integer NOT NULL,
    coverage character varying(20) DEFAULT NULL::character varying,
    program character varying(100) DEFAULT NULL::character varying
);


--
-- Name: proponent; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proponent (
    id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    verified boolean NOT NULL,
    ar_debtor_number character varying(10) DEFAULT NULL::character varying
);


--
-- Name: proposal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proposal (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    clearing_purpose_id integer,
    clearing_method_id integer NOT NULL,
    decision_id integer,
    bio_region_id integer NOT NULL,
    permit_id integer NOT NULL,
    gis_model_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    applied_area double precision,
    applied_trees integer,
    confirmed_area double precision,
    confirmed_trees integer,
    decision_area double precision,
    decision_trees integer NOT NULL,
    from_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    to_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    description text,
    sequence integer NOT NULL
);


--
-- Name: proposal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proposal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proprietor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proprietor (
    id integer NOT NULL
);


--
-- Name: receipt; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE receipt (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    number character varying(100) NOT NULL,
    date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- Name: receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE receipt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reference; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reference (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    reference_id integer,
    permit_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    description text
);


--
-- Name: reference_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE referrals (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    agency_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    date_referred timestamp(0) without time zone NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    received boolean NOT NULL
);


--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: search_filter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE search_filter (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    user_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    name text NOT NULL,
    filter text NOT NULL
);


--
-- Name: search_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE search_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variable; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE variable (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    type_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    value character varying(500) NOT NULL,
    sequence integer NOT NULL
);


--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vegetation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vegetation (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    permit_id integer NOT NULL,
    type_id integer NOT NULL,
    gis_model_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL,
    vegetation_description text,
    to_be_cleared_description text,
    description text
);


--
-- Name: vegetation_conditions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vegetation_conditions (
    vegetation_id integer NOT NULL,
    lookup_id integer NOT NULL
);


--
-- Name: vegetation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vegetation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflow; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE workflow (
    id integer NOT NULL,
    last_user_id integer NOT NULL,
    create_user_id integer NOT NULL,
    active boolean NOT NULL,
    delete boolean NOT NULL,
    last_update timestamp(0) without time zone NOT NULL,
    create_date timestamp(0) without time zone NOT NULL
);


--
-- Name: workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Data for Name: actions_required; Type: TABLE DATA; Schema: public; Owner: -
--

COPY actions_required (id, last_user_id, create_user_id, action_id, officer_id, permit_id, active, delete, last_update, create_date, action_date, audit_date, review_date, description) FROM stdin;
\.


--
-- Name: actions_required_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actions_required_id_seq', 1, false);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY address (id, last_user_id, create_user_id, street_type_id, state_id, country_id, type_id, active, delete, last_update, create_date, verified, building_name, sub_unit, floor, mail_box, po_box, lot_number, street_number, street_name, post_code, suburb) FROM stdin;
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('address_id_seq', 1, false);


--
-- Data for Name: advice; Type: TABLE DATA; Schema: public; Owner: -
--

COPY advice (id, last_user_id, create_user_id, permit_id, type_id, active, delete, last_update, create_date, required, due_date, requested_date, received_date, description) FROM stdin;
\.


--
-- Name: advice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('advice_id_seq', 1, false);


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY app_user (id, last_user_id, create_user_id, username, username_canonical, email, email_canonical, enabled, last_login, locked, expired, expires_at, roles, credentials_expired, credentials_expire_at, failed_login_count, active, delete, last_update, create_date, class, first_name, last_name) FROM stdin;
1	1	1	admin	admin	admin@localhost.domain	admin@localhost.domain	t	\N	f	f	\N	a:0:{}	f	\N	0	t	f	2013-10-16 21:20:13	2013-10-16 21:20:13	User	admin	admin
59	1	1	anon.	anon.	anonymous@localhost.domain	anonymous@localhost.domain	t	\N	f	f	\N	a:0:{}	f	\N	0	t	f	2013-10-22 13:47:11	2013-10-22 13:47:11	User	anonymous	anonymous
\.


--
-- Name: app_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('app_user_id_seq', 62, true);


--
-- Data for Name: appeal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY appeal (id, last_user_id, create_user_id, appellant_id, decision_id, action_required_id, permit_id, active, delete, last_update, create_date, mine_number, decision_date, decision_description, date, description) FROM stdin;
\.


--
-- Data for Name: appeal_dms_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY appeal_dms_links (appeal_id, dms_model_id) FROM stdin;
\.


--
-- Name: appeal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('appeal_id_seq', 1, false);


--
-- Data for Name: assessment_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY assessment_activity (id, last_user_id, create_user_id, accessor_id, permit_id, type_id, active, delete, last_update, create_date, reference_code, description, date) FROM stdin;
\.


--
-- Name: assessment_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('assessment_activity_id_seq', 1, false);


--
-- Data for Name: audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY audit (id, user_id, type_id, object_type, object_id, description, date) FROM stdin;
\.


--
-- Name: audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('audit_id_seq', 1, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comment (id, last_user_id, create_user_id, variance_id, commenter_id, permit_id, type_id, active, delete, last_update, create_date, methodology, offset_variance, offset_area, public_comment, decision, description, date) FROM stdin;
\.


--
-- Data for Name: comment_clearing_principles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comment_clearing_principles (comment_id, lookup_id) FROM stdin;
\.


--
-- Data for Name: comment_criterion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comment_criterion (comment_id, lookup_id) FROM stdin;
\.


--
-- Data for Name: comment_dms_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comment_dms_links (comment_id, dms_model_id) FROM stdin;
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 1, false);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: -
--

COPY company (id, last_user_id, create_user_id, entity_id, active, delete, last_update, create_date, company_name, company_abbrev) FROM stdin;
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('company_id_seq', 1, false);


--
-- Data for Name: compliance_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY compliance_activity (id, last_user_id, create_user_id, outcome_id, action_id, officer_id, level_of_compliance_id, permit_id, type_id, active, delete, last_update, create_date, action_date, compliant, icms_number, description, date) FROM stdin;
\.


--
-- Data for Name: compliance_activity_dms_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY compliance_activity_dms_links (compliance_activity_id, dms_model_id) FROM stdin;
\.


--
-- Name: compliance_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('compliance_activity_id_seq', 1, false);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contact (id, proponent_id, type_id) FROM stdin;
\.


--
-- Data for Name: correspondence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY correspondence (id, last_user_id, create_user_id, workflow_id, to_user_id, from_user_id, permit_id, type_id, active, delete, last_update, create_date, bring_up_date, completed, description, date) FROM stdin;
\.


--
-- Data for Name: correspondence_dms_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY correspondence_dms_links (correspondence_id, dms_model_id) FROM stdin;
\.


--
-- Name: correspondence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('correspondence_id_seq', 1, false);


--
-- Data for Name: dashlet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashlet (id, last_user_id, create_user_id, active, delete, last_update, create_date) FROM stdin;
\.


--
-- Name: dashlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dashlet_id_seq', 1, false);


--
-- Data for Name: dashlet_read_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashlet_read_users (dashlet_id, user_id) FROM stdin;
\.


--
-- Data for Name: dashlet_variables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashlet_variables (dashlet_id, variable_id) FROM stdin;
\.


--
-- Data for Name: dashlet_write_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dashlet_write_users (dashlet_id, user_id) FROM stdin;
\.


--
-- Data for Name: db_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY db_user (id, password_requested_at, salt, password, confirmation_token) FROM stdin;
\.


--
-- Data for Name: dms_model; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dms_model (id, last_user_id, create_user_id, permit_id, type_id, active, delete, last_update, create_date, dms_id, reference, title, version) FROM stdin;
\.


--
-- Name: dms_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('dms_model_id_seq', 1, false);


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY entity (id, last_user_id, create_user_id, active, delete, last_update, create_date, caution) FROM stdin;
\.


--
-- Name: entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('entity_id_seq', 1, false);


--
-- Data for Name: external_comment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY external_comment (id, last_user_id, create_user_id, comment_id, variance_id, active, delete, last_update, create_date, description, date) FROM stdin;
\.


--
-- Name: external_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('external_comment_id_seq', 1, false);


--
-- Data for Name: geometry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY geometry (id, last_user_id, create_user_id, model_id, active, delete, last_update, create_date, sequence) FROM stdin;
\.


--
-- Data for Name: geometry_features; Type: TABLE DATA; Schema: public; Owner: -
--

COPY geometry_features (geometry_id, lookup_id) FROM stdin;
\.


--
-- Name: geometry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('geometry_id_seq', 1, false);


--
-- Data for Name: geometry_layers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY geometry_layers (geometry_id, lookup_id) FROM stdin;
\.


--
-- Data for Name: gis_model; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gis_model (id, last_user_id, create_user_id, active, delete, last_update, create_date) FROM stdin;
\.


--
-- Name: gis_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('gis_model_id_seq', 1, false);


--
-- Data for Name: glossary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY glossary (id, last_user_id, create_user_id, glossary_id, permit_id, active, delete, last_update, create_date) FROM stdin;
\.


--
-- Name: glossary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glossary_id_seq', 1, false);


--
-- Data for Name: holder; Type: TABLE DATA; Schema: public; Owner: -
--

COPY holder (id, address_id) FROM stdin;
\.


--
-- Data for Name: internal_db_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY internal_db_user (id, agency_id, job_title_id) FROM stdin;
\.


--
-- Data for Name: internal_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY internal_user (id, job_title_id, agency_id) FROM stdin;
\.


--
-- Data for Name: item_of_interest; Type: TABLE DATA; Schema: public; Owner: -
--

COPY item_of_interest (id, last_user_id, create_user_id, proposal_id, layer_id, clearing_principle_id, type_id, active, delete, last_update, create_date, value, within_meters) FROM stdin;
\.


--
-- Name: item_of_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('item_of_interest_id_seq', 1, false);


--
-- Data for Name: lookup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lookup (id, last_user_id, create_user_id, type_id, active, delete, last_update, create_date, display, value, actionable, description) FROM stdin;
1	1	1	\N	t	f	2013-10-18 15:11:00	2013-10-18 15:11:00			t	
\.


--
-- Name: lookup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lookup_id_seq', 1, false);


--
-- Data for Name: lookup_parent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lookup_parent (lookup_id, parent_id) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY media (id, last_user_id, create_user_id, reference_type_id, permit_id, type_id, active, delete, last_update, create_date, name, reference, main_file, decision) FROM stdin;
\.


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('media_id_seq', 1, false);


--
-- Data for Name: mining_parcel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mining_parcel (id, start_date, end_date, grant_date) FROM stdin;
\.


--
-- Data for Name: objection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objection (id, last_user_id, create_user_id, objector_id, permit_id, type_id, active, delete, last_update, create_date, response_date, response_comment, description, date) FROM stdin;
\.


--
-- Name: objection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('objection_id_seq', 1, false);


--
-- Data for Name: offset_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY offset_details (id, last_user_id, create_user_id, permit_id, type_id, active, delete, last_update, create_date, description) FROM stdin;
\.


--
-- Name: offset_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('offset_details_id_seq', 1, false);


--
-- Data for Name: parcel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parcel (id, last_user_id, create_user_id, address_id, status_id, locality_id, gis_model_id, active, delete, last_update, create_date, valid, title, land_description, register_number, reserve_number, colloquial_name, parcel_id, road_reserve, class) FROM stdin;
\.


--
-- Data for Name: parcel_entity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parcel_entity (id, last_user_id, create_user_id, parcel_id, type_id, active, delete, last_update, create_date, class, first_name) FROM stdin;
\.


--
-- Name: parcel_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parcel_entity_id_seq', 1, false);


--
-- Name: parcel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('parcel_id_seq', 1, false);


--
-- Data for Name: permit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit (id, last_user_id, create_user_id, status_id, assessing_officer_id, approving_officer_id, fee_type_id, parent_id, level_of_assessment_id, compliance_risk_id, potential_environmental_impact_id, admendment_reason_id, workflow_id, primary_container_id, agency_id, type_id, active, delete, last_update, create_date, number, version, approving_officer_job_title, advertisment_date, submission_closing_date, commencement_date, expiry_date, project_name, undertaking, fee, fee_comment, status_comment, advertisment_reason, days_with_department, days_since_received, days_with_applicant, days_until_due_for_qa, decision_date, accepted_date, on_behalf_of, date, assessment_due_date, validation_due_date, decision_due_date) FROM stdin;
\.


--
-- Data for Name: permit_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_activity (id, last_user_id, create_user_id, activity_id, permit_id, gis_model_id, type_id, active, delete, last_update, create_date, sequence) FROM stdin;
\.


--
-- Name: permit_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_activity_id_seq', 1, false);


--
-- Data for Name: permit_activity_variables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_activity_variables (permit_activity_id, variable_id) FROM stdin;
\.


--
-- Data for Name: permit_audit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_audit (id, permit_id, object_type, object_id, description, date) FROM stdin;
\.


--
-- Data for Name: permit_condition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_condition (id, last_user_id, create_user_id, condition_id, permit_id, gis_model_id, type_id, active, delete, last_update, create_date, sequence) FROM stdin;
\.


--
-- Name: permit_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_condition_id_seq', 1, false);


--
-- Data for Name: permit_condition_variables; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_condition_variables (permit_condition_id, variable_id) FROM stdin;
\.


--
-- Name: permit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_id_seq', 1, false);


--
-- Data for Name: permit_offset; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_offset (id, last_user_id, create_user_id, permit_id, status_id, type_id, active, delete, last_update, create_date, total_offset_area, cover_all_variances, offset_attempted, demonstrated_mitigation, net_environmental_benifit, general_objective_provided, vegetation_complexes_match) FROM stdin;
\.


--
-- Data for Name: permit_offset_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_offset_details (id, last_user_id, create_user_id, criteria_id, condition_status_id, bio_region_id, agent_id, advisor_id, permit_id, type_id, gis_model_id, active, delete, last_update, create_date, impact, rationale, security, governance, other_advisor, area, advice) FROM stdin;
\.


--
-- Name: permit_offset_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_offset_details_id_seq', 1, false);


--
-- Name: permit_offset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_offset_id_seq', 1, false);


--
-- Data for Name: permit_offset_milestone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_offset_milestone (id, last_user_id, create_user_id, permit_offset_details_id, type_id, active, delete, last_update, create_date, time_frame, time_frame_text, status) FROM stdin;
\.


--
-- Name: permit_offset_milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_offset_milestone_id_seq', 1, false);


--
-- Data for Name: permit_offset_uncovered_variances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_offset_uncovered_variances (permit_offset_id, lookup_id) FROM stdin;
\.


--
-- Data for Name: permit_parcels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_parcels (permit_id, parcel_id) FROM stdin;
\.


--
-- Data for Name: permit_rating; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_rating (id, last_user_id, create_user_id, permit_id, size_id, location_id, urgency_id, environment_values_id, public_interest_id, public_benifit_id, mitigation_id, other_approvals_id, environment_conditions_id, purpose_id, active, delete, last_update, create_date) FROM stdin;
\.


--
-- Name: permit_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permit_rating_id_seq', 1, false);


--
-- Data for Name: permit_regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permit_regions (permit_id, lookup_id) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY person (id, last_user_id, create_user_id, entity_id, salutation_id, company_id, address_id, active, delete, last_update, create_date, first_name, last_name, "position", email, url, phone, mobile, fax, class) FROM stdin;
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('person_id_seq', 1, false);


--
-- Data for Name: petroleum_parcel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY petroleum_parcel (id, type_id, coverage, program) FROM stdin;
\.


--
-- Data for Name: proponent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY proponent (id, permit_id, type_id, verified, ar_debtor_number) FROM stdin;
\.


--
-- Data for Name: proposal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY proposal (id, last_user_id, create_user_id, clearing_purpose_id, clearing_method_id, decision_id, bio_region_id, permit_id, gis_model_id, active, delete, last_update, create_date, applied_area, applied_trees, confirmed_area, confirmed_trees, decision_area, decision_trees, from_date, to_date, description, sequence) FROM stdin;
\.


--
-- Name: proposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('proposal_id_seq', 1, false);


--
-- Data for Name: proprietor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY proprietor (id) FROM stdin;
\.


--
-- Data for Name: receipt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY receipt (id, last_user_id, create_user_id, permit_id, active, delete, last_update, create_date, number, date) FROM stdin;
\.


--
-- Name: receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('receipt_id_seq', 1, false);


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reference (id, last_user_id, create_user_id, reference_id, permit_id, active, delete, last_update, create_date, description) FROM stdin;
\.


--
-- Name: reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reference_id_seq', 1, false);


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY referrals (id, last_user_id, create_user_id, permit_id, type_id, agency_id, active, delete, last_update, create_date, date_referred, due_date, received) FROM stdin;
\.


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('referrals_id_seq', 1, false);


--
-- Data for Name: search_filter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY search_filter (id, last_user_id, create_user_id, user_id, active, delete, last_update, create_date, name, filter) FROM stdin;
\.


--
-- Name: search_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('search_filter_id_seq', 1, false);


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: -
--

COPY variable (id, last_user_id, create_user_id, type_id, active, delete, last_update, create_date, value, sequence) FROM stdin;
\.


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('variable_id_seq', 1, false);


--
-- Data for Name: vegetation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vegetation (id, last_user_id, create_user_id, permit_id, type_id, gis_model_id, active, delete, last_update, create_date, vegetation_description, to_be_cleared_description, description) FROM stdin;
\.


--
-- Data for Name: vegetation_conditions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vegetation_conditions (vegetation_id, lookup_id) FROM stdin;
\.


--
-- Name: vegetation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vegetation_id_seq', 1, false);


--
-- Data for Name: workflow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY workflow (id, last_user_id, create_user_id, active, delete, last_update, create_date) FROM stdin;
\.


--
-- Name: workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('workflow_id_seq', 1, false);


--
-- Name: actions_required_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT actions_required_pkey PRIMARY KEY (id);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: advice_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY advice
    ADD CONSTRAINT advice_pkey PRIMARY KEY (id);


--
-- Name: app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (id);


--
-- Name: appeal_dms_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appeal_dms_links
    ADD CONSTRAINT appeal_dms_links_pkey PRIMARY KEY (appeal_id, dms_model_id);


--
-- Name: appeal_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT appeal_pkey PRIMARY KEY (id);


--
-- Name: assessment_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT assessment_activity_pkey PRIMARY KEY (id);


--
-- Name: audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY audit
    ADD CONSTRAINT audit_pkey PRIMARY KEY (id);


--
-- Name: comment_clearing_principles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comment_clearing_principles
    ADD CONSTRAINT comment_clearing_principles_pkey PRIMARY KEY (comment_id, lookup_id);


--
-- Name: comment_criterion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comment_criterion
    ADD CONSTRAINT comment_criterion_pkey PRIMARY KEY (comment_id, lookup_id);


--
-- Name: comment_dms_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comment_dms_links
    ADD CONSTRAINT comment_dms_links_pkey PRIMARY KEY (comment_id, dms_model_id);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: compliance_activity_dms_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY compliance_activity_dms_links
    ADD CONSTRAINT compliance_activity_dms_links_pkey PRIMARY KEY (compliance_activity_id, dms_model_id);


--
-- Name: compliance_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT compliance_activity_pkey PRIMARY KEY (id);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: correspondence_dms_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY correspondence_dms_links
    ADD CONSTRAINT correspondence_dms_links_pkey PRIMARY KEY (correspondence_id, dms_model_id);


--
-- Name: correspondence_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT correspondence_pkey PRIMARY KEY (id);


--
-- Name: dashlet_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashlet
    ADD CONSTRAINT dashlet_pkey PRIMARY KEY (id);


--
-- Name: dashlet_read_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashlet_read_users
    ADD CONSTRAINT dashlet_read_users_pkey PRIMARY KEY (dashlet_id, user_id);


--
-- Name: dashlet_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashlet_variables
    ADD CONSTRAINT dashlet_variables_pkey PRIMARY KEY (dashlet_id, variable_id);


--
-- Name: dashlet_write_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dashlet_write_users
    ADD CONSTRAINT dashlet_write_users_pkey PRIMARY KEY (dashlet_id, user_id);


--
-- Name: db_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY db_user
    ADD CONSTRAINT db_user_pkey PRIMARY KEY (id);


--
-- Name: dms_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dms_model
    ADD CONSTRAINT dms_model_pkey PRIMARY KEY (id);


--
-- Name: entity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (id);


--
-- Name: external_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY external_comment
    ADD CONSTRAINT external_comment_pkey PRIMARY KEY (id);


--
-- Name: geometry_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_features
    ADD CONSTRAINT geometry_features_pkey PRIMARY KEY (geometry_id, lookup_id);


--
-- Name: geometry_layers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_layers
    ADD CONSTRAINT geometry_layers_pkey PRIMARY KEY (geometry_id, lookup_id);


--
-- Name: geometry_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry
    ADD CONSTRAINT geometry_pkey PRIMARY KEY (id);


--
-- Name: gis_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gis_model
    ADD CONSTRAINT gis_model_pkey PRIMARY KEY (id);


--
-- Name: glossary_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY glossary
    ADD CONSTRAINT glossary_pkey PRIMARY KEY (id);


--
-- Name: holder_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY holder
    ADD CONSTRAINT holder_pkey PRIMARY KEY (id);


--
-- Name: internal_db_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY internal_db_user
    ADD CONSTRAINT internal_db_user_pkey PRIMARY KEY (id);


--
-- Name: internal_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY internal_user
    ADD CONSTRAINT internal_user_pkey PRIMARY KEY (id);


--
-- Name: item_of_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT item_of_interest_pkey PRIMARY KEY (id);


--
-- Name: lookup_parent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lookup_parent
    ADD CONSTRAINT lookup_parent_pkey PRIMARY KEY (lookup_id, parent_id);


--
-- Name: lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lookup
    ADD CONSTRAINT lookup_pkey PRIMARY KEY (id);


--
-- Name: media_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: mining_parcel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mining_parcel
    ADD CONSTRAINT mining_parcel_pkey PRIMARY KEY (id);


--
-- Name: objection_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT objection_pkey PRIMARY KEY (id);


--
-- Name: offset_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY offset_details
    ADD CONSTRAINT offset_details_pkey PRIMARY KEY (id);


--
-- Name: parcel_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parcel_entity
    ADD CONSTRAINT parcel_entity_pkey PRIMARY KEY (id);


--
-- Name: parcel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT parcel_pkey PRIMARY KEY (id);


--
-- Name: permit_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT permit_activity_pkey PRIMARY KEY (id);


--
-- Name: permit_activity_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_activity_variables
    ADD CONSTRAINT permit_activity_variables_pkey PRIMARY KEY (permit_activity_id, variable_id);


--
-- Name: permit_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_audit
    ADD CONSTRAINT permit_audit_pkey PRIMARY KEY (id);


--
-- Name: permit_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT permit_condition_pkey PRIMARY KEY (id);


--
-- Name: permit_condition_variables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_condition_variables
    ADD CONSTRAINT permit_condition_variables_pkey PRIMARY KEY (permit_condition_id, variable_id);


--
-- Name: permit_offset_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT permit_offset_details_pkey PRIMARY KEY (id);


--
-- Name: permit_offset_milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_offset_milestone
    ADD CONSTRAINT permit_offset_milestone_pkey PRIMARY KEY (id);


--
-- Name: permit_offset_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT permit_offset_pkey PRIMARY KEY (id);


--
-- Name: permit_offset_uncovered_variances_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_offset_uncovered_variances
    ADD CONSTRAINT permit_offset_uncovered_variances_pkey PRIMARY KEY (permit_offset_id, lookup_id);


--
-- Name: permit_parcels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_parcels
    ADD CONSTRAINT permit_parcels_pkey PRIMARY KEY (permit_id, parcel_id);


--
-- Name: permit_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT permit_pkey PRIMARY KEY (id);


--
-- Name: permit_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT permit_rating_pkey PRIMARY KEY (id);


--
-- Name: permit_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permit_regions
    ADD CONSTRAINT permit_regions_pkey PRIMARY KEY (permit_id, lookup_id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: petroleum_parcel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY petroleum_parcel
    ADD CONSTRAINT petroleum_parcel_pkey PRIMARY KEY (id);


--
-- Name: proponent_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proponent
    ADD CONSTRAINT proponent_pkey PRIMARY KEY (id);


--
-- Name: proposal_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT proposal_pkey PRIMARY KEY (id);


--
-- Name: proprietor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proprietor
    ADD CONSTRAINT proprietor_pkey PRIMARY KEY (id);


--
-- Name: receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY receipt
    ADD CONSTRAINT receipt_pkey PRIMARY KEY (id);


--
-- Name: reference_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id);


--
-- Name: referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: search_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY search_filter
    ADD CONSTRAINT search_filter_pkey PRIMARY KEY (id);


--
-- Name: variable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- Name: vegetation_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vegetation_conditions
    ADD CONSTRAINT vegetation_conditions_pkey PRIMARY KEY (vegetation_id, lookup_id);


--
-- Name: vegetation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT vegetation_pkey PRIMARY KEY (id);


--
-- Name: workflow_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT workflow_pkey PRIMARY KEY (id);


--
-- Name: idx_1058b9fd63319e53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fd63319e53 ON compliance_activity USING btree (officer_id);


--
-- Name: idx_1058b9fd85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fd85564492 ON compliance_activity USING btree (create_user_id);


--
-- Name: idx_1058b9fd8bf01cd9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fd8bf01cd9 ON compliance_activity USING btree (level_of_compliance_id);


--
-- Name: idx_1058b9fd9d32f035; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fd9d32f035 ON compliance_activity USING btree (action_id);


--
-- Name: idx_1058b9fda8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fda8439af7 ON compliance_activity USING btree (permit_id);


--
-- Name: idx_1058b9fdc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fdc1e2efdd ON compliance_activity USING btree (last_user_id);


--
-- Name: idx_1058b9fdc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fdc54c8c93 ON compliance_activity USING btree (type_id);


--
-- Name: idx_1058b9fde6ee6d63; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1058b9fde6ee6d63 ON compliance_activity USING btree (outcome_id);


--
-- Name: idx_1b7dc89685564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b7dc89685564492 ON referrals USING btree (create_user_id);


--
-- Name: idx_1b7dc896a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b7dc896a8439af7 ON referrals USING btree (permit_id);


--
-- Name: idx_1b7dc896c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b7dc896c1e2efdd ON referrals USING btree (last_user_id);


--
-- Name: idx_1b7dc896c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b7dc896c54c8c93 ON referrals USING btree (type_id);


--
-- Name: idx_1b7dc896cdeadb2a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b7dc896cdeadb2a ON referrals USING btree (agency_id);


--
-- Name: idx_1b9ae81e8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b9ae81e8955c49d ON geometry_features USING btree (lookup_id);


--
-- Name: idx_1b9ae81ea88a6a72; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1b9ae81ea88a6a72 ON geometry_features USING btree (geometry_id);


--
-- Name: idx_1d9648c7a76ed395; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1d9648c7a76ed395 ON dashlet_write_users USING btree (user_id);


--
-- Name: idx_1d9648c7b9a1d19f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_1d9648c7b9a1d19f ON dashlet_write_users USING btree (dashlet_id);


--
-- Name: idx_2040b60385564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2040b60385564492 ON gis_model USING btree (create_user_id);


--
-- Name: idx_2040b603c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2040b603c1e2efdd ON gis_model USING btree (last_user_id);


--
-- Name: idx_2a0046b02130303a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b02130303a ON correspondence USING btree (from_user_id);


--
-- Name: idx_2a0046b029f6ee60; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b029f6ee60 ON correspondence USING btree (to_user_id);


--
-- Name: idx_2a0046b085564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b085564492 ON correspondence USING btree (create_user_id);


--
-- Name: idx_2a0046b0a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b0a8439af7 ON correspondence USING btree (permit_id);


--
-- Name: idx_2a0046b0c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b0c1e2efdd ON correspondence USING btree (last_user_id);


--
-- Name: idx_2a0046b0c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2a0046b0c54c8c93 ON correspondence USING btree (type_id);


--
-- Name: idx_2f20a84e6fa456ec; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2f20a84e6fa456ec ON permit_offset_uncovered_variances USING btree (permit_offset_id);


--
-- Name: idx_2f20a84e8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_2f20a84e8955c49d ON permit_offset_uncovered_variances USING btree (lookup_id);


--
-- Name: idx_30cdb4ba7d8ef1ec; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4ba7d8ef1ec ON item_of_interest USING btree (clearing_principle_id);


--
-- Name: idx_30cdb4ba85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4ba85564492 ON item_of_interest USING btree (create_user_id);


--
-- Name: idx_30cdb4bac1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4bac1e2efdd ON item_of_interest USING btree (last_user_id);


--
-- Name: idx_30cdb4bac54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4bac54c8c93 ON item_of_interest USING btree (type_id);


--
-- Name: idx_30cdb4baea6efdcd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4baea6efdcd ON item_of_interest USING btree (layer_id);


--
-- Name: idx_30cdb4baf4792058; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_30cdb4baf4792058 ON item_of_interest USING btree (proposal_id);


--
-- Name: idx_34dcd1762e5ad854; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd1762e5ad854 ON person USING btree (salutation_id);


--
-- Name: idx_34dcd17681257d5d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd17681257d5d ON person USING btree (entity_id);


--
-- Name: idx_34dcd17685564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd17685564492 ON person USING btree (create_user_id);


--
-- Name: idx_34dcd176979b1ad6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd176979b1ad6 ON person USING btree (company_id);


--
-- Name: idx_34dcd176c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd176c1e2efdd ON person USING btree (last_user_id);


--
-- Name: idx_34dcd176f5b7af75; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_34dcd176f5b7af75 ON person USING btree (address_id);


--
-- Name: idx_3664f3b267039295; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3664f3b267039295 ON compliance_activity_dms_links USING btree (dms_model_id);


--
-- Name: idx_3664f3b28beae994; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3664f3b28beae994 ON compliance_activity_dms_links USING btree (compliance_activity_id);


--
-- Name: idx_3f3c102a63319e53; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3f3c102a63319e53 ON actions_required USING btree (officer_id);


--
-- Name: idx_3f3c102a85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3f3c102a85564492 ON actions_required USING btree (create_user_id);


--
-- Name: idx_3f3c102a9d32f035; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3f3c102a9d32f035 ON actions_required USING btree (action_id);


--
-- Name: idx_3f3c102aa8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3f3c102aa8439af7 ON actions_required USING btree (permit_id);


--
-- Name: idx_3f3c102ac1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_3f3c102ac1e2efdd ON actions_required USING btree (last_user_id);


--
-- Name: idx_48899d1f8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_48899d1f8955c49d ON permit_regions USING btree (lookup_id);


--
-- Name: idx_48899d1fa8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_48899d1fa8439af7 ON permit_regions USING btree (permit_id);


--
-- Name: idx_4c62e638c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4c62e638c54c8c93 ON contact USING btree (type_id);


--
-- Name: idx_4c62e638f8bac902; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4c62e638f8bac902 ON contact USING btree (proponent_id);


--
-- Name: idx_4dd68b2f6912924; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4dd68b2f6912924 ON external_comment USING btree (variance_id);


--
-- Name: idx_4dd68b2f85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4dd68b2f85564492 ON external_comment USING btree (create_user_id);


--
-- Name: idx_4dd68b2fc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4dd68b2fc1e2efdd ON external_comment USING btree (last_user_id);


--
-- Name: idx_4fbf094f81257d5d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4fbf094f81257d5d ON company USING btree (entity_id);


--
-- Name: idx_4fbf094f85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4fbf094f85564492 ON company USING btree (create_user_id);


--
-- Name: idx_4fbf094fc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_4fbf094fc1e2efdd ON company USING btree (last_user_id);


--
-- Name: idx_52249ed81c06096; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_52249ed81c06096 ON permit_activity USING btree (activity_id);


--
-- Name: idx_52249ed85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_52249ed85564492 ON permit_activity USING btree (create_user_id);


--
-- Name: idx_52249eda8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_52249eda8439af7 ON permit_activity USING btree (permit_id);


--
-- Name: idx_52249edc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_52249edc1e2efdd ON permit_activity USING btree (last_user_id);


--
-- Name: idx_52249edc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_52249edc54c8c93 ON permit_activity USING btree (type_id);


--
-- Name: idx_5399b64585564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5399b64585564492 ON receipt USING btree (create_user_id);


--
-- Name: idx_5399b645a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5399b645a8439af7 ON receipt USING btree (permit_id);


--
-- Name: idx_5399b645c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5399b645c1e2efdd ON receipt USING btree (last_user_id);


--
-- Name: idx_58c2ede967039295; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_58c2ede967039295 ON appeal_dms_links USING btree (dms_model_id);


--
-- Name: idx_58c2ede9f9b2547f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_58c2ede9f9b2547f ON appeal_dms_links USING btree (appeal_id);


--
-- Name: idx_5de806bd8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5de806bd8955c49d ON comment_clearing_principles USING btree (lookup_id);


--
-- Name: idx_5de806bdf8697d13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5de806bdf8697d13 ON comment_clearing_principles USING btree (comment_id);


--
-- Name: idx_5fedb359a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_5fedb359a8439af7 ON permit_audit USING btree (permit_id);


--
-- Name: idx_611347826dd822c6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_611347826dd822c6 ON internal_user USING btree (job_title_id);


--
-- Name: idx_61134782cdeadb2a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_61134782cdeadb2a ON internal_user USING btree (agency_id);


--
-- Name: idx_612e43aa465e670c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_612e43aa465e670c ON parcel_entity USING btree (parcel_id);


--
-- Name: idx_612e43aa85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_612e43aa85564492 ON parcel_entity USING btree (create_user_id);


--
-- Name: idx_612e43aac1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_612e43aac1e2efdd ON parcel_entity USING btree (last_user_id);


--
-- Name: idx_612e43aac54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_612e43aac54c8c93 ON parcel_entity USING btree (type_id);


--
-- Name: idx_62a91f546bf700bd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_62a91f546bf700bd ON permit_offset USING btree (status_id);


--
-- Name: idx_62a91f5485564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_62a91f5485564492 ON permit_offset USING btree (create_user_id);


--
-- Name: idx_62a91f54c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_62a91f54c1e2efdd ON permit_offset USING btree (last_user_id);


--
-- Name: idx_62a91f54c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_62a91f54c54c8c93 ON permit_offset USING btree (type_id);


--
-- Name: idx_6465049f727aca70; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6465049f727aca70 ON lookup_parent USING btree (parent_id);


--
-- Name: idx_6465049f8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6465049f8955c49d ON lookup_parent USING btree (lookup_id);


--
-- Name: idx_64820e8d85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_64820e8d85564492 ON advice USING btree (create_user_id);


--
-- Name: idx_64820e8da8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_64820e8da8439af7 ON advice USING btree (permit_id);


--
-- Name: idx_64820e8dc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_64820e8dc1e2efdd ON advice USING btree (last_user_id);


--
-- Name: idx_64820e8dc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_64820e8dc54c8c93 ON advice USING btree (type_id);


--
-- Name: idx_65c5981685564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_65c5981685564492 ON workflow USING btree (create_user_id);


--
-- Name: idx_65c59816c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_65c59816c1e2efdd ON workflow USING btree (last_user_id);


--
-- Name: idx_689d28661c5a10e8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_689d28661c5a10e8 ON permit_offset_milestone USING btree (permit_offset_details_id);


--
-- Name: idx_689d286685564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_689d286685564492 ON permit_offset_milestone USING btree (create_user_id);


--
-- Name: idx_689d2866c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_689d2866c1e2efdd ON permit_offset_milestone USING btree (last_user_id);


--
-- Name: idx_689d2866c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_689d2866c54c8c93 ON permit_offset_milestone USING btree (type_id);


--
-- Name: idx_6a2ca10c85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6a2ca10c85564492 ON media USING btree (create_user_id);


--
-- Name: idx_6a2ca10ca8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6a2ca10ca8439af7 ON media USING btree (permit_id);


--
-- Name: idx_6a2ca10cc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6a2ca10cc1e2efdd ON media USING btree (last_user_id);


--
-- Name: idx_6a2ca10cc23c293b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6a2ca10cc23c293b ON media USING btree (reference_type_id);


--
-- Name: idx_6a2ca10cc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6a2ca10cc54c8c93 ON media USING btree (type_id);


--
-- Name: idx_6ff2360785564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6ff2360785564492 ON dashlet USING btree (create_user_id);


--
-- Name: idx_6ff23607c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_6ff23607c1e2efdd ON dashlet USING btree (last_user_id);


--
-- Name: idx_72eeb6ab67039295; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_72eeb6ab67039295 ON comment_dms_links USING btree (dms_model_id);


--
-- Name: idx_72eeb6abf8697d13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_72eeb6abf8697d13 ON comment_dms_links USING btree (comment_id);


--
-- Name: idx_838de00634fc5694; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_838de00634fc5694 ON vegetation_conditions USING btree (vegetation_id);


--
-- Name: idx_838de0068955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_838de0068955c49d ON vegetation_conditions USING btree (lookup_id);


--
-- Name: idx_88bdf3e985564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_88bdf3e985564492 ON app_user USING btree (create_user_id);


--
-- Name: idx_88bdf3e9c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_88bdf3e9c1e2efdd ON app_user USING btree (last_user_id);


--
-- Name: idx_895c01f0263aab94; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0263aab94 ON permit USING btree (primary_container_id);


--
-- Name: idx_895c01f026fa54cf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f026fa54cf ON permit USING btree (fee_type_id);


--
-- Name: idx_895c01f0363c2338; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0363c2338 ON permit USING btree (approving_officer_id);


--
-- Name: idx_895c01f03aadce18; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f03aadce18 ON permit USING btree (assessing_officer_id);


--
-- Name: idx_895c01f048060b60; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f048060b60 ON permit USING btree (compliance_risk_id);


--
-- Name: idx_895c01f06bf700bd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f06bf700bd ON permit USING btree (status_id);


--
-- Name: idx_895c01f0727aca70; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0727aca70 ON permit USING btree (parent_id);


--
-- Name: idx_895c01f085564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f085564492 ON permit USING btree (create_user_id);


--
-- Name: idx_895c01f09f38984c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f09f38984c ON permit USING btree (potential_environmental_impact_id);


--
-- Name: idx_895c01f0c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0c1e2efdd ON permit USING btree (last_user_id);


--
-- Name: idx_895c01f0c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0c54c8c93 ON permit USING btree (type_id);


--
-- Name: idx_895c01f0cdeadb2a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0cdeadb2a ON permit USING btree (agency_id);


--
-- Name: idx_895c01f0d536f43c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0d536f43c ON permit USING btree (admendment_reason_id);


--
-- Name: idx_895c01f0fce96231; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_895c01f0fce96231 ON permit USING btree (level_of_assessment_id);


--
-- Name: idx_9218ff79a76ed395; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9218ff79a76ed395 ON audit USING btree (user_id);


--
-- Name: idx_9218ff79c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9218ff79c54c8c93 ON audit USING btree (type_id);


--
-- Name: idx_9474526c6912924; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526c6912924 ON comment USING btree (variance_id);


--
-- Name: idx_9474526c85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526c85564492 ON comment USING btree (create_user_id);


--
-- Name: idx_9474526ca8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526ca8439af7 ON comment USING btree (permit_id);


--
-- Name: idx_9474526cb4d5a9e2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526cb4d5a9e2 ON comment USING btree (commenter_id);


--
-- Name: idx_9474526cc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526cc1e2efdd ON comment USING btree (last_user_id);


--
-- Name: idx_9474526cc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9474526cc54c8c93 ON comment USING btree (type_id);


--
-- Name: idx_95520eab7975b7e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_95520eab7975b7e7 ON geometry USING btree (model_id);


--
-- Name: idx_95520eab85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_95520eab85564492 ON geometry USING btree (create_user_id);


--
-- Name: idx_95520eabc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_95520eabc1e2efdd ON geometry USING btree (last_user_id);


--
-- Name: idx_95fcc3278955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_95fcc3278955c49d ON comment_criterion USING btree (lookup_id);


--
-- Name: idx_95fcc327f8697d13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_95fcc327f8697d13 ON comment_criterion USING btree (comment_id);


--
-- Name: idx_96794351851858d7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_96794351851858d7 ON appeal USING btree (appellant_id);


--
-- Name: idx_9679435185564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9679435185564492 ON appeal USING btree (create_user_id);


--
-- Name: idx_96794351a6ef75fb; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_96794351a6ef75fb ON appeal USING btree (action_required_id);


--
-- Name: idx_96794351a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_96794351a8439af7 ON appeal USING btree (permit_id);


--
-- Name: idx_96794351bdee7539; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_96794351bdee7539 ON appeal USING btree (decision_id);


--
-- Name: idx_96794351c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_96794351c1e2efdd ON appeal USING btree (last_user_id);


--
-- Name: idx_9b759fe7213cd5ce; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7213cd5ce ON permit_offset_details USING btree (bio_region_id);


--
-- Name: idx_9b759fe73414710b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe73414710b ON permit_offset_details USING btree (agent_id);


--
-- Name: idx_9b759fe766d3ad77; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe766d3ad77 ON permit_offset_details USING btree (advisor_id);


--
-- Name: idx_9b759fe785564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe785564492 ON permit_offset_details USING btree (create_user_id);


--
-- Name: idx_9b759fe7990bea15; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7990bea15 ON permit_offset_details USING btree (criteria_id);


--
-- Name: idx_9b759fe7a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7a8439af7 ON permit_offset_details USING btree (permit_id);


--
-- Name: idx_9b759fe7c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7c1e2efdd ON permit_offset_details USING btree (last_user_id);


--
-- Name: idx_9b759fe7c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7c54c8c93 ON permit_offset_details USING btree (type_id);


--
-- Name: idx_9b759fe7fbbeeaf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9b759fe7fbbeeaf ON permit_offset_details USING btree (condition_status_id);


--
-- Name: idx_9c11a51d33a0336e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9c11a51d33a0336e ON permit_activity_variables USING btree (permit_activity_id);


--
-- Name: idx_9c11a51df3037e8e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9c11a51df3037e8e ON permit_activity_variables USING btree (variable_id);


--
-- Name: idx_9d87843c85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9d87843c85564492 ON dms_model USING btree (create_user_id);


--
-- Name: idx_9d87843ca8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9d87843ca8439af7 ON dms_model USING btree (permit_id);


--
-- Name: idx_9d87843cc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9d87843cc1e2efdd ON dms_model USING btree (last_user_id);


--
-- Name: idx_9d87843cc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9d87843cc54c8c93 ON dms_model USING btree (type_id);


--
-- Name: idx_9ebf618653cd389; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9ebf618653cd389 ON correspondence_dms_links USING btree (correspondence_id);


--
-- Name: idx_9ebf618667039295; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_9ebf618667039295 ON correspondence_dms_links USING btree (dms_model_id);


--
-- Name: idx_a626300285564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a626300285564492 ON search_filter USING btree (create_user_id);


--
-- Name: idx_a6263002a76ed395; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a6263002a76ed395 ON search_filter USING btree (user_id);


--
-- Name: idx_a6263002c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a6263002c1e2efdd ON search_filter USING btree (last_user_id);


--
-- Name: idx_a850610a8955c49d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a850610a8955c49d ON geometry_layers USING btree (lookup_id);


--
-- Name: idx_a850610aa88a6a72; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a850610aa88a6a72 ON geometry_layers USING btree (geometry_id);


--
-- Name: idx_a92509a06dd822c6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a92509a06dd822c6 ON internal_db_user USING btree (job_title_id);


--
-- Name: idx_a92509a0cdeadb2a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_a92509a0cdeadb2a ON internal_db_user USING btree (agency_id);


--
-- Name: idx_ac92ea30a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ac92ea30a8439af7 ON proponent USING btree (permit_id);


--
-- Name: idx_ac92ea30c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ac92ea30c54c8c93 ON proponent USING btree (type_id);


--
-- Name: idx_aea349131645dea9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_aea349131645dea9 ON reference USING btree (reference_id);


--
-- Name: idx_aea3491385564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_aea3491385564492 ON reference USING btree (create_user_id);


--
-- Name: idx_aea34913a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_aea34913a8439af7 ON reference USING btree (permit_id);


--
-- Name: idx_aea34913c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_aea34913c1e2efdd ON reference USING btree (last_user_id);


--
-- Name: idx_b0850b436abb587d; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0850b436abb587d ON glossary USING btree (glossary_id);


--
-- Name: idx_b0850b4385564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0850b4385564492 ON glossary USING btree (create_user_id);


--
-- Name: idx_b0850b43a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0850b43a8439af7 ON glossary USING btree (permit_id);


--
-- Name: idx_b0850b43c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0850b43c1e2efdd ON glossary USING btree (last_user_id);


--
-- Name: idx_b0c73bf83ba389cb; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0c73bf83ba389cb ON permit_condition_variables USING btree (permit_condition_id);


--
-- Name: idx_b0c73bf8f3037e8e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b0c73bf8f3037e8e ON permit_condition_variables USING btree (variable_id);


--
-- Name: idx_b544819145462fbc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b544819145462fbc ON objection USING btree (objector_id);


--
-- Name: idx_b544819185564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b544819185564492 ON objection USING btree (create_user_id);


--
-- Name: idx_b5448191a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b5448191a8439af7 ON objection USING btree (permit_id);


--
-- Name: idx_b5448191c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b5448191c1e2efdd ON objection USING btree (last_user_id);


--
-- Name: idx_b5448191c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_b5448191c54c8c93 ON objection USING btree (type_id);


--
-- Name: idx_ba105116b9a1d19f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ba105116b9a1d19f ON dashlet_variables USING btree (dashlet_id);


--
-- Name: idx_ba105116f3037e8e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ba105116f3037e8e ON dashlet_variables USING btree (variable_id);


--
-- Name: idx_bc9bd1e2465e670c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bc9bd1e2465e670c ON permit_parcels USING btree (parcel_id);


--
-- Name: idx_bc9bd1e2a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bc9bd1e2a8439af7 ON permit_parcels USING btree (permit_id);


--
-- Name: idx_bfe59472213cd5ce; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472213cd5ce ON proposal USING btree (bio_region_id);


--
-- Name: idx_bfe5947285564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe5947285564492 ON proposal USING btree (create_user_id);


--
-- Name: idx_bfe59472a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472a8439af7 ON proposal USING btree (permit_id);


--
-- Name: idx_bfe59472aa02dbac; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472aa02dbac ON proposal USING btree (clearing_purpose_id);


--
-- Name: idx_bfe59472b9034045; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472b9034045 ON proposal USING btree (clearing_method_id);


--
-- Name: idx_bfe59472bdee7539; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472bdee7539 ON proposal USING btree (decision_id);


--
-- Name: idx_bfe59472c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bfe59472c1e2efdd ON proposal USING btree (last_user_id);


--
-- Name: idx_c99b5d606bf700bd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_c99b5d606bf700bd ON parcel USING btree (status_id);


--
-- Name: idx_c99b5d6085564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_c99b5d6085564492 ON parcel USING btree (create_user_id);


--
-- Name: idx_c99b5d6088823a92; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_c99b5d6088823a92 ON parcel USING btree (locality_id);


--
-- Name: idx_c99b5d60c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_c99b5d60c1e2efdd ON parcel USING btree (last_user_id);


--
-- Name: idx_cc4d878d85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cc4d878d85564492 ON variable USING btree (create_user_id);


--
-- Name: idx_cc4d878dc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cc4d878dc1e2efdd ON variable USING btree (last_user_id);


--
-- Name: idx_cc4d878dc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cc4d878dc54c8c93 ON variable USING btree (type_id);


--
-- Name: idx_d002187c2e8a75a9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d002187c2e8a75a9 ON assessment_activity USING btree (accessor_id);


--
-- Name: idx_d002187c85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d002187c85564492 ON assessment_activity USING btree (create_user_id);


--
-- Name: idx_d002187ca8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d002187ca8439af7 ON assessment_activity USING btree (permit_id);


--
-- Name: idx_d002187cc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d002187cc1e2efdd ON assessment_activity USING btree (last_user_id);


--
-- Name: idx_d002187cc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d002187cc54c8c93 ON assessment_activity USING btree (type_id);


--
-- Name: idx_d25c7edb85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d25c7edb85564492 ON vegetation USING btree (create_user_id);


--
-- Name: idx_d25c7edba8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d25c7edba8439af7 ON vegetation USING btree (permit_id);


--
-- Name: idx_d25c7edbc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d25c7edbc1e2efdd ON vegetation USING btree (last_user_id);


--
-- Name: idx_d25c7edbc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d25c7edbc54c8c93 ON vegetation USING btree (type_id);


--
-- Name: idx_d4e6f815d83cc1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f815d83cc1 ON address USING btree (state_id);


--
-- Name: idx_d4e6f8185564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f8185564492 ON address USING btree (create_user_id);


--
-- Name: idx_d4e6f819aad3330; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f819aad3330 ON address USING btree (street_type_id);


--
-- Name: idx_d4e6f81c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f81c1e2efdd ON address USING btree (last_user_id);


--
-- Name: idx_d4e6f81c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f81c54c8c93 ON address USING btree (type_id);


--
-- Name: idx_d4e6f81f92f3e70; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d4e6f81f92f3e70 ON address USING btree (country_id);


--
-- Name: idx_d55597b2a76ed395; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d55597b2a76ed395 ON dashlet_read_users USING btree (user_id);


--
-- Name: idx_d55597b2b9a1d19f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d55597b2b9a1d19f ON dashlet_read_users USING btree (dashlet_id);


--
-- Name: idx_d6a868bdf5b7af75; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d6a868bdf5b7af75 ON holder USING btree (address_id);


--
-- Name: idx_d7986ac54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_d7986ac54c8c93 ON petroleum_parcel USING btree (type_id);


--
-- Name: idx_e28446885564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e28446885564492 ON entity USING btree (create_user_id);


--
-- Name: idx_e284468c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e284468c1e2efdd ON entity USING btree (last_user_id);


--
-- Name: idx_e32af3a61d639c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a61d639c93 ON permit_rating USING btree (environment_values_id);


--
-- Name: idx_e32af3a6498da827; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6498da827 ON permit_rating USING btree (size_id);


--
-- Name: idx_e32af3a64d44979a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a64d44979a ON permit_rating USING btree (urgency_id);


--
-- Name: idx_e32af3a656638590; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a656638590 ON permit_rating USING btree (public_benifit_id);


--
-- Name: idx_e32af3a664d218e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a664d218e ON permit_rating USING btree (location_id);


--
-- Name: idx_e32af3a6690c70f8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6690c70f8 ON permit_rating USING btree (public_interest_id);


--
-- Name: idx_e32af3a67fc21131; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a67fc21131 ON permit_rating USING btree (purpose_id);


--
-- Name: idx_e32af3a685564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a685564492 ON permit_rating USING btree (create_user_id);


--
-- Name: idx_e32af3a6c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6c1e2efdd ON permit_rating USING btree (last_user_id);


--
-- Name: idx_e32af3a6da5d3e9c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6da5d3e9c ON permit_rating USING btree (mitigation_id);


--
-- Name: idx_e32af3a6dc569336; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6dc569336 ON permit_rating USING btree (environment_conditions_id);


--
-- Name: idx_e32af3a6e359287f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e32af3a6e359287f ON permit_rating USING btree (other_approvals_id);


--
-- Name: idx_e87af82c85564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e87af82c85564492 ON permit_condition USING btree (create_user_id);


--
-- Name: idx_e87af82c887793b6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e87af82c887793b6 ON permit_condition USING btree (condition_id);


--
-- Name: idx_e87af82ca8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e87af82ca8439af7 ON permit_condition USING btree (permit_id);


--
-- Name: idx_e87af82cc1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e87af82cc1e2efdd ON permit_condition USING btree (last_user_id);


--
-- Name: idx_e87af82cc54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_e87af82cc54c8c93 ON permit_condition USING btree (type_id);


--
-- Name: idx_f01cb10585564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_f01cb10585564492 ON lookup USING btree (create_user_id);


--
-- Name: idx_f01cb105c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_f01cb105c1e2efdd ON lookup USING btree (last_user_id);


--
-- Name: idx_f01cb105c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_f01cb105c54c8c93 ON lookup USING btree (type_id);


--
-- Name: idx_fc86d2f285564492; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_fc86d2f285564492 ON offset_details USING btree (create_user_id);


--
-- Name: idx_fc86d2f2a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_fc86d2f2a8439af7 ON offset_details USING btree (permit_id);


--
-- Name: idx_fc86d2f2c1e2efdd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_fc86d2f2c1e2efdd ON offset_details USING btree (last_user_id);


--
-- Name: idx_fc86d2f2c54c8c93; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_fc86d2f2c54c8c93 ON offset_details USING btree (type_id);


--
-- Name: uniq_2a0046b02c7c2cba; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_2a0046b02c7c2cba ON correspondence USING btree (workflow_id);


--
-- Name: uniq_4dd68b2ff8697d13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_4dd68b2ff8697d13 ON external_comment USING btree (comment_id);


--
-- Name: uniq_52249eda04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_52249eda04433e7 ON permit_activity USING btree (gis_model_id);


--
-- Name: uniq_5399b64596901f54; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_5399b64596901f54 ON receipt USING btree (number);


--
-- Name: uniq_62a91f54a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_62a91f54a8439af7 ON permit_offset USING btree (permit_id);


--
-- Name: uniq_88bdf3e992fc23a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_88bdf3e992fc23a8 ON app_user USING btree (username_canonical);


--
-- Name: uniq_88bdf3e9a0d96fbf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_88bdf3e9a0d96fbf ON app_user USING btree (email_canonical);


--
-- Name: uniq_895c01f02c7c2cba; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_895c01f02c7c2cba ON permit USING btree (workflow_id);


--
-- Name: uniq_9b759fe7a04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_9b759fe7a04433e7 ON permit_offset_details USING btree (gis_model_id);


--
-- Name: uniq_bfe59472a04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_bfe59472a04433e7 ON proposal USING btree (gis_model_id);


--
-- Name: uniq_c99b5d60a04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_c99b5d60a04433e7 ON parcel USING btree (gis_model_id);


--
-- Name: uniq_c99b5d60f5b7af75; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_c99b5d60f5b7af75 ON parcel USING btree (address_id);


--
-- Name: uniq_d25c7edba04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_d25c7edba04433e7 ON vegetation USING btree (gis_model_id);


--
-- Name: uniq_e32af3a6a8439af7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_e32af3a6a8439af7 ON permit_rating USING btree (permit_id);


--
-- Name: uniq_e87af82ca04433e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uniq_e87af82ca04433e7 ON permit_condition USING btree (gis_model_id);


--
-- Name: fk_1058b9fd63319e53; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fd63319e53 FOREIGN KEY (officer_id) REFERENCES app_user(id);


--
-- Name: fk_1058b9fd85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fd85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_1058b9fd8bf01cd9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fd8bf01cd9 FOREIGN KEY (level_of_compliance_id) REFERENCES lookup(id);


--
-- Name: fk_1058b9fd9d32f035; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fd9d32f035 FOREIGN KEY (action_id) REFERENCES lookup(id);


--
-- Name: fk_1058b9fda8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fda8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_1058b9fdc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fdc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_1058b9fdc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fdc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_1058b9fde6ee6d63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity
    ADD CONSTRAINT fk_1058b9fde6ee6d63 FOREIGN KEY (outcome_id) REFERENCES lookup(id);


--
-- Name: fk_1b7dc89685564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT fk_1b7dc89685564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_1b7dc896a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT fk_1b7dc896a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_1b7dc896c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT fk_1b7dc896c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_1b7dc896c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT fk_1b7dc896c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_1b7dc896cdeadb2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT fk_1b7dc896cdeadb2a FOREIGN KEY (agency_id) REFERENCES lookup(id);


--
-- Name: fk_1b9ae81e8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_features
    ADD CONSTRAINT fk_1b9ae81e8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_1b9ae81ea88a6a72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_features
    ADD CONSTRAINT fk_1b9ae81ea88a6a72 FOREIGN KEY (geometry_id) REFERENCES geometry(id);


--
-- Name: fk_1d9648c7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_write_users
    ADD CONSTRAINT fk_1d9648c7a76ed395 FOREIGN KEY (user_id) REFERENCES app_user(id);


--
-- Name: fk_1d9648c7b9a1d19f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_write_users
    ADD CONSTRAINT fk_1d9648c7b9a1d19f FOREIGN KEY (dashlet_id) REFERENCES dashlet(id);


--
-- Name: fk_2040b60385564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gis_model
    ADD CONSTRAINT fk_2040b60385564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_2040b603c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gis_model
    ADD CONSTRAINT fk_2040b603c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_2a0046b02130303a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b02130303a FOREIGN KEY (from_user_id) REFERENCES app_user(id);


--
-- Name: fk_2a0046b029f6ee60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b029f6ee60 FOREIGN KEY (to_user_id) REFERENCES app_user(id);


--
-- Name: fk_2a0046b02c7c2cba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b02c7c2cba FOREIGN KEY (workflow_id) REFERENCES workflow(id);


--
-- Name: fk_2a0046b085564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b085564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_2a0046b0a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b0a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_2a0046b0c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b0c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_2a0046b0c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence
    ADD CONSTRAINT fk_2a0046b0c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_2f20a84e6fa456ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_uncovered_variances
    ADD CONSTRAINT fk_2f20a84e6fa456ec FOREIGN KEY (permit_offset_id) REFERENCES permit_offset(id);


--
-- Name: fk_2f20a84e8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_uncovered_variances
    ADD CONSTRAINT fk_2f20a84e8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_30cdb4ba7d8ef1ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4ba7d8ef1ec FOREIGN KEY (clearing_principle_id) REFERENCES lookup(id);


--
-- Name: fk_30cdb4ba85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4ba85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_30cdb4bac1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4bac1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_30cdb4bac54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4bac54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_30cdb4baea6efdcd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4baea6efdcd FOREIGN KEY (layer_id) REFERENCES lookup(id);


--
-- Name: fk_30cdb4baf4792058; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY item_of_interest
    ADD CONSTRAINT fk_30cdb4baf4792058 FOREIGN KEY (proposal_id) REFERENCES proposal(id);


--
-- Name: fk_34dcd1762e5ad854; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd1762e5ad854 FOREIGN KEY (salutation_id) REFERENCES lookup(id);


--
-- Name: fk_34dcd17681257d5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd17681257d5d FOREIGN KEY (entity_id) REFERENCES entity(id);


--
-- Name: fk_34dcd17685564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd17685564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_34dcd176979b1ad6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd176979b1ad6 FOREIGN KEY (company_id) REFERENCES company(id);


--
-- Name: fk_34dcd176c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd176c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_34dcd176f5b7af75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_34dcd176f5b7af75 FOREIGN KEY (address_id) REFERENCES address(id);


--
-- Name: fk_3664f3b267039295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity_dms_links
    ADD CONSTRAINT fk_3664f3b267039295 FOREIGN KEY (dms_model_id) REFERENCES dms_model(id);


--
-- Name: fk_3664f3b28beae994; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compliance_activity_dms_links
    ADD CONSTRAINT fk_3664f3b28beae994 FOREIGN KEY (compliance_activity_id) REFERENCES compliance_activity(id);


--
-- Name: fk_3f3c102a63319e53; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT fk_3f3c102a63319e53 FOREIGN KEY (officer_id) REFERENCES app_user(id);


--
-- Name: fk_3f3c102a85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT fk_3f3c102a85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_3f3c102a9d32f035; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT fk_3f3c102a9d32f035 FOREIGN KEY (action_id) REFERENCES lookup(id);


--
-- Name: fk_3f3c102aa8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT fk_3f3c102aa8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_3f3c102ac1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actions_required
    ADD CONSTRAINT fk_3f3c102ac1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_3f4baeb6bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mining_parcel
    ADD CONSTRAINT fk_3f4baeb6bf396750 FOREIGN KEY (id) REFERENCES parcel(id) ON DELETE CASCADE;


--
-- Name: fk_48899d1f8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_regions
    ADD CONSTRAINT fk_48899d1f8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_48899d1fa8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_regions
    ADD CONSTRAINT fk_48899d1fa8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_4c62e638bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_4c62e638bf396750 FOREIGN KEY (id) REFERENCES person(id) ON DELETE CASCADE;


--
-- Name: fk_4c62e638c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_4c62e638c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_4c62e638f8bac902; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_4c62e638f8bac902 FOREIGN KEY (proponent_id) REFERENCES proponent(id);


--
-- Name: fk_4dd68b2f6912924; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY external_comment
    ADD CONSTRAINT fk_4dd68b2f6912924 FOREIGN KEY (variance_id) REFERENCES lookup(id);


--
-- Name: fk_4dd68b2f85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY external_comment
    ADD CONSTRAINT fk_4dd68b2f85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_4dd68b2fc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY external_comment
    ADD CONSTRAINT fk_4dd68b2fc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_4dd68b2ff8697d13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY external_comment
    ADD CONSTRAINT fk_4dd68b2ff8697d13 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- Name: fk_4fbf094f81257d5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_4fbf094f81257d5d FOREIGN KEY (entity_id) REFERENCES entity(id);


--
-- Name: fk_4fbf094f85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_4fbf094f85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_4fbf094fc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_4fbf094fc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_52249ed81c06096; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249ed81c06096 FOREIGN KEY (activity_id) REFERENCES lookup(id);


--
-- Name: fk_52249ed85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249ed85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_52249eda04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249eda04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_52249eda8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249eda8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_52249edc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249edc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_52249edc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity
    ADD CONSTRAINT fk_52249edc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_5399b64585564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY receipt
    ADD CONSTRAINT fk_5399b64585564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_5399b645a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY receipt
    ADD CONSTRAINT fk_5399b645a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_5399b645c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY receipt
    ADD CONSTRAINT fk_5399b645c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_58c2ede967039295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal_dms_links
    ADD CONSTRAINT fk_58c2ede967039295 FOREIGN KEY (dms_model_id) REFERENCES dms_model(id);


--
-- Name: fk_58c2ede9f9b2547f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal_dms_links
    ADD CONSTRAINT fk_58c2ede9f9b2547f FOREIGN KEY (appeal_id) REFERENCES appeal(id);


--
-- Name: fk_5de806bd8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_clearing_principles
    ADD CONSTRAINT fk_5de806bd8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_5de806bdf8697d13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_clearing_principles
    ADD CONSTRAINT fk_5de806bdf8697d13 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- Name: fk_5fedb359a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_audit
    ADD CONSTRAINT fk_5fedb359a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_611347826dd822c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_user
    ADD CONSTRAINT fk_611347826dd822c6 FOREIGN KEY (job_title_id) REFERENCES lookup(id);


--
-- Name: fk_61134782bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_user
    ADD CONSTRAINT fk_61134782bf396750 FOREIGN KEY (id) REFERENCES app_user(id) ON DELETE CASCADE;


--
-- Name: fk_61134782cdeadb2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_user
    ADD CONSTRAINT fk_61134782cdeadb2a FOREIGN KEY (agency_id) REFERENCES lookup(id);


--
-- Name: fk_612e43aa465e670c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel_entity
    ADD CONSTRAINT fk_612e43aa465e670c FOREIGN KEY (parcel_id) REFERENCES parcel(id);


--
-- Name: fk_612e43aa85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel_entity
    ADD CONSTRAINT fk_612e43aa85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_612e43aac1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel_entity
    ADD CONSTRAINT fk_612e43aac1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_612e43aac54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel_entity
    ADD CONSTRAINT fk_612e43aac54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_62a91f546bf700bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT fk_62a91f546bf700bd FOREIGN KEY (status_id) REFERENCES lookup(id);


--
-- Name: fk_62a91f5485564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT fk_62a91f5485564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_62a91f54a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT fk_62a91f54a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_62a91f54c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT fk_62a91f54c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_62a91f54c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset
    ADD CONSTRAINT fk_62a91f54c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_6465049f727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup_parent
    ADD CONSTRAINT fk_6465049f727aca70 FOREIGN KEY (parent_id) REFERENCES lookup(id);


--
-- Name: fk_6465049f8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup_parent
    ADD CONSTRAINT fk_6465049f8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_64820e8d85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advice
    ADD CONSTRAINT fk_64820e8d85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_64820e8da8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advice
    ADD CONSTRAINT fk_64820e8da8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_64820e8dc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advice
    ADD CONSTRAINT fk_64820e8dc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_64820e8dc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advice
    ADD CONSTRAINT fk_64820e8dc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_65c5981685564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT fk_65c5981685564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_65c59816c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT fk_65c59816c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_689d28661c5a10e8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_milestone
    ADD CONSTRAINT fk_689d28661c5a10e8 FOREIGN KEY (permit_offset_details_id) REFERENCES permit_offset_details(id);


--
-- Name: fk_689d286685564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_milestone
    ADD CONSTRAINT fk_689d286685564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_689d2866c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_milestone
    ADD CONSTRAINT fk_689d2866c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_689d2866c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_milestone
    ADD CONSTRAINT fk_689d2866c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_6a2ca10c85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_6a2ca10c85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_6a2ca10ca8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_6a2ca10ca8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_6a2ca10cc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_6a2ca10cc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_6a2ca10cc23c293b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_6a2ca10cc23c293b FOREIGN KEY (reference_type_id) REFERENCES lookup(id);


--
-- Name: fk_6a2ca10cc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_6a2ca10cc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_6ff2360785564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet
    ADD CONSTRAINT fk_6ff2360785564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_6ff23607c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet
    ADD CONSTRAINT fk_6ff23607c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_72eeb6ab67039295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_dms_links
    ADD CONSTRAINT fk_72eeb6ab67039295 FOREIGN KEY (dms_model_id) REFERENCES dms_model(id);


--
-- Name: fk_72eeb6abf8697d13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_dms_links
    ADD CONSTRAINT fk_72eeb6abf8697d13 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- Name: fk_838de00634fc5694; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation_conditions
    ADD CONSTRAINT fk_838de00634fc5694 FOREIGN KEY (vegetation_id) REFERENCES vegetation(id);


--
-- Name: fk_838de0068955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation_conditions
    ADD CONSTRAINT fk_838de0068955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_88bdf3e985564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT fk_88bdf3e985564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_88bdf3e9c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT fk_88bdf3e9c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_895c01f0263aab94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0263aab94 FOREIGN KEY (primary_container_id) REFERENCES dms_model(id);


--
-- Name: fk_895c01f026fa54cf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f026fa54cf FOREIGN KEY (fee_type_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f02c7c2cba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f02c7c2cba FOREIGN KEY (workflow_id) REFERENCES workflow(id);


--
-- Name: fk_895c01f0363c2338; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0363c2338 FOREIGN KEY (approving_officer_id) REFERENCES app_user(id);


--
-- Name: fk_895c01f03aadce18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f03aadce18 FOREIGN KEY (assessing_officer_id) REFERENCES app_user(id);


--
-- Name: fk_895c01f048060b60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f048060b60 FOREIGN KEY (compliance_risk_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f06bf700bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f06bf700bd FOREIGN KEY (status_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f0727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0727aca70 FOREIGN KEY (parent_id) REFERENCES permit(id);


--
-- Name: fk_895c01f085564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f085564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_895c01f09f38984c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f09f38984c FOREIGN KEY (potential_environmental_impact_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f0c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_895c01f0c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f0cdeadb2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0cdeadb2a FOREIGN KEY (agency_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f0d536f43c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0d536f43c FOREIGN KEY (admendment_reason_id) REFERENCES lookup(id);


--
-- Name: fk_895c01f0fce96231; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit
    ADD CONSTRAINT fk_895c01f0fce96231 FOREIGN KEY (level_of_assessment_id) REFERENCES lookup(id);


--
-- Name: fk_9218ff79a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY audit
    ADD CONSTRAINT fk_9218ff79a76ed395 FOREIGN KEY (user_id) REFERENCES app_user(id);


--
-- Name: fk_9218ff79c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY audit
    ADD CONSTRAINT fk_9218ff79c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_9474526c6912924; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526c6912924 FOREIGN KEY (variance_id) REFERENCES lookup(id);


--
-- Name: fk_9474526c85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526c85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_9474526ca8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526ca8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_9474526cb4d5a9e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526cb4d5a9e2 FOREIGN KEY (commenter_id) REFERENCES app_user(id);


--
-- Name: fk_9474526cc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526cc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_9474526cc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_9474526cc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_95520eab7975b7e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry
    ADD CONSTRAINT fk_95520eab7975b7e7 FOREIGN KEY (model_id) REFERENCES gis_model(id);


--
-- Name: fk_95520eab85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry
    ADD CONSTRAINT fk_95520eab85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_95520eabc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry
    ADD CONSTRAINT fk_95520eabc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_95fcc3278955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_criterion
    ADD CONSTRAINT fk_95fcc3278955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_95fcc327f8697d13; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment_criterion
    ADD CONSTRAINT fk_95fcc327f8697d13 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- Name: fk_96794351851858d7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_96794351851858d7 FOREIGN KEY (appellant_id) REFERENCES entity(id);


--
-- Name: fk_9679435185564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_9679435185564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_96794351a6ef75fb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_96794351a6ef75fb FOREIGN KEY (action_required_id) REFERENCES lookup(id);


--
-- Name: fk_96794351a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_96794351a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_96794351bdee7539; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_96794351bdee7539 FOREIGN KEY (decision_id) REFERENCES lookup(id);


--
-- Name: fk_96794351c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY appeal
    ADD CONSTRAINT fk_96794351c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_9b759fe7213cd5ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7213cd5ce FOREIGN KEY (bio_region_id) REFERENCES lookup(id);


--
-- Name: fk_9b759fe73414710b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe73414710b FOREIGN KEY (agent_id) REFERENCES entity(id);


--
-- Name: fk_9b759fe766d3ad77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe766d3ad77 FOREIGN KEY (advisor_id) REFERENCES lookup(id);


--
-- Name: fk_9b759fe785564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe785564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_9b759fe7990bea15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7990bea15 FOREIGN KEY (criteria_id) REFERENCES lookup(id);


--
-- Name: fk_9b759fe7a04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7a04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_9b759fe7a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_9b759fe7c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_9b759fe7c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_9b759fe7fbbeeaf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_offset_details
    ADD CONSTRAINT fk_9b759fe7fbbeeaf FOREIGN KEY (condition_status_id) REFERENCES lookup(id);


--
-- Name: fk_9c11a51d33a0336e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity_variables
    ADD CONSTRAINT fk_9c11a51d33a0336e FOREIGN KEY (permit_activity_id) REFERENCES permit_activity(id);


--
-- Name: fk_9c11a51df3037e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_activity_variables
    ADD CONSTRAINT fk_9c11a51df3037e8e FOREIGN KEY (variable_id) REFERENCES variable(id);


--
-- Name: fk_9d87843c85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dms_model
    ADD CONSTRAINT fk_9d87843c85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_9d87843ca8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dms_model
    ADD CONSTRAINT fk_9d87843ca8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_9d87843cc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dms_model
    ADD CONSTRAINT fk_9d87843cc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_9d87843cc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dms_model
    ADD CONSTRAINT fk_9d87843cc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_9ebf618653cd389; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence_dms_links
    ADD CONSTRAINT fk_9ebf618653cd389 FOREIGN KEY (correspondence_id) REFERENCES correspondence(id);


--
-- Name: fk_9ebf618667039295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY correspondence_dms_links
    ADD CONSTRAINT fk_9ebf618667039295 FOREIGN KEY (dms_model_id) REFERENCES dms_model(id);


--
-- Name: fk_a626300285564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY search_filter
    ADD CONSTRAINT fk_a626300285564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_a6263002a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY search_filter
    ADD CONSTRAINT fk_a6263002a76ed395 FOREIGN KEY (user_id) REFERENCES app_user(id);


--
-- Name: fk_a6263002c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY search_filter
    ADD CONSTRAINT fk_a6263002c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_a850610a8955c49d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_layers
    ADD CONSTRAINT fk_a850610a8955c49d FOREIGN KEY (lookup_id) REFERENCES lookup(id);


--
-- Name: fk_a850610aa88a6a72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_layers
    ADD CONSTRAINT fk_a850610aa88a6a72 FOREIGN KEY (geometry_id) REFERENCES geometry(id);


--
-- Name: fk_a92509a06dd822c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_db_user
    ADD CONSTRAINT fk_a92509a06dd822c6 FOREIGN KEY (job_title_id) REFERENCES lookup(id);


--
-- Name: fk_a92509a0bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_db_user
    ADD CONSTRAINT fk_a92509a0bf396750 FOREIGN KEY (id) REFERENCES app_user(id) ON DELETE CASCADE;


--
-- Name: fk_a92509a0cdeadb2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY internal_db_user
    ADD CONSTRAINT fk_a92509a0cdeadb2a FOREIGN KEY (agency_id) REFERENCES lookup(id);


--
-- Name: fk_ac92ea30a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proponent
    ADD CONSTRAINT fk_ac92ea30a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_ac92ea30bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proponent
    ADD CONSTRAINT fk_ac92ea30bf396750 FOREIGN KEY (id) REFERENCES person(id) ON DELETE CASCADE;


--
-- Name: fk_ac92ea30c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proponent
    ADD CONSTRAINT fk_ac92ea30c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_aea349131645dea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT fk_aea349131645dea9 FOREIGN KEY (reference_id) REFERENCES lookup(id);


--
-- Name: fk_aea3491385564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT fk_aea3491385564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_aea34913a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT fk_aea34913a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_aea34913c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reference
    ADD CONSTRAINT fk_aea34913c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_b0850b436abb587d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossary
    ADD CONSTRAINT fk_b0850b436abb587d FOREIGN KEY (glossary_id) REFERENCES lookup(id);


--
-- Name: fk_b0850b4385564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossary
    ADD CONSTRAINT fk_b0850b4385564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_b0850b43a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossary
    ADD CONSTRAINT fk_b0850b43a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_b0850b43c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glossary
    ADD CONSTRAINT fk_b0850b43c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_b0c73bf83ba389cb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition_variables
    ADD CONSTRAINT fk_b0c73bf83ba389cb FOREIGN KEY (permit_condition_id) REFERENCES permit_condition(id);


--
-- Name: fk_b0c73bf8f3037e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition_variables
    ADD CONSTRAINT fk_b0c73bf8f3037e8e FOREIGN KEY (variable_id) REFERENCES variable(id);


--
-- Name: fk_b13d4896bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY db_user
    ADD CONSTRAINT fk_b13d4896bf396750 FOREIGN KEY (id) REFERENCES app_user(id) ON DELETE CASCADE;


--
-- Name: fk_b544819145462fbc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT fk_b544819145462fbc FOREIGN KEY (objector_id) REFERENCES entity(id);


--
-- Name: fk_b544819185564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT fk_b544819185564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_b5448191a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT fk_b5448191a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_b5448191c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT fk_b5448191c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_b5448191c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objection
    ADD CONSTRAINT fk_b5448191c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_ba105116b9a1d19f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_variables
    ADD CONSTRAINT fk_ba105116b9a1d19f FOREIGN KEY (dashlet_id) REFERENCES dashlet(id);


--
-- Name: fk_ba105116f3037e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_variables
    ADD CONSTRAINT fk_ba105116f3037e8e FOREIGN KEY (variable_id) REFERENCES variable(id);


--
-- Name: fk_bc9bd1e2465e670c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_parcels
    ADD CONSTRAINT fk_bc9bd1e2465e670c FOREIGN KEY (parcel_id) REFERENCES parcel(id);


--
-- Name: fk_bc9bd1e2a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_parcels
    ADD CONSTRAINT fk_bc9bd1e2a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_bfe59472213cd5ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472213cd5ce FOREIGN KEY (bio_region_id) REFERENCES lookup(id);


--
-- Name: fk_bfe5947285564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe5947285564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_bfe59472a04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472a04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_bfe59472a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_bfe59472aa02dbac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472aa02dbac FOREIGN KEY (clearing_purpose_id) REFERENCES lookup(id);


--
-- Name: fk_bfe59472b9034045; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472b9034045 FOREIGN KEY (clearing_method_id) REFERENCES lookup(id);


--
-- Name: fk_bfe59472bdee7539; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472bdee7539 FOREIGN KEY (decision_id) REFERENCES lookup(id);


--
-- Name: fk_bfe59472c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proposal
    ADD CONSTRAINT fk_bfe59472c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_c99b5d606bf700bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d606bf700bd FOREIGN KEY (status_id) REFERENCES lookup(id);


--
-- Name: fk_c99b5d6085564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d6085564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_c99b5d6088823a92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d6088823a92 FOREIGN KEY (locality_id) REFERENCES lookup(id);


--
-- Name: fk_c99b5d60a04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d60a04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_c99b5d60c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d60c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_c99b5d60f5b7af75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parcel
    ADD CONSTRAINT fk_c99b5d60f5b7af75 FOREIGN KEY (address_id) REFERENCES address(id);


--
-- Name: fk_cc4d878d85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT fk_cc4d878d85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_cc4d878dc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT fk_cc4d878dc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_cc4d878dc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT fk_cc4d878dc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_d002187c2e8a75a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT fk_d002187c2e8a75a9 FOREIGN KEY (accessor_id) REFERENCES app_user(id);


--
-- Name: fk_d002187c85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT fk_d002187c85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_d002187ca8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT fk_d002187ca8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_d002187cc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT fk_d002187cc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_d002187cc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assessment_activity
    ADD CONSTRAINT fk_d002187cc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_d25c7edb85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT fk_d25c7edb85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_d25c7edba04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT fk_d25c7edba04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_d25c7edba8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT fk_d25c7edba8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_d25c7edbc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT fk_d25c7edbc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_d25c7edbc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vegetation
    ADD CONSTRAINT fk_d25c7edbc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_d4e6f815d83cc1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f815d83cc1 FOREIGN KEY (state_id) REFERENCES lookup(id);


--
-- Name: fk_d4e6f8185564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f8185564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_d4e6f819aad3330; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f819aad3330 FOREIGN KEY (street_type_id) REFERENCES lookup(id);


--
-- Name: fk_d4e6f81c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f81c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_d4e6f81c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f81c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_d4e6f81f92f3e70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address
    ADD CONSTRAINT fk_d4e6f81f92f3e70 FOREIGN KEY (country_id) REFERENCES lookup(id);


--
-- Name: fk_d55597b2a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_read_users
    ADD CONSTRAINT fk_d55597b2a76ed395 FOREIGN KEY (user_id) REFERENCES app_user(id);


--
-- Name: fk_d55597b2b9a1d19f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dashlet_read_users
    ADD CONSTRAINT fk_d55597b2b9a1d19f FOREIGN KEY (dashlet_id) REFERENCES dashlet(id);


--
-- Name: fk_d6a868bdbf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY holder
    ADD CONSTRAINT fk_d6a868bdbf396750 FOREIGN KEY (id) REFERENCES parcel_entity(id) ON DELETE CASCADE;


--
-- Name: fk_d6a868bdf5b7af75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY holder
    ADD CONSTRAINT fk_d6a868bdf5b7af75 FOREIGN KEY (address_id) REFERENCES address(id);


--
-- Name: fk_d7986abf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY petroleum_parcel
    ADD CONSTRAINT fk_d7986abf396750 FOREIGN KEY (id) REFERENCES parcel(id) ON DELETE CASCADE;


--
-- Name: fk_d7986ac54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY petroleum_parcel
    ADD CONSTRAINT fk_d7986ac54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_e28446885564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT fk_e28446885564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_e284468c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entity
    ADD CONSTRAINT fk_e284468c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_e32af3a61d639c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a61d639c93 FOREIGN KEY (environment_values_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a6498da827; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6498da827 FOREIGN KEY (size_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a64d44979a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a64d44979a FOREIGN KEY (urgency_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a656638590; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a656638590 FOREIGN KEY (public_benifit_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a664d218e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a664d218e FOREIGN KEY (location_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a6690c70f8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6690c70f8 FOREIGN KEY (public_interest_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a67fc21131; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a67fc21131 FOREIGN KEY (purpose_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a685564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a685564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_e32af3a6a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_e32af3a6c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_e32af3a6da5d3e9c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6da5d3e9c FOREIGN KEY (mitigation_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a6dc569336; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6dc569336 FOREIGN KEY (environment_conditions_id) REFERENCES lookup(id);


--
-- Name: fk_e32af3a6e359287f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_rating
    ADD CONSTRAINT fk_e32af3a6e359287f FOREIGN KEY (other_approvals_id) REFERENCES lookup(id);


--
-- Name: fk_e87af82c85564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82c85564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_e87af82c887793b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82c887793b6 FOREIGN KEY (condition_id) REFERENCES lookup(id);


--
-- Name: fk_e87af82ca04433e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82ca04433e7 FOREIGN KEY (gis_model_id) REFERENCES gis_model(id);


--
-- Name: fk_e87af82ca8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82ca8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_e87af82cc1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82cc1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_e87af82cc54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permit_condition
    ADD CONSTRAINT fk_e87af82cc54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_f01cb10585564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup
    ADD CONSTRAINT fk_f01cb10585564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_f01cb105c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup
    ADD CONSTRAINT fk_f01cb105c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_f01cb105c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lookup
    ADD CONSTRAINT fk_f01cb105c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_fc86d2f285564492; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY offset_details
    ADD CONSTRAINT fk_fc86d2f285564492 FOREIGN KEY (create_user_id) REFERENCES app_user(id);


--
-- Name: fk_fc86d2f2a8439af7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY offset_details
    ADD CONSTRAINT fk_fc86d2f2a8439af7 FOREIGN KEY (permit_id) REFERENCES permit(id);


--
-- Name: fk_fc86d2f2c1e2efdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY offset_details
    ADD CONSTRAINT fk_fc86d2f2c1e2efdd FOREIGN KEY (last_user_id) REFERENCES app_user(id);


--
-- Name: fk_fc86d2f2c54c8c93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY offset_details
    ADD CONSTRAINT fk_fc86d2f2c54c8c93 FOREIGN KEY (type_id) REFERENCES lookup(id);


--
-- Name: fk_ff937db2bf396750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proprietor
    ADD CONSTRAINT fk_ff937db2bf396750 FOREIGN KEY (id) REFERENCES parcel_entity(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

