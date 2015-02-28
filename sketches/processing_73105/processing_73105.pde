
/****************************************
*Assignment #3
*Name: Erin Penney
*Email: epenney@brynmawr.edu
*Course: CS 110 - Section #001
*Submitted: 10/2/12
*This is a sketch of Loki, brother of Thor. Loki is half Frost Giant, so he transforms into a blue Frost Giant whenever the Hammer of Thor is hovered over him. I made this happen using int variables to represent the reference points within the circle that would be in relation to the mouse (or hammer) location. The objects (Loki and the hammer) were constructed using the object function. Loki is placed randomly every time the program starts. To make it flash red, keep pressing the mouse. 
*
****************************************/

//define variables
int circlex;
int circley;
int circlewidth;
int circleheight;
int dl;

//setup sketch
void setup() {
  size(500,500);
  smooth();
  circlex= (int) random(100,250);
  circley= (int) random (100,250);
  circlewidth= (int) 250;
  circleheight= (int) 250;
  dl= (int) 250;
}

//state objects
void draw() {
  background(36,196,79);
  drawLoki(circlex,circley,dl,dl);
  drawHammer(250,250,90,90);
}


//draw Loki
void drawLoki(int x, int y, int circlewidth, int circleheight) {
  strokeWeight(10);
  int distance= (int) dist(x, y, mouseX, mouseY);
  if (distance<circlewidth/2) {
    println("Frost Giant");
  }
  else {
    println("Asgardian");
  }
  //draw body
  rectMode(CENTER);
  fill(0,100,0);
  rect(x+40,y+255,45,45);
  rect(x-40,y+255,45,45);
  fill(0);
  rect(x,y+155,150,150);
  fill(distance * 0.7, distance * 0.7, 255);
  ellipse(x,y,circlewidth,circlewidth);
  fill(0);
  ellipse(x-40,y-25,circlewidth/10,circlewidth/10);
  ellipse(x+40,y-25,circlewidth/10,circlewidth/10);
  line(x+40,y+50,x-40,y+50);
  fill(0,100,0);
  ellipse(x-40,y+140,30,30);
  ellipse(x+40,y+140,30,30);
  ellipse(x+40,y+175,30,30);
  ellipse(x-40,y+175,30,30);
  }

//draw hammer
void drawHammer(float x, float y, float objectWidth, float objectHeight) {
  fill(100);
  rectMode(CORNER);
  rect(mouseX+35, mouseY+55, objectWidth-70,objectHeight);
  rect(mouseX,mouseY,objectWidth,objectHeight);  
}

//create red flash
void mousePressed() {
  background(255,0,0);
}
