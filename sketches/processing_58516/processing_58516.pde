


//Week 5 
//Chapter 8: Functions
//robot now has random eye colour

void setup() {
size(640, 480);
background(222);
smooth();


PImage b;
b=loadImage("Hanami_Wallpaper_by_Zikarra_crop.jpg");
background(b);
ellipseMode(RADIUS);
}

int r = 100;
float x= 100;
float y = 100;
float bodyHeight = 100;
float neckHeight =100;
float radius = 40; //head height/readius
float angle = 0.0;


 void draw() {
  //vibrations! change position by small random amt
  x += random(-4,4);
  y += random (-2,2);
 
 
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
fill(random(255), random(255), random(255));
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
fill(#FFD700);
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



