
PImage landscape;
PFont font;
float x= 345;
float y= 100;
float bodyHeight=500;
float neckHeight=200;
float ny= bodyHeight-neckHeight-y;
float angle= 0.0;

void setup() {
size(720,480);
landscape= loadImage("ureh.jpg");
font = loadFont("Serif-48.vlw");
textFont(font);
 
smooth();
}
 
void draw(){
  image(landscape,0,0);
drawRobot(200,100);
drawRobot(400,100);
drawRobot (600,100);


}
 
void drawRobot(int x, int y) {

 



size(720, 480);
smooth();

ellipseMode(RADIUS);


  x+= random(-4,4);
  y+= random(-1,1);

  neckHeight= 80+ sin(angle)*30;
  angle =+ 0.05;


//neck
fill(100);
rect(x, bodyHeight-400, 30, ny);
 
//body
fill(100);
 
rect(x-60, y-bodyHeight+600, 150, bodyHeight-300);
fill(255);
rect(x-50, y-bodyHeight+610, 130, bodyHeight-320);

 
fill(50);
rect(x+15, y-bodyHeight+650,50,100);
 
fill(255,0,0,100);
 
rect(x-25, y-bodyHeight+700, 50, 10);

rect(x-25, y-bodyHeight+700,50,10);

rect(x-25, y-bodyHeight+700,50,10);
 
 
 
//head
fill(100);
ellipse(x+15, y, 50, 50);
 
fill(255);
ellipse(x+15, y, 40,40);
 
fill(0);
arc(x+15, y, 40,40, radians(0), radians(180));
 
//eyes
fill(0);
ellipse(x-45, y-50, 10, 10);
ellipse(x+75, y-50, 10, 10);
fill(255);
ellipse(x-49, y-55, 5, 5);
ellipse(x+71, y-55, 5, 5);
//wheels
fill(0);
ellipse(x-45, y-bodyHeight+800, 20, 20);
ellipse(x+75, y-bodyHeight+800, 20, 20);
fill(205);
ellipse(x-45, y-bodyHeight+800, 10, 10);
ellipse(x+75, y-bodyHeight+800, 10, 10);

 text("Revenge of the Robot...",50,460);

}


