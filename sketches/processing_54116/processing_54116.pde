
PShape head;
PShape body;
PImage headd;
PShape feet;
PShape handz;
PShape belly;

float spacer;

void setup() {
  size(800, 400);

  head=loadShape("head.svg");
  headd=loadImage("head.png");
  body=loadShape("body.svg");
  feet=loadShape("feet.svg");
  handz=loadShape("hand.svg");
  belly=loadShape("belly.svg");
  spacer= width/3.0;
  
  smooth();
  
  noLoop();
  
}

void draw() {
  background(255);
  
  for(float i=1; i<width; i++)
  {
  float eye=random(5,30);
  float heightt=random(170,280);
  float ant=random(6,20);
  float yy=heightt+sin(frameCount/20.0)*20;
    
  float fat=random(800);
  float cr=random(210,255);
 
  robot(yy,i*spacer-120,fat,eye, color(255,cr,cr),ant);
  }
  

  
}

void robot(float y,float x, float w, float e, color c, float a  ) {
  shapeMode(CENTER);
  imageMode(CENTER);
  strokeWeight(2);
 float d=400-x;
 tint(c);
 //legz
  shape(feet, x, 200);
  line((369-(w*0.06))-d, 40+y, x-28, 357);
  line((430+(w*0.06))-d, 40+y, x+28, 357);
  pushMatrix();
  translate(x, y); 
  //antennaez 
  fill(255, 240, 0);
  line(0, 0, 0, -160);
  ellipse(0, -160, a, a);
  //boday
  shape(body, 0, 0,600+w,400);
  image(headd, 0, -88, 75, 90);
  //buttons

    
  ellipse(-25, -25, 8, 8);
  ellipse(-10, -25, 8, 8);
  ellipse(5, -25, 8, 8);
  ellipse(20, -25, 8, 8);
  //eyes
  fill(255);
  ellipse(-25, -93, e, e);
  ellipse(15, -93, e, e);
  //armsz
  curve(-10-(w*0.06), -10, -35-(w*0.06), -42, -60-(w*0.06), 45, -15-(w*0.06), 20);
  curve(10, -10+(w*0.06), 35+(w*0.06), -42, 60+(w*0.06), 45, 15+(w*0.06), 20);
  shape(handz, 61+(w*0.06), 0);
  shape(handz, -60-(w*0.06), 0);
  //belleh
  shape(belly,0,10);

  popMatrix();
}

void mousePressed()
{
   redraw();
}


