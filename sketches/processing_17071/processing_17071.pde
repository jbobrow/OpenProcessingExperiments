
PFont font;

float g = 100;
float y = 100;
float h = 100;

float speedG = 4;
float speedY = 4;
float speedH = 4;
float grav = 0.20;

void setup(){
size(800,600);
smooth();
font = loadFont ("Harabara_Bold-100.vlw");
}

void draw(){
background(0);
//fill(0,100);
//rect(0,0,800,600);
noStroke();


if (mouseX >= 150 && mouseX <= 250 && mouseY >= y &&  mouseY <= y+100){
  fill(255,0,0);}
else
  fill(150);{
rect(150,y,100,100);
}
 
if (mouseX >= 350 && mouseX <= 450 && mouseY >= g &&  mouseY <= g+100){
  fill(0,0,255);}
else
  fill(50);{
rect(350,g,100,100);
}



if (mouseX >= 550 && mouseX <= 650 && mouseY >= h &&  mouseY <= h+100){
  fill(0,255,0);}
else
fill(255);{
rect(550,h,100,100);
}



textFont(font);    
textAlign(CENTER);
if (mouseX >= 150 && mouseX <= 250 && mouseY >= y &&  mouseY <= y+100){
  fill(255,0,0);}
else
  fill(0,0);{
text("RED",200,y-20);
  }
  
if (mouseX >= 350 && mouseX <= 450 && mouseY >= g &&  mouseY <= g+100){
  fill(0,0,255);}
else
  fill(0,0);{
text("BLUE",400,g-20);
  }
  
  
  if (mouseX >= 550 && mouseX <= 650 && mouseY >= h &&  mouseY <= h+100){
  fill(0,255,0);}
else
  fill(0,0);{
text("GREEN",600,h-20);
}


y= y + speedY;
speedY = speedY + grav;

if (y > height-100) {
  speedY = speedY * -0.95;
}


g= g + speedG;
speedG = speedG + grav;

if (g > height-100) {
  speedG = speedG * -0.94;
}

h= h + speedH;
speedH = speedH + grav;

if (h > height-100) {
  speedH = speedH * -0.96;
}

}

