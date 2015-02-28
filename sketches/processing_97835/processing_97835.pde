
//Giovanna Simokado Magalhães
//Trabalho final - Computação 2012.2
//Referências: Recursive Tree by Daniel Shiffman. 
// http://www.egodesign.ca/_files/articles/blocks/10868_by_mies_van_der_rohe_peter_guthrie4.jpg

import processing.pdf.*;
boolean recording;
PGraphicsPDF pdf;

PImage img;
float theta;
int x=2;
int [] arvx = {10, 30, 100, 64, 120,150, 180};
int [] arvy = {165, 130,100,140,170,100,160};
int [] altura= {-100, -80,-68,-90,-110,-55,-110,};
int [][] cor= {
 
   { 31, 147, 65, 
  }
  ,{
    250,97,58, mouseX/100
  }
  ,{
    240,128,58  }
  ,{
    224,153,38
  }
  ,{
    177,224,38
  }
  ,{
    224,166,38
  }
  ,{
    242,222,122
  }
};


void setup() {
  size (200, 200);
  background (255);
  img = loadImage ("mies6.jpg");
//Nome
fill (255);
textSize(8);
text("Giovanna Simokado Magalhães", 120, 195);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
}
void draw() {
  image(img, 0, 0);
  stroke (255, 0, 0);
  noStroke(); // céu e grama
  fill (28, 211, 47, 10+mouseX/5);
  rect( 0, 130, 200, 200);
  fill (108, 210, 255, 10+mouseX/2);
  rect (0, 0, 200, 100);
  rect (0, 100, 30, 30);
  rect (145, 110, 25, 15);
  rect (172, 110, 15, 15);
 
  rect (188, 105, 10, 20);
 fill (255);
textSize(8);
text("Giovanna Simokado Magalhães", 80, 195);
  
 
for(int i = 0; i<7; i++)
{
// árvores
  pushMatrix ();
  stroke(cor[i][0], cor[i][1], cor[i][2]);
  {
    if (mouseX<10)
    stroke (0);}
  float a = (mouseX / (float) width) * 45f;
  theta = radians(a);
  translate(arvx[i], arvy[i]);
  float [] esc = {1.1, .7, .6, 0.8, 0.8,1,1.2};
  scale (esc[i]);
  line(0, 0, 0, altura[i]);
  translate(0, altura[i]);
  branch(10);
  popMatrix ();
}
if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  // When finished drawing, quit and save the file
  if (frameCount == 100) {
    exit();
  }
}
  
void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }  
}

void branch(float h) {
  h *= .8;
  if (h > 1.5) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
 
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


 
