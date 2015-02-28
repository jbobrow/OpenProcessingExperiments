
void setup()
{
  size( 1250, 700 );
  background( 0, 0, 0);
  smooth();
  frameRate(20);
}
 
void draw()
{
  noStroke();
  fill(0,0,0,120);
  rect(0,0,1250,700);
  stroke(255,255,153);
  strokeWeight(5);
  strokeCap(ROUND);
  line(100,700,100,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(250,700,250,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(400,700,400,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(550,700,550,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(700,700,700,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(850,700,850,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(1000,700,1000,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(1150,700,1150,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));

if(mousePressed)
{
  noStroke();
  fill(255,255,153);
  rect(0,0,1250,700);
  stroke(0,0,0);
  strokeWeight(20);
  strokeCap(ROUND);
  line(100,700,100,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(250,700,250,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(400,700,400,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(550,700,550,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(700,700,700,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(850,700,850,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(1000,700,1000,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
  line(1150,700,1150,random(mouseY-200/(1+mouseX*.02),mouseY+200/(1+mouseX*.02)));
}
}
