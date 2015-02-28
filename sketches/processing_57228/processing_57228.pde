
int x=120;
int y=60;

PImage img;

void setup(){
  size(480,230);
  smooth();
  strokeWeight(1);
  img=loadImage("lunar.jpg");
}

void draw(){
  image(img,0,0);
  int targetX=mouseX;
  int targetY=mouseY; 
  myDrawRobot(100,300);
  myDrawRobot(200,350);
  myDrawRobot(300,400);
  myDrawRobot(400,350);
}


void myDrawRobot(int x,int y){
  float easing= 0.024;
  x += random(-5,5);
  y += random(-3,3);
  if (mousePressed){
  y=150;
} 
  else{
  y=100;
}


//tail
fill(120,60,3);
ellipse(x+40,y+80,40,40);

//hand
fill(11,116,46);
ellipse(x+10,y+50,10,10);
ellipse(x+70,y+50,10,10);
fill(98,86,75);
rect(x+10,y+45,10,10);
rect(x+60,y+45,10,10);

//body
fill(120,60,3);
rect(x+20,y+40,40,40);
fill(175,110,50);
rect(x+20,y+70,40,10);

//antennae
fill(142,112,84);
rect(x+15,y-10,5,10);
rect(x+60,y-10,5,10);

//head
fill(98,86,75);
ellipse(x,y+20,15,15);
ellipse(x+80,y+20,15,15);
fill(175,110,50);
rect(x,y,80,40);

//eye
fill(224,226,225);
ellipse(x+20,y+20,15,15);
ellipse(x+60,y+20,10,10);

}


