PGDMP     .                
    x            Process Management System    12.3    12.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32978    Process Management System    DATABASE     �   CREATE DATABASE "Process Management System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 +   DROP DATABASE "Process Management System";
                postgres    false            �            1259    33010 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    33008    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    33020    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    33018    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    33002    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    33000    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    33028 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    33038    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    33036    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    33026    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    33046    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    33044 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    33106    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    33104    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    32992    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    32990    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    32981    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    32979    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    33137    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    33147 %   loginandregistation_login_information    TABLE     i  CREATE TABLE public.loginandregistation_login_information (
    username character varying(70) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    type_of_user integer NOT NULL,
    is_anonymous boolean NOT NULL
);
 9   DROP TABLE public.loginandregistation_login_information;
       public         heap    postgres    false            �            1259    33245    systemadmins_tokenbody    TABLE     q  CREATE TABLE public.systemadmins_tokenbody (
    id integer NOT NULL,
    token_id integer NOT NULL,
    step integer NOT NULL,
    username character varying(255) NOT NULL,
    "to" character varying(255) NOT NULL,
    approval boolean NOT NULL,
    state_of_emergency boolean NOT NULL,
    body jsonb NOT NULL,
    completed_time timestamp with time zone NOT NULL
);
 *   DROP TABLE public.systemadmins_tokenbody;
       public         heap    postgres    false            �            1259    33243    systemadmins_tokenbody_id_seq    SEQUENCE     �   CREATE SEQUENCE public.systemadmins_tokenbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.systemadmins_tokenbody_id_seq;
       public          postgres    false    229            �           0    0    systemadmins_tokenbody_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.systemadmins_tokenbody_id_seq OWNED BY public.systemadmins_tokenbody.id;
          public          postgres    false    228            �            1259    33213    systemadmins_tokendefinition    TABLE     �   CREATE TABLE public.systemadmins_tokendefinition (
    id integer NOT NULL,
    token_type_name character varying(255) NOT NULL,
    structure jsonb NOT NULL
);
 0   DROP TABLE public.systemadmins_tokendefinition;
       public         heap    postgres    false            �            1259    33211 #   systemadmins_tokendefinition_id_seq    SEQUENCE     �   CREATE SEQUENCE public.systemadmins_tokendefinition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.systemadmins_tokendefinition_id_seq;
       public          postgres    false    223            �           0    0 #   systemadmins_tokendefinition_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.systemadmins_tokendefinition_id_seq OWNED BY public.systemadmins_tokendefinition.id;
          public          postgres    false    222            �            1259    33226     systemadmins_tokenidentification    TABLE     �   CREATE TABLE public.systemadmins_tokenidentification (
    id integer NOT NULL,
    token_type_id integer NOT NULL,
    token_type_name character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL
);
 4   DROP TABLE public.systemadmins_tokenidentification;
       public         heap    postgres    false            �            1259    33224 '   systemadmins_tokenidentification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.systemadmins_tokenidentification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.systemadmins_tokenidentification_id_seq;
       public          postgres    false    225            �           0    0 '   systemadmins_tokenidentification_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.systemadmins_tokenidentification_id_seq OWNED BY public.systemadmins_tokenidentification.id;
          public          postgres    false    224            �            1259    33237    systemadmins_tokenprogress    TABLE     /  CREATE TABLE public.systemadmins_tokenprogress (
    id integer NOT NULL,
    token_id integer NOT NULL,
    step integer NOT NULL,
    "to" character varying(255) NOT NULL,
    state_of_emergency boolean NOT NULL,
    completed boolean NOT NULL,
    completed_time timestamp with time zone NOT NULL
);
 .   DROP TABLE public.systemadmins_tokenprogress;
       public         heap    postgres    false            �            1259    33235 !   systemadmins_tokenprogress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.systemadmins_tokenprogress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.systemadmins_tokenprogress_id_seq;
       public          postgres    false    227            �           0    0 !   systemadmins_tokenprogress_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.systemadmins_tokenprogress_id_seq OWNED BY public.systemadmins_tokenprogress.id;
          public          postgres    false    226            �
           2604    33013    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    33023    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    33005    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    33031    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    33041    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �
           2604    33049    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �
           2604    33109    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �
           2604    32995    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    32984    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    33248    systemadmins_tokenbody id    DEFAULT     �   ALTER TABLE ONLY public.systemadmins_tokenbody ALTER COLUMN id SET DEFAULT nextval('public.systemadmins_tokenbody_id_seq'::regclass);
 H   ALTER TABLE public.systemadmins_tokenbody ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �
           2604    33216    systemadmins_tokendefinition id    DEFAULT     �   ALTER TABLE ONLY public.systemadmins_tokendefinition ALTER COLUMN id SET DEFAULT nextval('public.systemadmins_tokendefinition_id_seq'::regclass);
 N   ALTER TABLE public.systemadmins_tokendefinition ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �
           2604    33229 #   systemadmins_tokenidentification id    DEFAULT     �   ALTER TABLE ONLY public.systemadmins_tokenidentification ALTER COLUMN id SET DEFAULT nextval('public.systemadmins_tokenidentification_id_seq'::regclass);
 R   ALTER TABLE public.systemadmins_tokenidentification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �
           2604    33240    systemadmins_tokenprogress id    DEFAULT     �   ALTER TABLE ONLY public.systemadmins_tokenprogress ALTER COLUMN id SET DEFAULT nextval('public.systemadmins_tokenprogress_id_seq'::regclass);
 L   ALTER TABLE public.systemadmins_tokenprogress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �          0    33010 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   k�       �          0    33020    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   ��       �          0    33002    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   d�       �          0    33028 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   Q�       �          0    33038    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   �       �          0    33046    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   i�       �          0    33106    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   ��       �          0    32992    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   ��       �          0    32981    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   E�       �          0    33137    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    220   b�       �          0    33147 %   loginandregistation_login_information 
   TABLE DATA           �   COPY public.loginandregistation_login_information (username, first_name, last_name, password, email, type_of_user, is_anonymous) FROM stdin;
    public          postgres    false    221   ��       �          0    33245    systemadmins_tokenbody 
   TABLE DATA           �   COPY public.systemadmins_tokenbody (id, token_id, step, username, "to", approval, state_of_emergency, body, completed_time) FROM stdin;
    public          postgres    false    229   1�       �          0    33213    systemadmins_tokendefinition 
   TABLE DATA           V   COPY public.systemadmins_tokendefinition (id, token_type_name, structure) FROM stdin;
    public          postgres    false    223   M�       �          0    33226     systemadmins_tokenidentification 
   TABLE DATA           j   COPY public.systemadmins_tokenidentification (id, token_type_id, token_type_name, created_by) FROM stdin;
    public          postgres    false    225   @�       �          0    33237    systemadmins_tokenprogress 
   TABLE DATA           }   COPY public.systemadmins_tokenprogress (id, token_id, step, "to", state_of_emergency, completed, completed_time) FROM stdin;
    public          postgres    false    227   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 6, true);
          public          postgres    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 173, true);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 13, true);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 18, true);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 33, true);
          public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);
          public          postgres    false    202            �           0    0    systemadmins_tokenbody_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.systemadmins_tokenbody_id_seq', 39, true);
          public          postgres    false    228            �           0    0 #   systemadmins_tokendefinition_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.systemadmins_tokendefinition_id_seq', 3, true);
          public          postgres    false    222            �           0    0 '   systemadmins_tokenidentification_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.systemadmins_tokenidentification_id_seq', 21, true);
          public          postgres    false    224            �           0    0 !   systemadmins_tokenprogress_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.systemadmins_tokenprogress_id_seq', 43, true);
          public          postgres    false    226            �
           2606    33135    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �
           2606    33062 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �
           2606    33025 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �
           2606    33015    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �
           2606    33053 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �
           2606    33007 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207                       2606    33043 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215                       2606    33077 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �
           2606    33033    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213                       2606    33051 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217                       2606    33091 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �
           2606    33129     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213                       2606    33115 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �
           2606    32999 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �
           2606    32997 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �
           2606    32989 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203                       2606    33144 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    220                       2606    33154 P   loginandregistation_login_information loginandregistation_login_information_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.loginandregistation_login_information
    ADD CONSTRAINT loginandregistation_login_information_pkey PRIMARY KEY (username);
 z   ALTER TABLE ONLY public.loginandregistation_login_information DROP CONSTRAINT loginandregistation_login_information_pkey;
       public            postgres    false    221            #           2606    33253 2   systemadmins_tokenbody systemadmins_tokenbody_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.systemadmins_tokenbody
    ADD CONSTRAINT systemadmins_tokenbody_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.systemadmins_tokenbody DROP CONSTRAINT systemadmins_tokenbody_pkey;
       public            postgres    false    229            %           2606    33258 I   systemadmins_tokenbody systemadmins_tokenbody_token_id_step_a99d20d7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.systemadmins_tokenbody
    ADD CONSTRAINT systemadmins_tokenbody_token_id_step_a99d20d7_uniq UNIQUE (token_id, step);
 s   ALTER TABLE ONLY public.systemadmins_tokenbody DROP CONSTRAINT systemadmins_tokenbody_token_id_step_a99d20d7_uniq;
       public            postgres    false    229    229                       2606    33221 >   systemadmins_tokendefinition systemadmins_tokendefinition_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.systemadmins_tokendefinition
    ADD CONSTRAINT systemadmins_tokendefinition_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.systemadmins_tokendefinition DROP CONSTRAINT systemadmins_tokendefinition_pkey;
       public            postgres    false    223                       2606    33223 M   systemadmins_tokendefinition systemadmins_tokendefinition_token_type_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.systemadmins_tokendefinition
    ADD CONSTRAINT systemadmins_tokendefinition_token_type_name_key UNIQUE (token_type_name);
 w   ALTER TABLE ONLY public.systemadmins_tokendefinition DROP CONSTRAINT systemadmins_tokendefinition_token_type_name_key;
       public            postgres    false    223                       2606    33234 F   systemadmins_tokenidentification systemadmins_tokenidentification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.systemadmins_tokenidentification
    ADD CONSTRAINT systemadmins_tokenidentification_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.systemadmins_tokenidentification DROP CONSTRAINT systemadmins_tokenidentification_pkey;
       public            postgres    false    225                       2606    33242 :   systemadmins_tokenprogress systemadmins_tokenprogress_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.systemadmins_tokenprogress
    ADD CONSTRAINT systemadmins_tokenprogress_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.systemadmins_tokenprogress DROP CONSTRAINT systemadmins_tokenprogress_pkey;
       public            postgres    false    227            !           2606    33256 Q   systemadmins_tokenprogress systemadmins_tokenprogress_token_id_step_f880c2d7_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.systemadmins_tokenprogress
    ADD CONSTRAINT systemadmins_tokenprogress_token_id_step_f880c2d7_uniq UNIQUE (token_id, step);
 {   ALTER TABLE ONLY public.systemadmins_tokenprogress DROP CONSTRAINT systemadmins_tokenprogress_token_id_step_f880c2d7_uniq;
       public            postgres    false    227    227            �
           1259    33136    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �
           1259    33073 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �
           1259    33074 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �
           1259    33059 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207                        1259    33089 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215                       1259    33088 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215                       1259    33103 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            	           1259    33102 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �
           1259    33130     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213                       1259    33126 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219                       1259    33127 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219                       1259    33146 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    220                       1259    33145 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    220                       1259    33155 <   loginandregistation_login_information_username_23d49571_like    INDEX     �   CREATE INDEX loginandregistation_login_information_username_23d49571_like ON public.loginandregistation_login_information USING btree (username varchar_pattern_ops);
 P   DROP INDEX public.loginandregistation_login_information_username_23d49571_like;
       public            postgres    false    221                       1259    33254 :   systemadmins_tokendefinition_token_type_name_745f46e8_like    INDEX     �   CREATE INDEX systemadmins_tokendefinition_token_type_name_745f46e8_like ON public.systemadmins_tokendefinition USING btree (token_type_name varchar_pattern_ops);
 N   DROP INDEX public.systemadmins_tokendefinition_token_type_name_745f46e8_like;
       public            postgres    false    223            (           2606    33068 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    2799    211            '           2606    33063 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    2804    211            &           2606    33054 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    207    205    2794            *           2606    33083 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    2804    215            )           2606    33078 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    213    2812    215            ,           2606    33097 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    217    207    2799            +           2606    33092 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    213    2812    217            -           2606    33116 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    205    2794    219            .           2606    33121 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    2812    213            �   3   x�3�,�,.I�ML���+�2�,.)MI�+)�2�L�-�ɯLM-����� H��      �   �  x�%��qC1C��c1�Է��_Gp�2��PP�u��)�sd���r���X�˱cOǉ폾{;^������Q�R�AҌ�K;�N4�8pzq�r��K��{e\���x9��劋�;.^��xy��o��=��~�o8V<9v�t�x����[�Q<�z@���\K˽4�\L��4]M��4P]N��4�~�?��O�%d7��]QBvG	�%���[J������)'�uB<��N)��g:}�,_,���.��tc%&��ʉJ傥r�R���\�T.d*W��r!S���\�T.d*Od*Od*O�<���D.��,�~��,O�<���B.��,/䲼���<-/�iy!O˫_������ ���-bh�C{�ڻ���&��>1�7���R�bh/C{�x�^+��ʏ�����      �   �  x�m�[n�0E��*XA��w�Q)J�C���i���c�x��0>W>7aZ��������mr3��3���|ڞ�Q�\���`"ʍ,��ͬ1�FV �Z�a���:��f�����Ƭ 5���E �1��~����H1"��q�`9,�c�J��J��?G/D4w�� R�����`�%�@`��t���S��5���ݍ�p�;l�͗i\�_-_���j0��>Q��"F��?r/���i
t#V�q�j�����}'=�턡^�ػNX��;hǓ���s^w����Uш�Lr��2ڊ=M���2�E����m�:}���-�:(c��2Z�!l��}z��jI�-ً�J2�he��%�W{q_Ǒ��'���vI�7��:m��yS�od�$M�e���e��Uζ?w����K��oI�cڏ�x����P
h��s�C�Z�UiOr{�������+i�Q���M)���;      �   �  x���I��H�Ϯ_���V�ܜ^���^ؗ2��Fic�n0��׏m�F�S�s	���ԗ/^�vN�ޠ�>C"��  ^OoI��\vyã�l{�I�c���u6F��ʧ��j���So��yK�u��@�;�ߑ؀@�PT�2R��P��ElD>K9�l8��*I�4*���6aA,�YR�}��<� �����ȏ��H�������ϳ�E�l>�ڒ�w��(��n���C��Z�����~�ǒ ���>ښ��������E�`bI�����1�x���L�{��7ۅ�I�V�d��tm�ޗ�9[ۤ�m�3��w�[1�X�wipZY9�����O������		�(BBk�'~�Vر�b0�'>��D����tU�{�F��
�����֓�ќ�F����Ϲ4���H&@�՜7\��WnR=;X���3�ϰP�Id$���c�V�_�T[��F�߆zM���4���2�&0L�^O�f!^��p&������&HEX��,��]e���R�n���Lg�=�&(�HV�$QHjl�{o����-a��v�Y����N�Ufo��H�������h!�R��5ï�GBy%T�x��3�J�3V X������ΖK��v�?Y��)���9s˲M:�y����Xl��133�Q��8����"~8\?�Y��u����\EJ�T�O2p�o~n�8d7��"s�"�����tmZ��Pq��nd��Z�bq�_��@AT @ā�1g�Us�%P�O��5 �@\C|.~M�۬��Z�e|1ׇ����}�]�;Z�G�"�f;׻���ќ�7�}��˷"`P�L?lN��qZ]g�a�C����[@�H ��*D����拻�[��OLgv�[CB���t"�>�ӱךf����0�����D�|qi�����4�֬��,)�Qk�����p�H�P��������In��      �   ;   x�˱�0��Z7���va�9��J�&��naJ/RG���s4�q�=���$�}�
      �      x������ � �      �     x���MO�@��ί�|**�vfw��?��p�T�D2��Ďb�P�{�#!fMJ��r��yߝ�}f6�!G~p"�X�\0e��U�X-�첻oڛ�]t�U54]�w��!��>� �z.����e���]g:���A�(J��1����C�f�]]g�i�T#S��^#���.�๸s��xf�h��w_����u����&�j��ŵ�Ȼ��]�b�KH���b1q�ԙJ0LX��&�Q���4��"W^@Y3t������H4�et�n��AbސF�U>�h;��YɥA�����x% C��T��~���v��`CxxÁ�BB&�gA��D�ŕ�D�q���}�t�u_��ŷf�y[���5B�9B�B���櫦=UU
��[��!%NV���D�2��HD��A��C仇�R��h�׌c�)h�W ���z\�!��2�%rfIr���{��9w"H "�U�n���>a��pD,Q�R3e�k����v����9���ӓ�#&*Aᆵ �ӣF���2/�f�����7�2����Y{$�V�A�\�M�_v�8+v���S=���7dľ͹�G�q�������z�=����D�H�Ӕ�2.��O�P�CS�O.M�J�43r/��ȼ�V�;����TӃȿ���ߣ��p�;�`�3�t��q����G"��vܿ)�'��QoVM������q$�_UJdI�����U�J�0�Y.^ǭ�S�
[g���<$
LhK�!Ĝ�t~�b!��Z����)�/w��f���C;      �   �   x�m��!���a��ﻘ\��(-�쁷!&����ӎ5�Gb�\r��qKy��9�*	�~��eIpbQ�p4�pi�R꿀�Q�i�p�� v�3��J��݉gɱ��Z0�^j���=�����M�����q�nWvR��[�v�}��p� ��b�      �     x���ю� ���S��d3���rBZ꒨�����P�6�=�^����1'7D3�xM(!��`��]����#����RT�!�=��7*Y�-���Ë'%N*�#�Aչ6�ʛ�}���>����<#�Ao�S��ԥӭ:}:{JvQ5��*��[�[��B�7jн�EA�Č�7}�t�W��!����?�3C���EQt�*6]QSH7�k۽�0F�ZnvOɷ�7�}=P�4#�l~��t�Y�M+���=ri��R%�_����ٻ�Ҟ@*)�Rn�Y��|�Ξut>̻o�w^�&�>�x$D��&��Į���
�t4��$���H�%�_���z7��Q*�b��6�iL������5�=�"[[7�/�b����5�E�(�Y�����Zl�b�0=��im�:���n(-�	�h������~~�l����Mwv�xCeòa	�3�p1�c>���*EE��uҊ0G�C�s/� ��6GB�ee�X*!S�����
N�3      �   �  x�m�َ�H ����Oq�'t���;ATEv0��}Gل��ӝN&��+|��gA��U<��[<Uﭧ�tV\�ٯ�D}��,�K�3�$�P/�qQP�۪��^����=�)$��e�ĺ�����u��e��򖹾}�ڟ]�2!�>��I WM���3��d�o?���p����/�/��N؉CU�Gv��V��ٯ�G��F�j��;��\��j7�u��됃/��&�ԕS�[����������@��>)�����b��,Z&�~�F̱]��{n�ƈ���R�1	�cݼ)M���fc'�!W!�6���8�͌��|�%R.�㚵SC.�m����M��e���{۰JJ[{=�&�!��T�y�-�2`d�^�+�D�\l�wN3�&���qO ��>���v_JD���K�L-�c��T �9��g֌̰zD��Ԭ
�0���P�U�~CV � �ODR$��ē�z�s�f��L`���LmC����Ț���ڗϽ-0E�
#V���N���^����im�*l�������j��IUƻ��g۽��V߼�Q.��p�F�y����l�k��)�A&����)��\���/�B�s�X�)�����%n.����?Fq$�B����F�X)�������t=}�H�K�Q��#H �7�S+ ��ax��Q�fQ6��5yI�)��_j��1���v#�z��N�9��e���3�۽
Oq�KB�ڼ����G�)���J�~C�Q?�+`;9z�k]jӰt1p��Rcէ�}�Ί�xݿ�^�
g��/�Vf�u"K*����G��ZTS��4��K5�v�:j�B8���Nv*�O���bww�ItoFY������[���?��>)P���ߟ� F�|      �   .   x��NL����y��F�&�f�ى�Y�z����Ɯi\1z\\\ �
�      �     x���OO�0���SX��a���q�k����X	�ƥ�����T�����4┲Z����y�y**�����J����I�>�g�eW�Y�f7fٕ�E��u5Z�/e�f���ʴ�~G�+�[�.�Z�d��y0v��n뻶����4�������"<<����?~6����p���$�0rN�9�ʜ�\(�2�ү$=��o�h[n�6�TSh���p(�S`����C(.��s�0%R�Y�$4=!��{�^�X1~D2�TL9�0U�
����L�b�1I��a3h��2f�b���<�x�*7ǔ_,����8g%�2�)���'z����y�kkbx���X�8�p%MmwGl��>W;�wm�}*Vz[V;t����ٶ���������1!2e��ҷp�����i{.��A�)O!�3���_5�k�~��s*q*�~�\��A�C��R�5��%��~75*;�ie)�T��
f~�!#n
�0@|�lh~�����/�/-�u����P�}��N�n���˜p�$f��ëq}*Ft7GK��7��۹�P����˭��í�%p*�����=|�||E?��z�x.�B`*��C��^�ބ���2m��k��f�#�PLy�ƅ+������~���iN2́�~�Ax�سnb"��,Ʋ��X))h?i��6����r���EH*H����B<�pUn�%a}sn�Џ�=�p�����Í.7��(�l�Wלy���	D���5�|]}���1*��e$s��ggggu      �   �   x��R�
�0��W��"Zqq�A�.�I%��h5'�(J��M��vp����ݻ��H�D�G�P9�*������²� N7lU�f'[Ul!M	�bi!4��9��A�����_�R9p�q˓g�l�J��QA͋�։E�A�bI�k=�����J-���V���}ySEF�ӆ��}��R﬌]�g�޷1����	��N�)�p�	x����8~)��yY<R      �   M   x�3�4�NM.���Sp�H�KO��L�+��2�%ah�i�&�`�g �5�+k�]�(?�������>s�����qqq �uD]      �   o  x�}�;nc1Eky��)i-Ӽbxl8M���TREyP{�pxI�`9�o��Q��� ��\�&�l��)��z!� y�v��8eTe��9x.����뎗ɽ" �$/�Th�SŁ�--'Bc6�bj��4x.�㶡B�ED1iZ��z��p��5SX���[y~<;��]�(ge(���]�Uh�T os0�Y��3�X�0���i7��VU���U����Nq
>,d�,�ӷ��πM�:�C[�-����Y�Fש�._>?y�Uk�	r����?�8e3d����O�'�*����#x��¢i��1�Q�)�d���y�U�ft����lp�Ո�A�.�
�ɬ�C�Ś�O����D�z��o�\.�i��4     