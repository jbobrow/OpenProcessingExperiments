
color c1, c2, c3;
float a1, a2, a3= 9;
float scaler = 5;
float offset = 80;

float ah1;
float hh=250;

void setup () {
  size(500, 500);
  smooth();
  rectMode(CENTER);
  //noLoop();
  c1= color(20, 166, 193);
  c2=color(108, 9, 116);
  c3=color(152, 81, 5);

  background (155);
}

void draw () {
  //robo(width/2, height/2);
  a1 = a1 + 0.04; //angle controls speed
  a2= a2 +0.2;
  a3= a3 + 577;

  float d1 = offset + sin(a1) * scaler;
  float d2 = offset + sin(a2) * scaler;
  float d3 = offset + sin(a3) * scaler;
  
  float h1 = random(hh* .03, hh*.15);
   float h2 = random(hh* .09, hh*.45);
   float h3 = random(hh* -.01, hh*.95);
   
   float ah1= random(280,250);
  
  robo(-150, 0, d1, c1); // 1st
  robo(0,0, d2, c2);//2nd
  robo(150, 0, d3, c3);//3rd
  
  
}


void robo (float x, float ah, float d, color c) {
  pushMatrix();
  translate(x, ah);
  fill (c);
  strokeWeight(5);
  rect(hh, hh, d, d);
  fill(255);
  ellipse (hh, hh, d, 45);
  fill(0);
  ellipse (hh, hh, 15, 15);
  line (hh, 210, hh, 160); // antenna
  triangle (hh, 120, 220, 160, 280, 160); 
  line(210, hh, 190, 280);// arm
  line (290, hh, 310, 280);//arm
  fill(255);
  rect(280, 305, 7, 25);
  rect(220, 305, 7, 25);
  popMatrix();
}



void mousePressed () {
  redraw();
}


