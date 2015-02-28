
float deg = 45.0;
float rad = radians(deg);
float Rot = 0;
float xpos= 0;
float ypos= 0;
float RotRev = 0;

void setup () {
 size(500,500);
smooth();
}

void draw(){
  background(0);
  square1();
  square2();
  square3();
  square4();
  square5();
  square6();
  square7();
  square8();
  square9();
  square10();
   
}

void square1(){
  rad = radians(Rot);
  xpos = xpos+.5;
  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad);
 fill(255);
rect(25,25,475,475);
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();

}
void square2(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  RotRev = RotRev-1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+25);
 fill(0);
rect(25,25,425,450); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square3(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+50);
 fill(255);
rect(25,25,350,350); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square4(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+75);
 fill(0);
rect(25,25,300,300); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square5(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+100);
 fill(255);
rect(25,25,250,250); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square6(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+125);
 fill(0);
rect(25,25,200,200); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square7(){
//   rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+150);
 fill(255);
rect(25,25,150,150); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square8(){
//   rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+175);
 fill(0);
rect(25,25,100,100); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square9(){
//  rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+200);
 fill(255);
rect(25,25,50,50); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}

void square10(){
//   rad = radians(Rot);
//  xpos = xpos+.5;
//  Rot = Rot+1.0;
  rectMode(CENTER);
  noStroke();
  pushMatrix();
  translate(250,250);
  rotate(rad+225);
 fill(0);
rect(25,25,25,25); 
popMatrix();
pushMatrix();
translate(106,35);
rotate(rad);
popMatrix();
}



