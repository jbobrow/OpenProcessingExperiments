
/*****************************************
 * Assignment 02
 * Name:         Jiayi Wang
 * E-mail:       jwang04@brynmawr,edu
 * Course:       CS 110 - Section 02
 * Submitted:    2012-2-7
 * 
 * My sketch is about the scene on the grassland. 
 When clicked on the sky 3 kinds of birds would 
 show randomly.When clicked on the ground, 4 kinds
 of animals would show up ramdomly. The sun is drawn 
 with iteration. The air ballons which show randomly
 in a set of 4 also used iteration.
 ***********************************************/
 
int s=600000;//scale for objects on the ground
int r=0;//the radius of the sun

PImage bg;//background
PImage bird;
PImage ground;
PImage airballon;

void setup() {
  size(800, 600);
  bg = loadImage("background.jpg");
  image(bg, 0, 0, width, height);
  //sun
  while (r<100) {
    noStroke();
    fill(200, 0, 0, 30);
    ellipse(width*2/3, height*1/3, 2*r, 2*r);
    r=r+5;
  }
  float X=random(width/10, width*8/10);//where the airballon would be 
  float Y=random(height/20, height/2);
  float wX=width*0.1; //width of the picture of airballon
  float wY=width*3/35;//height of the picture of airballon
  //random distance between ballons
  float m=random(80,120);
  float n=random(25,40);
  //a set of 4 ballons
  for (int i=1; i<5;i++) {
    airballon=loadImage("airballon.png");
    image(airballon, X+m*i, Y+n*i, wX/i, wY/i);
  }
}


void draw() {
}


void mousePressed() {
  imageMode(CENTER);
  //draw objects on ground randomly
  if (mouseY>height*2/3+40) {
    float a=random(1, 5);
    int groundNumber=int(a);
    ground = loadImage("ground" + groundNumber +".png");//random picture
    image(ground, mouseX, mouseY, mouseY*mouseY*mouseY/s, mouseY*mouseY*mouseY/s);
  }
  //draw objects in the sky randomly


  else {
    float b=random(1, 4);
    int birdNumber=int(b);
    bird=loadImage("bird"+birdNumber+".png");
    image(bird, mouseX, mouseY, 6000/mouseY, 6000/mouseY);
  }
}


