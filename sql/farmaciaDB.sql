PGDMP     #    4            	    {         
   FarmaciaDB    15.3    15.3 '    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    16927 
   FarmaciaDB    DATABASE     �   CREATE DATABASE "FarmaciaDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "FarmaciaDB";
                postgres    false            '           0    0    DATABASE "FarmaciaDB"    COMMENT     G   COMMENT ON DATABASE "FarmaciaDB" IS 'Base de datos proyecto farmacia';
                   postgres    false    3366            �            1259    16936    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion text,
    telefono character varying(20)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16935    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    217            (           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    216            �            1259    16929    medicamentos    TABLE     �   CREATE TABLE public.medicamentos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    stock integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    impuesto numeric(5,2) NOT NULL
);
     DROP TABLE public.medicamentos;
       public         heap    postgres    false            �            1259    16928    medicamentos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.medicamentos_id_seq;
       public          postgres    false    215            )           0    0    medicamentos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.medicamentos_id_seq OWNED BY public.medicamentos.id;
          public          postgres    false    214            �            1259    25119    usuarios    TABLE     G   CREATE TABLE public.usuarios (
    username text,
    password text
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            *           0    0    TABLE usuarios    COMMENT     8   COMMENT ON TABLE public.usuarios IS 'Tablad eusuarios';
          public          postgres    false    222            �            1259    16959    venta_detalles    TABLE     �   CREATE TABLE public.venta_detalles (
    id integer NOT NULL,
    venta_id integer,
    medicamento_id integer,
    cantidad integer NOT NULL,
    CONSTRAINT cantidad_mayor_cero CHECK ((cantidad > 0))
);
 "   DROP TABLE public.venta_detalles;
       public         heap    postgres    false            �            1259    16958    venta_detalles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.venta_detalles_id_seq;
       public          postgres    false    221            +           0    0    venta_detalles_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.venta_detalles_id_seq OWNED BY public.venta_detalles.id;
          public          postgres    false    220            �            1259    16945    ventas    TABLE     �   CREATE TABLE public.ventas (
    id integer NOT NULL,
    cliente_id integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ventas_fecha_check CHECK ((fecha <= CURRENT_TIMESTAMP))
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    16944    ventas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.ventas_id_seq;
       public          postgres    false    219            ,           0    0    ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;
          public          postgres    false    218            y           2604    16939    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            x           2604    16932    medicamentos id    DEFAULT     r   ALTER TABLE ONLY public.medicamentos ALTER COLUMN id SET DEFAULT nextval('public.medicamentos_id_seq'::regclass);
 >   ALTER TABLE public.medicamentos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            |           2604    16962    venta_detalles id    DEFAULT     v   ALTER TABLE ONLY public.venta_detalles ALTER COLUMN id SET DEFAULT nextval('public.venta_detalles_id_seq'::regclass);
 @   ALTER TABLE public.venta_detalles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            z           2604    16948 	   ventas id    DEFAULT     f   ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);
 8   ALTER TABLE public.ventas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16936    clientes 
   TABLE DATA           C   COPY public.clientes (id, nombre, direccion, telefono) FROM stdin;
    public          postgres    false    217   {*                 0    16929    medicamentos 
   TABLE DATA           K   COPY public.medicamentos (id, nombre, stock, precio, impuesto) FROM stdin;
    public          postgres    false    215   �*                  0    25119    usuarios 
   TABLE DATA           6   COPY public.usuarios (username, password) FROM stdin;
    public          postgres    false    222   �*                 0    16959    venta_detalles 
   TABLE DATA           P   COPY public.venta_detalles (id, venta_id, medicamento_id, cantidad) FROM stdin;
    public          postgres    false    221   5+                 0    16945    ventas 
   TABLE DATA           7   COPY public.ventas (id, cliente_id, fecha) FROM stdin;
    public          postgres    false    219   R+       -           0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);
          public          postgres    false    216            .           0    0    medicamentos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.medicamentos_id_seq', 1, false);
          public          postgres    false    214            /           0    0    venta_detalles_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.venta_detalles_id_seq', 1, false);
          public          postgres    false    220            0           0    0    ventas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ventas_id_seq', 1, false);
          public          postgres    false    218            �           2606    16943    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    217            �           2606    16934    medicamentos medicamentos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.medicamentos DROP CONSTRAINT medicamentos_pkey;
       public            postgres    false    215            �           2606    16965 "   venta_detalles venta_detalles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT venta_detalles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.venta_detalles DROP CONSTRAINT venta_detalles_pkey;
       public            postgres    false    221            �           2606    16952    ventas ventas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    219            �           2606    16971 1   venta_detalles venta_detalles_medicamento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT venta_detalles_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES public.medicamentos(id);
 [   ALTER TABLE ONLY public.venta_detalles DROP CONSTRAINT venta_detalles_medicamento_id_fkey;
       public          postgres    false    221    3200    215            �           2606    16966 +   venta_detalles venta_detalles_venta_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT venta_detalles_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);
 U   ALTER TABLE ONLY public.venta_detalles DROP CONSTRAINT venta_detalles_venta_id_fkey;
       public          postgres    false    219    3204    221            �           2606    16953    ventas ventas_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);
 G   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_cliente_id_fkey;
       public          postgres    false    3202    217    219                  x������ � �         M   x�3�L��I��45�00�30�44Q\F�ɩI�@INCN#��	��2�t��IM/J442�4�43�J� �=... m�Y          0   x�������>��ŉn��E�FF�*\���E�ə�A�=... {��            x������ � �            x������ � �     