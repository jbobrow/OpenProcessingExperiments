
int angle = 0;
void setup(){
  size(640, 480);
  background(255);
  smooth();
  noStroke();
}

void draw(){
  background(255);
  float h = hour();
  float m = minute();
  float s = second();
  float angle = map(s, 0, 59, 180, 270); 
  float j = map(s, 0, 59, 0, -90);
  float l = map(s, 0, 59, -45, -90);
  float k = map(s, 0, 59, 225, 270);
  float p = map(s, 0, 59, 247.5, 270);
  float o = map(s, 0, 59, -67.5, -90);
  float q = map(s, 0, 59, 202.5, 270); 
  float u = map(s, 0, 59, -22.5, -90);
  if (h > 12) {
   h -= 12;
  }
 
  pushMatrix();
  translate(250, 304);
  rotate(radians(angle));
  fill(130,230,230);
  rect(0,0,250,10);
  fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
  
  pushMatrix();
  translate(300, 272);
  rotate(radians(p));
  fill(130,230,230);
  rect(0,0,250,10);
  fill(200);
  rect(0,0,(4*m),10);
  popMatrix();

  
  pushMatrix();
  translate(265, 290);
  rotate(radians(q));
  fill(130,230,230);
  rect(0,0,250,10);
  fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
  
    pushMatrix();
  translate(340, 272);
  rotate(radians(o));
  fill(130,230,230);
  rect(0,0,250,10);
  fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
 
    pushMatrix();
  translate(375, 290);
  rotate(radians(u));
  fill(130,230,230);
  rect(0,0,250,10);
  fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
   
  pushMatrix();
  translate(390,300);
  rotate(radians(j));
  fill(130,230,230);
  rect(0,0,250,10);
   fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
  
  pushMatrix();
  translate(280, 280);
  rotate(radians(k));
  fill(130,230,230);
  rect(0,0,250,10);
   fill(200);
  rect(0,0,(4*m),10);
  popMatrix();

  pushMatrix();
  translate(360, 280);
  rotate(radians(l));
  fill(130,230,230);
  rect(0,0,250,10);
   fill(200);
  rect(0,0,(4*m),10);
  popMatrix();
  
  pushMatrix();
  fill(130,230,230);
  rect(320,270,10,-250);
  fill(200);
  rect(320,270,10,-(4*m));
  popMatrix();

 String time = nf(int(h), 2);
 fill(200);
 PFont font;
 font = loadFont("Digital-7-50.vlw");
 textFont(font);
 textSize(70);
 fill(0);
 text(time,290,350);
}


