
PImage img;
PImage img2;
float x=40;
float y=40;
float body=100;
float speed = 3;
int diameter = 20;
int direction=1;

//---------------------------------------------------
void setup() {
size(1300,800);
smooth();
img = loadImage("city.jpg");
img2 = loadImage("city-front.png");
}

//------------------------------------------------------
void draw() {

  image(img,0,0);  /*background*/
  pushMatrix(); 
  translate(0, mouseY);
  
  x+=speed;
  if (x>width+body) {
    x=-body;
  }
  
  
  
  x += random(-speed, speed);
  y += random(-speed, speed);
  
//  if ((mouseX==x-1) || (mouseX==x+1)) {
//  x+=0.0001;
//  }
  
//x += mouseX/30*direction;  
//if ( (x>width) || (x<0) ) {
//direction =-direction;
//}
 
 
//  --------robot--------------    //
fill(230);
rectMode(CENTER);
rect(x,y,body,200);
fill(255, 0,0, 180);
noStroke();
//bottom 
triangle(x,y-1,x-50,y+70,x+50,y+70);
triangle(x,y+100,x-50,y+70,x+50,y+70);
//top
triangle(x,y+1,x+50,y-70,x-50,y-70);
triangle(x,y-100,x+50,y-70,x-50,y-70);
fill(250);
stroke(0);
//head
ellipse(x,y-120,80,80);
strokeWeight(3);
ellipse(x-20,y-120,10,10);
ellipse(x+20,y-120,10,10);
strokeWeight(0);
//nose
noStroke();
fill(255, 0, 10);
beginShape(); 
vertex(x,y-185); 
vertex(x-2,y-105);
vertex(x-5,y-95);
vertex(x-3,y-90);
vertex(x,y-93);
vertex(x+3,y-90);
vertex(x+5,y-95);
vertex(x+2,y-105);
endShape(CLOSE);
//right arm
triangle(x-50,y-90,x-50,y-40,x-150,y-120);
//left arm
triangle(x+50,y-90,x+50,y-40,x+150,y-120);
//right leg
triangle(x-50,y+100, x-100,y+240, x-30,y+100);
//left leg
triangle(x+50,y+100, x+100,y+240, x+30,y+100);
noStroke();
fill(190,250,0);
//lazzzer
triangle(mouseX, mouseY,x-23,y-120,x-18,y-115);
triangle(mouseX, mouseY,x+23,y-120,x+18,y-115);
ellipse(x-20,y-120,10,10);
ellipse(x+20,y-120,10,10);


popMatrix();
image(img2,0,210); /*city foreground*/
}

