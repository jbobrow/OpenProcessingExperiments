
/*
Konkuk University
SOSi iDesign

Name: CHOI JIhye <<------ Write your full name here!
ID: jihye <<--------- Write your ID here!

*/

int value = 0;

void setup(){
size (600, 600);
// noLoop();
smooth();
colorMode (RGB,600);
}

void draw(){
  println(mouseX + " : " + mouseY);

 //face 
 fill(#FCF505);
 ellipse (300, 280, 550, 580); 
 
 // nose
 strokeWeight(15);
 point(280,278);
 point (320, 278);
  
 //eyes 
 fill (255);
 stroke(0);
 strokeWeight(8);
 line (116, 106, 134, 147);
 line (208, 106, 193, 146);
 line (384, 106,392, 145);
 line (461, 105, 452, 148);
 
  fill(#FAFAFA);
  ellipse (width*0.285, height*0.3, 150, 70);
  ellipse (width*0.7, height*0.3, 150, 70);
  
  fill(0);
  ellipse (width*0.285, height*0.3, 30, 30); 
   ellipse (width*0.7, height*0.3, 30, 30);

  
  // mouoth
  fill (#F01D39);
 bezier(width*0.25, height*0.7, 245, 480, 360, 480, width*0.75, height*0.7); 
 line (149, 417, 448, 417);
 beginShape ();
 vertex (width*0.25,418);
 vertex (255, 361);
 vertex (297, 396);
 vertex (348, 361);
 vertex ( width*0.75,418);
 endShape();
 


if (mousePressed){
  
  //eruption
  fill (#00CEFF);
  beginShape();
  vertex(278,284);
  vertex(222,292);
  vertex(243,297);
  vertex(207,310);
  vertex(225,314);
  vertex(207,331);
  vertex(237,324);
  vertex(245,334);
  vertex(252,312);
  vertex(272,319);
  vertex(278,284);
  endShape();
  
  //eyes
  fill(0);
  ellipse(170,177,62,62);
  ellipse(420,177,63,63);
  fill(600);
  ellipse(178,164,37,37);
  ellipse(158,188,25,25);
  ellipse(413,163,37,37);
  ellipse(433,187,25,25);
 
 
 // tears
   fill (mouseX,mouseY,300);
   quad (133,211,93, 469, 150, 519, 184, 219);
  quad (423, 218, 448, 523, 508, 461, 463,210);
 // curve (172,211);
  
  
 translate(mouseX, mouseY);
fill(mouseX, mouseY,500,70);
  stroke(0);
  strokeWeight(2);
  ellipse(0,0,50,50);
 
}
}
 
void keyPressed(){
  setup(); 
}

