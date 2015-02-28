
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

PImage hand;
PImage cure;


PShape vec;
//PImage vec2;


PFont font;
PFont font2;


void setup() {

size(640, 480);
smooth();
cursor(CROSS);
noLoop();
frameRate(70);


//vec=loadShape("smudge.svg");



img1=loadImage("image1.jpg");
img2=loadImage("image2.jpg");
img3=loadImage("image3.jpg");
img4=loadImage("image4.jpg");
img5=loadImage("image5.jpg");
img6=loadImage("image6.jpg");

hand=loadImage("hand.png");
cure=loadImage("cure.png");

//vec2=loadImage("vector2.svg");

font=loadFont("font.vlw");
font2=loadFont("font2.vlw");


textFont(font);

}


void draw() {
  
  


pushMatrix();
float rrr=random(-180, 360);
float rrrr=random(255);
float rrrr1=random(255);
float rrrr2=random(255);
float rrrr3=random(50, 100);
float sca=random(.2, 1.5);

rotate(rrr);
tint(rrrr, rrrr1, rrrr2, rrrr3);
scale(sca);
image(hand, mouseX-200, mouseY-200, 500, 500);
  
popMatrix();


pushMatrix();
float xrrr=random(-180, 360);
float xrrrr=random(255);
float xrrrr1=random(255);
float xrrrr2=random(255);
float xrrrr3=random(50, 100);
float xsca=random(.2, 2);

rotate(xrrr);
tint(xrrrr, xrrrr1, xrrrr2, xrrrr3);
scale(xsca);
image(cure, mouseX-200, mouseY-200, 500, 500);
  
popMatrix();


  
  
float r =random(10, 13);

  
 float x1= random(3*PI);
  float x2= random(3*PI);
   float x3= random(3*PI);
    float x4= random(3*PI);
     float x5= random(3*PI);


 float y1= random(1, 2);
  float y2= random(1, 2);
   float y3= random(1, 2);
    float y4= random(1, 2);
     float y5= random(1, 2);
     
     
     
 float c1= random(200);
  float c2= random(200);
   float c3= random(200);
    float c4= random(200);
     float c5= random(200);
     
     
 float cc1= random(200);
  float cc2= random(200);
   float cc3= random(200);
    float cc4= random(200);
     float cc5= random(200);


 float t= random(255);
 float t1= random(255);
 float t2= random(255);
 float t3= random(50, 130);
 
 tint(t, t1, t2, t3);
 
 
  pushMatrix();
  
 float q= random(1, 100);
 float a= random(-60, 0);
 float a2= random(-60, 0);
 
  scale(q);
  image(img6, a, a2);
  //filter(BLUR);
  popMatrix();
  
  
  pushMatrix();
  rotate(x1);
  scale(y1);
  translate(c1, cc1);
  image(img1, r, r);
  popMatrix();
  
  
  pushMatrix();
  rotate(x2);
  scale(y1);
  translate(c2, cc2);
  image(img2, r, r);
  popMatrix();
  
  pushMatrix();
  rotate(x3);
  scale(y1);
  translate(c3, cc3);
  image(img3, r, r);
  popMatrix();
  
  pushMatrix();
  rotate(x4);
  scale(y1);
  translate(c4, cc4);
  image(img4, r, r);
  popMatrix();
  
  pushMatrix();
  rotate(x5);
  scale(y1);
  translate(c5, cc5);
  image(img5, r, r);
  popMatrix();

  
  
  
  
  textFont(font2);
  
  pushMatrix();
  float l= random(360);
  
  fill(255);
  
  rotate(l);
  text("4:13 Dream", 200, 200);
  popMatrix();
  
  
  
  textFont(font);
  
  
  pushMatrix();
  rotate(-l);
  fill(255);
  text("The Cure", 150, 150);
  popMatrix();
  
  
  
  
}


void mousePressed() {  
  redraw();  
  
}

