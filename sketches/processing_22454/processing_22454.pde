
float angle = sin(1.2);
float f= 0;
PImage back;
PImage eye;
PImage circle;
PImage ear;
PImage blob;
int time1 = 50000;
int time2 = 70000;
int currenttime;


void setup(){
  size(900,200);
  smooth();
  eye = loadImage("eye.png");
  circle = loadImage("shape2.png");
  back = loadImage("back.jpg");
  ear = loadImage("ear.png");
  blob = loadImage("blob.png");
 
}

void draw(){
  frameRate(10);
  image(back,0,0);
  tree(140,50);
  tree(250,90);
  tree(370,25);
  tree(480,65);
  tree(600,100);
  tree(710,40);
  tree(850,70);
  tree(950,120);  
}

void tree(int x, int y){
  pushMatrix();
  translate(x,y);
  stroke(118,55,12);
  strokeWeight(15);
  line(-70,30,-65,100);
  stroke(124,37,7);
  line(-70,30,-75,100);
  noStroke();
  fill(124,37,7);
  triangle(-95,20,-45,20,-70,40);
  fill(7,64,52,random(175,200));
  ellipse(-80,0,160,50);
  image(ear,-103,50);
  translate(-50,0);
  rotate(angle);
  angle+=0.01;
  image(blob,0,0);
  popMatrix();
  
}
  

