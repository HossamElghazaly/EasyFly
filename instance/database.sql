SQLite format 3   @     m                                                               m .c� 
j ������
j                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                �@�[tableflightflightCREATE TABLE flight (
	id INTEGER NOT NULL, 
	departure_city VARCHAR(150) NOT NULL, 
	destination_city VARCHAR(150) NOT NULL, 
	departure_date DATE NOT NULL, 
	return_date DATE, 
	flight_class VARCHAR(50) NOT NULL, 
	available_seats INTEGER NOT NULL, 
	price FLOAT NOT NULL, 
	PRIMARY KEY (id)
)��UtablebookingbookingCREATE TABLE booking (
	id INTEGER NOT NULL, 
	airline VARCHAR(50) NOT NULL, 
	booking_ref VARCHAR(50) NOT NULL, 
	email_or_last_name VARCHAR(100) NOT NULL, 
	created_at DATETIME DEFAULT (CURRENT_TIMESTAMP), 
	PRIMARY KEY (id)
)��tablesearchsearchCREATE TABLE search (
	id INTEGER NOT NULL, 
	trip_type VARCHAR(20) NOT NULL, 
	from_location VARCHAR(100) NOT NULL, 
	to_location VARCHAR(100) NOT NULL, 
	departure_date DATE NOT NULL, 
	return_date DATE, 
	passengers INTEGER NOT NULL, 
	PRIMARY KEY (id)
)�;�YtablenotenoteCREATE TABLE note (
	id INTEGER NOT NULL, 
	data VARCHAR(10000), 
	date DATETIME, 
	user_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES user (id)
)��tableuseruserCREATE TABLE user (
	id INTEGER NOT NULL, 
	email VARCHAR(150) NOT NULL, 
	password VARCHAR(150) NOT NULL, 
	firstname VARCHAR(150) NOT NULL, 
	lastname VARCHAR(150), 
	username VARCHAR(150) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (email), 
	UNIQUE (username)
)'; indexsqlite_autoindex_user_2user'; indexsqlite_autoindex_user_1user          Q 'Ry��
�
&	V~��Q                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               �B �Qm$m@mmscrypt:32768:8:1$c3hRAG7npmHOfjZv$a77fb2cf6f7842076ba5237ce3021052e9f488903c9136c78d23baf07c0e773852bb5c27dc5865d96a8e5783aba0db000211a0127ae9054cd326aa660ca710camouradraafatmourad�H )�QM.El@nu.edu.egscrypt:32768:8:1$YWkjHhI7KWwCveY5$5ab50c4cde92ff9add37e6bb1ac13a9d1c2989b909dc5254d720e434911b4b8150a42fb2081b9cf04f76c4616a0d2686dbc9b3a64e44f934d39751d5db153ba6khaledhelalhero2�G -�Qhossam@gmail.comscrypt:32768:8:1$YrFmGe4peeA7KZQP$c9cb271188610504d9908b1235026e7ac61095caa515baa7bb38d49cb7fabf885b5a87507601e0982f04e48c88525c7d51ade227e0406d773b1e23f663195ae4HossamRabierr�P
 9�QM.Elsherbiny@nu.edu.egscrypt:32768:8:1$iEN7aMQ1RerhFgtR$a245e5a888ff2016cef9260e4d672c323cfa30eef425782be689c164e71f8589af9d25dffd3ebe8c2ae14d3d543a96e09c214f2fdddcaf8778588fc42caece6dkhaledhelalhero1�U	 ;�QM.Elsherbiny2264@nhghghscrypt:32768:8:1$lGuYbXsuWoT0W2Wg$cac58ffa25091784678c6dcf095a1eb659a0ee16fc27487f1b837b7ff1e7730b1df72662884c16671af1239e2d1110303e400fafa466cae78d8d889a74a0e99bmohamedhelalzhzhhzll�M 1�QM.Elsherbiny2264@nscrypt:32768:8:1$MMoAwPvngkF27SGK$1c5a08e727d1f2183817a9bea867dfb5b3fb39cbf38301afa7e69c43111fcc70e241a534f4330ab4f1ce28413ea084907230bdc85b81d890f029f0628c5d2e15mohamedhelaljjjjj�U ;�Qhossam.aldeen@gmail.comscrypt:32768:8:1$TFHQ5C3qXWclzFcT$1d097f4db91f6db33b922d3b44a37d62c88bcc3f4dc9f102f06cf6be25396563ef81a57d065fb252545550e1521a77c7e0834aa7a9c45ab918cdc98c4eccf89bhossamelghazalyhosam�O 5�QM.Ejjy2264@nu.edu.egscrypt:32768:8:1$4jAE0FE1eccBdnqw$dc660285e008b69fd0076ecb7307e834239505e9dabe055e30fce5015423ee2b6832cfce39c9e21116fafcc4537d06b3f5e2f130c65da4fbdc829a96825b66c6mohamedhelalhkjbj�O ?�QM.Elsherbiny226@nu.edu.egscrypt:32768:8:1$Af665cEtmgrB901t$709572a6ef0172dea5bd357d6fdd718d062b99a8a8ad709a79208705866d18092da2967d6af483cc30c08f4910afda69703d8d224c2d83b26fa99f438de5f64emohelalbjhhh�T 9�QM.Elshey2264@nu.edu.egscrypt:32768:8:1$zfpa4s9TU2m8fQxC$e2cd250b591ec73ec7c8d8239ac6752793bc0f9750e3da3e3ceb2856a4575e49908a5fd4d3575ef614fc160304be18745aaeb650e47691d86e3a563e3640c0bdmohamedhelalhnjnbjhn�V =�QM.Elsherby2264@nu.edu.egscrypt:32768:8:1$DigrhSSXd6c8qbVV$93e01ee4075406365850310530c59ba36282f9f8f4a27f56323c77e2714ebd85fe834c57ea41dfb20c76b6b81c12f34506c5aa81af65531c0ea72d9cc12ac1dbmohamedhelalzhzhhzhh�R =�QM.Elshbiny2264@nu.edu.egscrypt:32768:8:1$GSFbYJoYX8GwaZSR$4db19de2014fc59dfd285cae678f07e8485e5c05db11cf4fdce90fe1580d02fc7da1e3070ea785c3d8969676efe009487644028b87771bd15c3b7a412f03f387alikareemzhzhhzk�V A�QM.Elsherbiny2264@nu.edu.egscrypt:32768:8:1$npcq2s13GxyYeK0q$84f17864897223dcfbb1a15b1bdab231670f9373a62156ee7e554cbda91ab3d21ff9f2a65c22a1b0670f9d7b46887c0f274ba04b8ad8cf606d7125817a15bfffmohamedhelalzhzhhz
   � V��#�o���:��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
m$m@mm)M.El@nu.edu.eg-hossam@gmail.com9M.Elsherbiny@nu.edu.eg
;M.Elsherbiny2264@nhghgh	1M.Elsherbiny2264@n;hossam.aldeen@gmail.com5M.Ejjy2264@nu.edu.eg?M.Elsherbiny226@nu.edu.eg9M.Elshey2264@nu.edu.eg=M.Elsherby2264@nu.edu.eg=M.Elshbiny2264@nu.edu.egA	M.Elsherbiny2264@nu.edu.eg
   u �������u�����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
mourad	hero2rr	hero1
zhzhhzll		jjjjj	hosam	hkjbj	bjhhhhnjnbjhnzhzhhzhhzhzhhzk		zhzhhz                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               8� ���\0��o2��i'��a(��s0
�
�
v
;
 	�	�	T	��h2���Z$���L��t>��f0��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            48 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:59:5747 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:59:4646 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:59:3545 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:59:2744 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:59:1343 736B3333h.rabie2272@nu.edu.eg2025-01-01 22:58:5642 736B3333h.rabie2272@nu.edu.eg2025-01-01 22:58:4441 736B3333h.rabie2272@nu.edu.eg2025-01-01 22:57:4440 736B3333h.rabie2272@nu.edu.eg2025-01-01 22:57:324/ 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:52:244. 736E3333h.rabie2272@nu.edu.eg2025-01-01 22:49:264- 736E3333h.rabie2272@nu.edu.eg2025-01-01 20:41:184, 736E3333h.rabie2272@nu.edu.eg2025-01-01 20:16:564+ 736E3333h.rabie2272@nu.edu.eg2025-01-01 19:32:084* 736E3333h.rabie2272@nu.edu.eg2025-01-01 19:01:334) 736E3333h.rabie2272@nu.edu.eg2025-01-01 18:37:594( 736E3333h.rabie2272@nu.edu.eg2025-01-01 18:33:404' 736E3333h.rabie2272@nu.edu.eg2025-01-01 18:33:274& 736E3333h.rabie2272@nu.edu.eg2025-01-01 17:39:364% 736E3333h.rabie2272@nu.edu.eg2025-01-01 17:39:144$ 736E3333h.rabie2272@nu.edu.eg2025-01-01 16:16:204# 736E3333h.rabie2272@nu.edu.eg2025-01-01 00:53:469" A36E8888hossam.elghazaly@gmail.com2024-12-31 23:58:379! A36E8888hossam.elghazaly@gmail.com2024-12-31 23:55:039  A36E8888hossam.elghazaly@gmail.com2024-12-31 23:51:419 A36E8888hossam.elghazaly@gmail.com2024-12-31 22:17:179 A36E8888hossam.elghazaly@gmail.com2024-12-31 22:07:089 A36E8888hossam.elghazaly@gmail.com2024-12-31 21:53:474 736B3333h.rabie2272@nu.edu.eg2024-12-30 23:02:059 A36E8888M.Elsherbiny2264@nu.edu.eg2024-12-30 22:24:479 A36E8888M.Elsherbiny2264@nu.edu.eg2024-12-30 22:10:259 A36E7777M.Elsherbiny2264@nu.edu.eg2024-12-30 12:38:22= ?3EasyFly7777M.Elsherbiny2264@u.edu.eg2024-12-30 12:15:12> A3EasyFly5555M.Elsherbiny2264@nu.edu.eg2024-12-29 22:11:02A A3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.eg2024-12-29 21:53:47@ ?3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.e2024-12-29 21:33:148 /3FastAirFA67890smith@example.com2024-12-29 21:22:287 +3QuickJetQJ54321doe@example.com2024-12-29 21:22:287 -3EasyFlyEF12345john@example.com2024-12-29 21:22:28@ ?3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.e2024-12-29 21:12:53@ ?3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.e2024-12-29 20:30:48@ ?3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.e2024-12-29 17:27:37@ ?3EasyFlyBK-2555M.Elsherbiny2264@nu.edu.e2024-12-29 17:20:23A A3EasyFlyBK-1222M.Elsherbiny2264@nu.edu.eg2024-12-29 16:41:00A A3EasyFlyBK-1222M.Elsherbiny2264@nu.edu.eg2024-12-29 16:32:53A A3EasyFlyBK-1222M.Elsherbiny2264@nu.edu.eg2024-12-29 16:25:03;
 A36EffffffM.Elsherbiny2264@nu.edu.eg2024-12-28 23:12:02;	 A38DffffffM.Elsherbiny2264@nu.edu.eg2024-12-28 23:08:48* !39Dffgrrrrgrggrrgr2024-12-28 12:52:04* !39Dffgrrrrgrggrrgr2024-12-28 12:36:32* !39Dffgrrrrgrggrrgr2024-12-28 12:30:53* !39Dffgrrrrgrggrrgr2024-12-28 12:03:19* !39Dffgrrrrgrggrrgr2024-12-28 01:21:45& 36Bfffffffffff2024-12-28 01:13:37& 36Efffffffffff2024-12-28 01:13:27& 36Efffffffffff2024-12-28 01:10:38   K� ���R)���{M$���vH���qC���l>
�
�
�
g
9
	�	�	�	b	4	���S%���c0��n@���oC���\3	���S�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        'K	 ! BerlinRome2025-08-20Economyd �2J	 #! #SydneyLos Angeles2025-07-10First Class�-I	 ! MumbaiSingapore2025-06-15Business�(H	 ! TokyoSeoul2025-04-12Economy ��/G	 ! #New YorkLondon2025-03-05First Class
�*F	 ! DohaAbu Dhabi2025-02-20EconomyF �(E	 ! CairoParis2025-01-15Business 'D	 ! CairoDubai2025-01-10Economy2,2C	 #! #SydneyLos Angeles2025-07-10First Class�-B	 ! MumbaiSingapore2025-06-15Business(�'A	 ! BerlinRome2025-05-20EconomyP �(@	 ! TokyoSeoul2025-04-12Economy �,/?	 ! #New YorkLondon2025-03-05First Class�*>	 ! DohaAbu Dhabi2025-02-20EconomyF �(=	 ! CairoParis2025-01-15Business2�'<	 ! CairoDubai2025-01-10Economyd �(;	 ! CairoParis2025-01-10Business2�':	 ! CairoDubai2025-03-05Economyd �)9	 ! DohaAbu Dhabi2025-02-01Economy2d,8	 ! New YorkLondon2024-02-10Business2 17	 !!CairoDubai2025-01-052025-01-06Economyd �,6	 ! New YorkLondon2024-02-10Business2 15	 !!CairoDubai2025-01-052025-01-06Economyd �,4	 ! New YorkLondon2024-02-10Business2 13	 !!CairoDubai2025-01-052025-01-06Economyd �,2	 ! New YorkLondon2024-02-10Business2 11	 !!CairoDubai2025-01-052025-01-06Economyd �,0	 ! New YorkLondon2024-02-10Business2 1/	 !!CairoDubai2025-01-052025-01-06Economyd �,.	 ! New YorkLondon2024-02-10Business2 1-	 !!CairoDubai2025-01-052025-01-06Economyd �,,	 ! New YorkLondon2024-02-10Business2 '+	 ! CairoDubai2025-01-05Economyd �,*	 ! New YorkLondon2024-02-10Business2 ')	 ! CairoDubai2025-01-05Economyd �,(	 ! New YorkLondon2024-02-10Business2 ''	 ! CairoDubai2025-01-15Economyd �,&	 ! New YorkLondon2024-02-10Business2 '%	 ! CairoDubai2024-01-15Economyd �,$	 ! New YorkLondon2024-02-10Business2 '#	 ! CairoDubai2024-01-15Economyd �,"	 ! New YorkLondon2024-02-10Business2 '!	 ! CairoDubai2024-01-15Economyd �, 	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,
	 ! New YorkLondon2024-02-10Business2 '		 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �,	 ! New YorkLondon2024-02-10Business2 '	 ! CairoDubai2024-01-15Economyd �