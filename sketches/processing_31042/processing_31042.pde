
PImage bg;

void setup(){
background(0);
  size(800, 535);
fill(255,255,255,80);
noStroke();
bg=loadImage("DeathBat.jpg");
image(bg,0,0,800,535);
}

void draw() 
{
//image(bg,0,0,800,535);
ellipse(mouseX,mouseY,10,10);
}



