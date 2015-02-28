
//Miro Miro
//Burcu Yurdakul 050411040
//Grafik Tasarım 3 
//Adv. Computer Graphics 1 
//Bager Akbağ 

size (338, 450); //Proje Boyutu
smooth(); // Yumuşak Çizgiler
stroke(#0c0d0f);// Çizgi Rengi HEX Kodları ile
strokeWeight(5);//Çizgi Kalınlığı

//Mavi Alan
fill(#394f9b); //Quad ın içi mavi ile doldurulur
quad (0, 0, 60, 0, 270, 450, 0, 450);

//Yeşil Alan
fill(#6f962b); //Quad ın içi yeşil ile doldurulur
quad (60, 0, 338, 0, 338, 450, 270, 450);

//Resimdeki ufak elipsler..
fill (#0c0d0f);
ellipse (30, 250, 47, 50);

fill (#0c0d0f);
ellipse (30, 430, 45, 50);

fill (#0c0d0f);
ellipse (320, 290, 44, 45);

//Sarı Alan (kafası)
fill(#fed82d);
triangle(78, 40, 220, 40, 169, 230);

//Kırmızı alan (gövde)
fill(#990e09);
triangle(169, 160, 60, 410, 278, 400);

//Sağ Göz
fill (#0c0d0f);
ellipse (210, 80, 20, 20);

//Sol Göz
fill (#0c0d0f);
ellipse (130, 60, 10, 10);

line (130, 100, 140, 120);

//Surat üzerindeli yarım daire
noFill();
arc(140, 60, 80, 100, -1, 2);

fill(#0c0d0f);
quad (90, 410, 80, 450, 285, 450, 265, 405);

line(90, 410, 105, 360);
line(265, 405, 245, 355);
line(130, 55, 160, 18);

//Sol tafaftaki yıldız çizgiler
stroke(190);
strokeWeight(1);
line (35, 150, 35, 190);
line (15, 170, 60, 170);
line (15, 190, 50, 150);
line (15, 150, 50, 190);

