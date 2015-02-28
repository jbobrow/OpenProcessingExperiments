
int counter;
int s, m, h;
float tono;

void setup () {
  size (400, 400);
  smooth ();
  colorMode (HSB, 360, 100, 100);
  
  noStroke ();
fill (#FFD8E4, 150);

    beginShape ();

    vertex (93, 78);
    vertex (83,69);
    vertex (62, 69);
    vertex (51, 93);
    vertex (93, 130);
    vertex (136, 93);
    vertex (124,69);
    vertex (104,69);
    vertex (93, 78);
    endShape (CLOSE);

  
  noStroke ();
  fill (47, 9, 95);
  ellipse (243, 140, 90, 93); //cabeza
   fill (47, 9, 95, 180);
  ellipse (210, 178, 38, 21); // trompa
  
  fill (47, 9, 95);//colita
  ellipse (324, 249, 24, 24);
  
  fill (0);
  ellipse (223, 154, 13, 16); //ojo
  
  fill (#FFFFFF, 180);
  ellipse (222, 156, 8, 7); //ojo
  
  
   //pierna
noStroke ();
 fill (47, 9, 95, 180);
  beginShape ();
  vertex(331, 320);
  vertex(315, 330);
  vertex(310, 374);
  vertex(293, 393);
  vertex (327, 379);

  endShape (CLOSE);
  
 
  //pierna
noStroke ();
 fill (47, 9, 95,180);
  beginShape ();
  vertex(268, 320);
  vertex(249, 330);
  vertex(248, 374);
  vertex(230, 393);
  vertex (265, 379);

  endShape (CLOSE);
  
  
  
  fill (240, 52, 67, 180);
  ellipse (259, 295,74, 79); //pierna
  fill (240, 47, 78);
  ellipse (279, 249, 86, 92); //panza
  noStroke ();

 fill (338, 47, 78);
  ellipse (299, 211, 65, 59); //manga


  fill (240, 47, 78);
  ellipse (322, 292, 74, 80); //pierna2
  
  //brazo2
noStroke ();
  fill (345, 67, 50);
  beginShape ();
   vertex(245, 221);
  vertex(187, 247);
   vertex(191, 268);
  vertex(237, 249);

  endShape (CLOSE);
  
  fill (47, 9, 95, 180);
  ellipse (357, 253, 35, 29); //mano atras
  ellipse (175, 261, 35, 29); //mano reloj
  ellipse (186, 240, 20, 24); //dedpreloj
  
bezier(245, 108, 241, 119, 271, 51, 206, 21);
bezier(206, 21, 205, 34, 224, 77, 248, 109);


bezier(172, 40, 227, 56, 212, 117, 214, 107);
bezier(173, 41, 175, 52, 193, 84, 214, 107);

fill (62,7, 92);//chapita
ellipse (229, 165, 25, 21);

fill (302, 12, 97);//chapita
ellipse (229, 165, 19, 17);

fill (316, 23, 99, 190);/// nariz
ellipse (192, 175, 12, 9);


//cuello

stroke (186, 15, 91, 180);
  fill (#FFFFFF, 180);
  beginShape ();
  vertex(308, 156);
  vertex(207, 203);
  vertex(229, 225);
  vertex(314, 183);
  vertex(308, 156);
  endShape (CLOSE);
  
  triangle (240, 220, 240, 188, 207, 203);
   triangle (240, 188, 278, 170, 272, 203);
      triangle (278, 170, 301, 190, 308, 156);
  
  noStroke ();

//brazo
noStroke ();
  fill (345, 67, 50, 180);
  beginShape ();
   vertex(327, 216);
  vertex(317, 227);
   vertex(343, 252);
  vertex(356, 243);

  endShape (CLOSE);
  
  
  //cadena 
fill (54, 90, 74, 190);
ellipse (175, 214, 18, 20);

stroke (54, 90, 74);
noFill ();
ellipse (218, 323, 11, 17);
ellipse (226, 332, 13, 16);
ellipse (236, 329, 10, 16);
ellipse (239, 312, 13, 19);
ellipse (238, 297, 13, 19);
ellipse (218, 311, 13, 19);
ellipse (218, 299, 13, 19);

//bigotes
stroke (0, 100);
line (232, 160 , 270, 139);

line (237, 166, 267, 166);

line (238, 170, 255, 176);

stroke (341, 91, 60, 180);
strokeWeight (5);
line (231, 283, 251, 292);
}

  


void draw () {
  //carátula del reloj
  translate  (width/2, height/2+50);
  noStroke ();
    fill (tono, 255, 255);
  ellipse ( 0,0, 90, 90);
  fill (54, 83, 87, 150);
  ellipse ( 0,0, 80, 80);
fill (54, 0, 99, 180);
  ellipse ( 0,0, 70, 70);
  
  fill (47, 9, 95, 180);
  ellipse (-30, 30, 20, 15);
  

  
  s=second ();
  m=minute ();
  h= hour ();
   
  if (h>=12){
    h=h-12;
    
  
}

stroke (3);
//segundos
pushMatrix ();
  rotate (radians (6*s));
    strokeWeight (1);
line (0, 0, 0 , -40);
popMatrix ();

//minutos
pushMatrix ();
  rotate (radians (6*m));
  strokeWeight (2);
line (0, 0, 0 , -35);
popMatrix ();

//horas
pushMatrix ();
  rotate (radians (30*h));
  strokeWeight (4);
line (0, 0, 0 , -30);
popMatrix ();


tono=tono+1;

if (tono==255){
tono=0; 
}


}
