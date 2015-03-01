

void setup()
{
  size(700,700);
  background(6,0,6);
  fill(255);
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

void draw(){
int circleSize = 50;
int circleXpos = mouseX;
int circleYpos = mouseY;
fill(mouseX,mouseY,random(0,255));
ellipse(350, 350, 350, 350);
rect(20,20,80,20);
text("ezequiel!",20,20);
  println("Flatline!");
}
