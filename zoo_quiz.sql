PGDMP                         {            zoo_quiz    15.3    15.3     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17257    zoo_quiz    DATABASE     |   CREATE DATABASE zoo_quiz WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE zoo_quiz;
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   pg_database_owner    false    5            �            1259    17403    animals    TABLE     g  CREATE TABLE public.animals (
    animal_id integer NOT NULL,
    animal_name character varying(255),
    answer_1_1 integer,
    answer_1_2 integer,
    answer_1_3 integer,
    answer_1_4 integer,
    answer_2_1 integer,
    answer_2_2 integer,
    answer_2_3 integer,
    answer_2_4 integer,
    answer_3_1 integer,
    answer_3_2 integer,
    answer_3_3 integer,
    answer_3_4 integer,
    answer_4_1 integer,
    answer_4_2 integer,
    answer_4_3 integer,
    answer_4_4 integer,
    answer_5_1 integer,
    answer_5_2 integer,
    answer_5_3 integer,
    answer_5_4 integer,
    answer_6_1 integer,
    answer_6_2 integer,
    answer_6_3 integer,
    answer_6_4 integer,
    answer_7_1 integer,
    answer_7_2 integer,
    answer_7_3 integer,
    answer_7_4 integer,
    answer_8_1 integer,
    answer_8_2 integer,
    answer_8_3 integer,
    answer_8_4 integer,
    answer_9_1 integer,
    answer_9_2 integer,
    answer_9_3 integer,
    answer_9_4 integer,
    answer_10_1 integer,
    answer_10_2 integer,
    answer_10_3 integer,
    answer_10_4 integer,
    image text,
    result_text text,
    animal_url text
);
    DROP TABLE public.animals;
       public         heap    postgres    false            �            1259    17402    animals_answers_id_animals_seq    SEQUENCE     �   CREATE SEQUENCE public.animals_answers_id_animals_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.animals_answers_id_animals_seq;
       public          postgres    false    218                       0    0    animals_answers_id_animals_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.animals_answers_id_animals_seq OWNED BY public.animals.animal_id;
          public          postgres    false    217            �            1259    17397    question    TABLE     �   CREATE TABLE public.question (
    id bigint,
    id_question integer,
    question text,
    id_answer numeric,
    answer text
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    17275    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    id_user character varying(30) NOT NULL,
    username character varying(50),
    review text NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    17280    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    214                       0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    215            o           2604    17406    animals animal_id    DEFAULT        ALTER TABLE ONLY public.animals ALTER COLUMN animal_id SET DEFAULT nextval('public.animals_answers_id_animals_seq'::regclass);
 @   ALTER TABLE public.animals ALTER COLUMN animal_id DROP DEFAULT;
       public          postgres    false    217    218    218            n           2604    17288 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                      0    17403    animals 
   TABLE DATA           =  COPY public.animals (animal_id, animal_name, answer_1_1, answer_1_2, answer_1_3, answer_1_4, answer_2_1, answer_2_2, answer_2_3, answer_2_4, answer_3_1, answer_3_2, answer_3_3, answer_3_4, answer_4_1, answer_4_2, answer_4_3, answer_4_4, answer_5_1, answer_5_2, answer_5_3, answer_5_4, answer_6_1, answer_6_2, answer_6_3, answer_6_4, answer_7_1, answer_7_2, answer_7_3, answer_7_4, answer_8_1, answer_8_2, answer_8_3, answer_8_4, answer_9_1, answer_9_2, answer_9_3, answer_9_4, answer_10_1, answer_10_2, answer_10_3, answer_10_4, image, result_text, animal_url) FROM stdin;
    public          postgres    false    218   ?                 0    17397    question 
   TABLE DATA           P   COPY public.question (id, id_question, question, id_answer, answer) FROM stdin;
    public          postgres    false    216   �)                 0    17275    reviews 
   TABLE DATA           @   COPY public.reviews (id, id_user, username, review) FROM stdin;
    public          postgres    false    214   �0                  0    0    animals_answers_id_animals_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.animals_answers_id_animals_seq', 28, true);
          public          postgres    false    217                       0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 8, true);
          public          postgres    false    215            s           2606    17408    animals animals_answers_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_answers_pkey PRIMARY KEY (animal_id);
 F   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_answers_pkey;
       public            postgres    false    218            q           2606    17294    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    214               1  x��Z[o�~&��x�%��`iѤI'h7C�����R
�$J�eײ�.I�h�D�&%�/�����sfv���b�A����\����\��j��[��ي��ȿ�75�RW4+K�H��pݶ�^&Ӵ�������v'�i7,fd�rê�3M�cz�35[)��j�X,��\��)���dӟ|�Q�{�����4��F޹w��s-����yo��w��7�����_�)|K@�!��z�߃Qo������p a�cX:��W�u�?����S�!=N������]��?��Q�&��3x��a��A�º~/���0�fy�Q&�8���������@�	J���9�iΑ�;���C?�0�1�[z����.��o�=����n"��������Zf�5�L�l�6͖e�m����6kwX˩�ݔ��y�io����q��k5�Ƭ�F1��� �Z�ȸ��k ��+���$���۵J����=�5�ᧁh�i�`�i�^�~��P��aB��j-!|�0���Ö��Aq?b3( ����P�c��_���I�@����	
�kn����Tx-@�!�q����@�c��)u9�f��ڛ�?{��ks�㎳��uY
�ْ~-���9�#��H��V`^��܈k(��,�]P.h�v���>����5������8��a��3�����xv������30%�>��g��OH��3��=q|I�1!c�@օOFq��H��O�}�B�'mN��c/	�Q؍~��N`4j~�����#o����'h�a*z4%�0������)�.Y�l����4��B�>��>͆v���4�6����w�}��`r9���Q�@,�;v��jrc�˖��b�6W8�e$�co�jŁxf��d�vC!� f囂�����nZ�ϰ��0V�NF�0���9�s����^��z�T5�9UW+��-�y&���8(:@5��p����>��6�O�d�pzK���Dn�V�@���0�\H
���K��E�$�K�C z"Q� �y�y�M�x�n��%$�8;���ͽ���� ���h��=ƕ��� @wf�/Yl�;t���������&�щNJ���I/.$��)�-=��{�HN�I�����1������6|�݌k5@��\�lV��c�]6�K�fJ]qq����5�g.��7�����J���^�R�(�U���ʢu���y�{k�_Hx�Va<sB���{�|��˙�cRF=�g2~���s'�V3뜖������M��=��=����BsN+Kd���`��CM��e��@�ϕƘ0 �B�AL�w��Cգ�6	��0��?®���#��� ?��2��e_\�b�Y���pZv-z���k�I)��y�(*�$5�˺�t��K����"��x�-��p�ј����M؀$M��b���5z���E ����px�;h,����CESH.�<c@V�'`.c>qe!棐[���$����}����#a������o2aP��*���<&	sA�"C�
�?_���.zg��ad8XQ�� V}4��A�Q�)9$��Ɨ�>�$�k�c�\e,�ܚ]:5'"A=�0�苀��`8�F)8����P �u��(X�"�7�9�l��N-^������h��ؔ9�����=��c_߽���Z�qH���@b�n\C�qP��r�2���@bdo\#w�2�ڍ�@b�V4�nX��aE���c�f��b+�UD����s/g�j��xY)�7�Z�J;��3�5Ui:ǵlV���ɨj>[�pÄ�皦f+�:�h�����Z)e)����ٿ���D��Q�L�!^���h�3��J")M�a��A�/Cb
,����%[�B_�Q�d)$�
k �R��a��1e�i:%��΅�� �\����U��]�M��iu��MU��J��q��¬(�^����C�tZz��Own����X͌�l�2��I�,��=G7�\O}������W͎��?8��߳�>�9�/>-��V��c>�w
��MNSn�ﰆ�v��ێYk����-[R��\5[.d5��^��Z�0nW�j��]V�s��������ͮn8�o���j����r�������?��T�[��v��k�;�(0����M4�$�0`�6fQ�'�CN��	���'#�	¼���16 �^`V)��0�$�s5Y%� L%@1cD��x�6�pn)�`����8��j_�Y�FD]��a�����O��k�Զ��HU��0�4�	ݪ���L$�MJF�E�KH���+��N���\8uf7̺��\w;�HM�����W�XŶ*�a6�J�Q��ӱhG�A�k��k։Qe��ݐP�y�5&���_��`<c9.��7;N��.�B�tV��+KE��0�{��1m�,�$�a(R*� I*�U���q�>*y��sY���LP]��J"tgu�H5S2���E����4�!2a�?D�����])��'�B�e�ʌǕ$�0�x�������~H���ݮ�7�r�4Q)㈔����k��p�f�N۲��tж̙��j6�d�N#t�U�E�~���lmm�[N��\�̊�*��YE兂�*�<���d�J�jI����&p"�>��	����Y�C�)�0+�?��'�N�N�!3{ sNt�$��\>B�J��	U�7N�C���T:F��JxJ�a�,J(�V�VEi{ea�g���E��5�\�0��wom�ҝ-�����QD��!�,[I-��bg����`�UOI�"��u6VU4|����K\/�\क�E�X-Vx����ę���*̘�m����o&���|B��J����))��$�'">�B������	�D�(-��*���<)\&҇c����	-O��L���Q����2;vJ�e5Nn�@�����R�b��T���  �?��E��*�OQ3C#w����U3!{���Ƣ@Ӳ��������l\�b��Ry`�����X����k�W���T�G��U㾄�?�j�
*��8�`\�K�
_�袞���5�zR!b��G�~��dZ��>�0%4��Xn ꏒZV�U{aV��p s�b�` ��7��W���D�(W�U8���C96%����O���1�"m�� ���������t2M��Ѭ�{�J�4o~�E��[��ͮa�H�r�b����e��U틙��n� N�R2�6kfE���2L�/�1��r���y������9�1})O?�.�5�@2��R��ֲ$n�x��s�#��s�/>�!	>�֓QiX�O�ae�2ϛ�C�,-<��W1��cHp��0,��O<�#�<U?^�Vi۶�U�Y�ɔy�j78���`ˏ�)�x)V6mc��ӂ�\��Ց�u�f>��R.��ZE�J���\1�3-�hz|�nE&aQ���X��<��s�^�!�� n
Ӏ𱽨㑅�H�,sL9BB����	�E����&��*h��>XtN9qh��ɑYf���(�<4�e<?	���KHJq�pj��48�7"O ��바��6w�rM��_����� 
Z��         L  x��Y�NW}>�R*Č�-/���Di�Fmh�$��%*WiQsi�6J����0`{�g��O�Zk�1���DX��=sξ�/$.q�[n���Ͳ�3����rߊ�l��I����������Y��,�o�@�܉}���<(���]�Xw~�gG��,wcߋ�)��|�{�~���w�p0��~�g$?Ə����|Y�Xc��:|�PkG�O%�����C�A���
���~���[����h8���rN �!"�	S�F�.u�.�����S���V���d,ڭ��"Q����Y�ߣؿ�`��#?@ H�é`e��Q�zwPv�\�G��W��pd��xqqѥ4�D�t��òS��K�M���(�Pm#1�t�[J�-}�Ei�3G�$��;����Pfpj(�u7;!���l�w[����px	qρ�jH��޶�S�ۣ&�[@˺�E���ۖ��NU o
	��x�)��,烦e�Y�)Tx	��D/(�,�Qhd�7��%s
`U�0C�	t�RԵ~��@�`ӜgGᚥa_Q,���S�BTG�Ҍ��p
,x��ͅš�����ys�� a5_�:J�S9���@R�M�߽�͝w	I?�x{c�;�o}{{#J��0k��Bٲ�纾k 4<��4J�Q���L�r�f�P+�M6 �6� >�
��z;4�(���B-D	 �!Cnl�?pxD�9��"�P�q��*|�y�j@�%KO���q���7�����,#���H�W'R���$��Ԋ��}��*��kJmCǓ���C蕑��;@W
O�Q̜pQ%�5Pu�<J_l���n�okڕ�[9ľA1��@z���?���}��2�iOe�B�B�£ �CZ}��?������3����+c���mI���e3��Q�Z=�jR�2ӓ}��κϟ��yh=O�x6��l���Oۣ0^a���-sT{L'��H�9h���ݿ���/�+?�������G�������V$�b�ܑl,�#c~���d�jȟ:��$�`W�k�E��'���P'�	�x�KQ�t5�h�#�c�0;҇X0�qdd[��EN��P����\�&n% ����<�*�O`K$Q��6q�Q{a/���n=:Y�{OM��c_O���A���WˇD�m/��6�QnB�ݽ������{n~��Ր7�䵍JG�F�BL�m{9��mZ�j����WC	�с�W�zꁷ�G-���c�RQ>zM�w��i�j���lp��XF�U�y YZ���0f6��D�.�U�߰P�<'��iF�X*�6��売�����*mZ-(&omn�V�c��7�t�Rx&.�������`�����)mU�r�ew�0xr�Rdi8����șڟ>\V>��6�Ex�k�"C�la#���n��ژ����vF���)��n����n����m�ʽ�m���'�(�1� �J^���h8��թ��`�ͦ������I��[#^6�j��&i@.B�I�V�(�u���lh��w�qX(���ս�MZ	��5%��P���t����)�d.�����0�\���k���DN����jh���S$���Ϳ]�4��zݭ;k��Vh���y��Lǅ\�!�*��`���[�?7Y�8�JZ��}���a��M�X�����a�	X7+V�Z?�U�v�r�r�]mˬ�z��NT�-ĸ��U�,9��7{��ð�����l*j�R�[�j�A��
p��
mL��y�T�۟�4��/(�����y�%��0L���T�߳�Ć����y�cu	]-u�u`[Q��f.j,}^���੷<�-i�~���\tc1����ۯ~         �   x�u��J�@�ϻO��Y��f��"���mb�Mz�`�x��?���W��9���03��G,�Ħ&u��ٲ�y,�h1�_aҋ��+��T���W�
���im��V�|*���<x�m��)|b�z&�� (�҆�N,�iB�]���)XM��b��Ua�יtB'�Dְ��Zzf�QΘg�z΢m�÷���z!�����     