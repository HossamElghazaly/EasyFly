SQLite format 3   @     	                                                               	 .c� � ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        �;�YtablenotenoteCREATE TABLE note (
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
)'; indexsqlite_autoindex_user_2user'; indexsqlite_autoindex_user_1user          
& 'Ry��
�
&                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                �U ;�Qhossam.aldeen@gmail.comscrypt:32768:8:1$TFHQ5C3qXWclzFcT$1d097f4db91f6db33b922d3b44a37d62c88bcc3f4dc9f102f06cf6be25396563ef81a57d065fb252545550e1521a77c7e0834aa7a9c45ab918cdc98c4eccf89bhossamelghazalyhosam�O 5�QM.Ejjy2264@nu.edu.egscrypt:32768:8:1$4jAE0FE1eccBdnqw$dc660285e008b69fd0076ecb7307e834239505e9dabe055e30fce5015423ee2b6832cfce39c9e21116fafcc4537d06b3f5e2f130c65da4fbdc829a96825b66c6mohamedhelalhkjbj�O ?�QM.Elsherbiny226@nu.edu.egscrypt:32768:8:1$Af665cEtmgrB901t$709572a6ef0172dea5bd357d6fdd718d062b99a8a8ad709a79208705866d18092da2967d6af483cc30c08f4910afda69703d8d224c2d83b26fa99f438de5f64emohelalbjhhh�T 9�QM.Elshey2264@nu.edu.egscrypt:32768:8:1$zfpa4s9TU2m8fQxC$e2cd250b591ec73ec7c8d8239ac6752793bc0f9750e3da3e3ceb2856a4575e49908a5fd4d3575ef614fc160304be18745aaeb650e47691d86e3a563e3640c0bdmohamedhelalhnjnbjhn�V =�QM.Elsherby2264@nu.edu.egscrypt:32768:8:1$DigrhSSXd6c8qbVV$93e01ee4075406365850310530c59ba36282f9f8f4a27f56323c77e2714ebd85fe834c57ea41dfb20c76b6b81c12f34506c5aa81af65531c0ea72d9cc12ac1dbmohamedhelalzhzhhzhh�R =�QM.Elshbiny2264@nu.edu.egscrypt:32768:8:1$GSFbYJoYX8GwaZSR$4db19de2014fc59dfd285cae678f07e8485e5c05db11cf4fdce90fe1580d02fc7da1e3070ea785c3d8969676efe009487644028b87771bd15c3b7a412f03f387alikareemzhzhhzk�V A�QM.Elsherbiny2264@nu.edu.egscrypt:32768:8:1$qb9a9gTUWt94T8Ug$081381b19580d7d36d73b78815dbfeb29cda2e2681af670d5381271b74b8320fb06b1117723485b17d2b8270fadbb48752a4d58f5c689a281eda6bc58fc94a4dmohamedhelalzhzhhz
   : V��o��:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ;hossam.aldeen@gmail.com5M.Ejjy2264@nu.edu.eg?M.Elsherbiny226@nu.edu.eg9M.Elshey2264@nu.edu.eg=M.Elsherby2264@nu.edu.eg=M.Elshbiny2264@nu.edu.egA	M.Elsherbiny2264@nu.edu.eg
   � �������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            	hosam	hkjbj	bjhhhhnjnbjhnzhzhhzhhzhzhhzk		zhzhhz                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              