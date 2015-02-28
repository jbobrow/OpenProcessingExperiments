
void setup() {
  size(500,350);
  smooth();  
}

void draw() {
  background(#4683a1);
  
  //LINKS
  
  fill(#f7910e);
  stroke(0,0);  
  rect(25, 5, 65, 13);  
  
  //groß
  fill(#07424f,200);
  strokeWeight(10);
  stroke(1); 
  ellipse(120,162,155,155); 
  strokeWeight(1);
  
  //klein
  fill(#141835);
  strokeWeight(20);
  stroke(#d2b889); 
  ellipse(120,162,55,55); 
  strokeWeight(1);
  
  //oben
  fill(#1c0d05,220);
  stroke(0,0); 
  triangle(50,60, 195,60, 120,162); 

  //unten
  fill(#131112,230);
  stroke(0,0);   
  triangle(80,338, 160,338, 120,162);
 
  fill(#5b112b,200);
  beginShape();  
  vertex(118,178);
  vertex(122,178);
  vertex(135,235);
  bezierVertex(115,240, 105,235, 105,235);
  endShape(CLOSE);
  
  //MITTE
  fill(#131112);
  stroke(1);
  
  triangle(220,170, 250,220, 190,220);
  triangle(220,220, 240,270, 200,270);
  triangle(220,270, 237,325, 203,325);
 
 //RECHTS
 
  fill(#ae2210);
  stroke(1); 
  beginShape();
  vertex(285,45);
  vertex(315,60);
  vertex(300,89);
  vertex(270,75);
  endShape(CLOSE);
  
  //groß
  fill(#d83104);
  stroke(1); 
  triangle(375,5, 375,225, 260,225);

  //3eck eins von quadrat
  fill(#9f1e00);
  stroke(0,0); 
  triangle(375,130, 450,130, 450,175);
 
  ////3eck zwei von quadrat
  fill(#021006);
  stroke(0,0); 
  triangle(375,130, 450,175, 375, 175);
 
  //weißer block
  fill(#fcebd0);
  stroke(1); 
  rect(375, 183, 100, 10);
 
  //drei 3ecke
  fill(#f09e0f);
  stroke(0,0); 
  triangle(375,200, 405,200, 375, 215);
 
  fill(#a32001);
  stroke(0,0); 
  triangle(375,215, 400,215, 375, 225);
 
  fill(#070300);
  stroke(0,0); 
  triangle(415,205, 450,205, 435, 235);
 
  //groß unten
  fill(#ee5c09);
  stroke(1); 
  triangle(300,235, 480,235, 388, 328);
 
 
  fill(#ef8b03);
  stroke(1);  
  beginShape();
  vertex(375, 60);
  bezierVertex(400, 60, 415, 60, 435, 30);
  bezierVertex(410, 50, 405, 52, 375, 50);
  endShape();
 
  fill(#cc4e18);
  stroke(1);  
  beginShape();
  vertex(375, 90);
  bezierVertex(440, 110, 480, 55, 465, 20);
  bezierVertex(470, 98, 375, 88, 375, 80);
  endShape();
  
  
  fill(#070802,200);
  stroke(1);  
  beginShape();
  vertex(305, 345);
  bezierVertex(390,200, 470,345, 470,345);
  bezierVertex(380, 250, 305, 345, 305, 345);
  endShape();
  
  
 
  
  
}

