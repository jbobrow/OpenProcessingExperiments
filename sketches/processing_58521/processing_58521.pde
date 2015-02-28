
//Chere De Koh
//*Chapter 8 : Functions
//i.e vibrating robot, run four times
//robot now has random coloured bow tie

float x= 100;
float y = 100;
float bodyHeight = 100;
float neckHeight =100;
float radius = 40; //head height/readius
float angle = 0.0;
int r = 100;

void setup() {
  size(760, 780);
  smooth();
  ellipseMode(RADIUS);
  background(204);
  PImage b;
b=loadImage("Hanami_Wallpaper_by_Zikarra_760.jpg");
background(b);

}

void draw() {
   
  //background(landscape);
   
  myRobot(1, 15);
  myRobot(135, 135);
  myRobot(246, 35);
  myRobot(359, 435);
}
 
 
void myRobot(int x, int y){
float ny = y - bodyHeight - neckHeight - radius;
neckHeight = 50 + sin(angle) * 50;
  angle += 0.02;
   
  x += random(-4, 4);
  y += random(-2, 2);
 

 // Change height of neck 
 neckHeight = 10 + sin(angle) * 30; 
 angle += 0.05;
//Neck
noStroke();
fill(#000000);
rect(x+250,y+120,15,110);
 
 
//Head
fill(#000000);
smooth();
ellipse(x+250,y+80,40,40);
quad(x+210,y+80,x+290,y+80,x+294,y+135,x+208,y+165);
 
//base
fill(#000000);
ellipse(x+260,y+310,80,20);
//HELPwanna tilt this 5.81
 
//torso
fill(#000000);
triangle(x+220,y+210,x+260,y+310,x+288,y+180);
 
//facial features!!
 
//eyes
fill(#FFFFFF);
ellipse(x+210,y+82,12,12);
 
fill(#FFFFFF);
ellipse(x+260,y+76,12,12);
 
//nose
fill(#FFFFFF);
triangle(x+235,y+98,x+235,y+118,x+200,y+118);
 
//mouth smile
fill(#FFFFFF);
triangle(x+215, y+130, x+215, y+155, x+254, y+122);
 
//bowtie
fill(random(255), random(255), random(255));
quad(x+240,y+180,x+240,y+210,x+270,y+185,x+270,y+210);
 
//buttons
fill(#FFFFFF);
ellipse(x+240, y+220, 5, 5);
 
//eyebrow
fill(#FFFFFF);
strokeWeight(5);
strokeJoin(ROUND);
arc(x+260, y+62, 14,14, 3.4, 5.8);
    }


