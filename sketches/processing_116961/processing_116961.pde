
//Code von Mirwan Jomaa für Aufgabe1 Creative coding
// Übung: nostroke, fill, size, translate, rect

// Größe, Hintergrund und Rahmen
size(611, 720);
fill(#e5e1ce);
noStroke();
rect(0, 0, 611, 720);
fill(240, 239, 233);
stroke(#675638);
rect(12 , 11 , 583, 697);
rect(11, 10, 584, 698); 
 
//Buchstabensuppe 
fill(#8a9baf);
noStroke(); 
//D
translate(67, 60);
rect(0, 0, 52, 22);
rect(0, 28, 18, 54);
rect(26, 66, 52, 16);
rect(61, 0, 17, 59);
//E
translate(90, 0);
rect(0, 0, 67, 22);
rect(0, 28, 18, 54);
rect(24, 66, 43, 16); 
//S
translate(101, 0);
rect(0, 0, 18, 50);
rect(0, 66, 52, 16);
rect(57, 31, 14, 51);
rect(25, 0, 47, 17); 
//T
translate(80, 0);
rect(0, 0, 53, 16);
rect(18, 22, 18, 60);
//Y
translate(59, 0);
rect(0, 0, 17, 50);
rect(0, 66, 44, 14);
rect(51, 0, 15, 80); 
//L
translate(76, 0);
rect(0, 0, 17, 55);
rect(0, 62, 65, 17);
rect(42, 0, 23, 23);
  
//Alle Dunkelblauen Rechtecke
translate(-406, 0);
fill(#1e2a39);
noStroke();
//Kleine 
rect(114, 30, 24, 24);
rect(218, 28, 22, 22);
rect(352, 28, 23, 23);  
//Große
translate(0, 114);
rect(0, 0, 56, 263);
rect(267, 0, 203, 37);
rect(406, 153, 65, 256);
rect(137, 417, 334, 61);
rect(0, 272, 75, 108);
 
//Graue Rechtecke
fill(#8a9baf);
//Links
rect(61, 0, 101, 110);
rect(64, 117, 65, 109);
rect(170, 0, 90, 79);
//Rechts
rect(175, 338, 100, 71);
rect(280, 322, 119, 87);
rect(338, 186, 61, 128);
//Unten links
translate(0, 391);
rect(0, 0, 121, 19);
rect(0, 23, 121, 19);
rect(0, 46, 121, 19);
rect(0, 69, 121, 19);
//oben rechts
translate(392, -350);
rect(0, 0, 15, 107);
rect(20, 0, 15, 107);
rect(43, 0, 15, 107);
rect(63, 0, 15, 107);
  
//Rot Gelb Blau
translate(-392, -41);
//Rot
fill(#960a03);
rect(219, 186, 40, 40);
//Gelb
fill(#e7b82b);
rect(185, 85, 68, 21);
rect(190, 304, 66, 26);
//Blau
fill(#316ba8);
rect(149, 171, 26, 55);
rect(299, 186, 27, 58);
