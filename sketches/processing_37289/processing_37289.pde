
void setup()
{
size(500,500);
smooth();
 background(255,255,255);
}

void draw ()
{
  

  stroke(random(255),random(255),random(255));
  line(pmouseX,pmouseY,mouseX,mouseY);
  line(pmouseX+5,pmouseY+5,mouseX,mouseY);
  line(pmouseX+10,pmouseY+10,mouseX,mouseY);
  line(pmouseX+15,pmouseY+15,mouseX,mouseY);

  if (key=='x')
  {
     background(255,255,255);
  }
  if (key=='p')
  {
  stroke(random(255),random(255),random(255));
  line(pmouseX,pmouseY,mouseX,mouseY);
  line(pmouseX+5,pmouseY+5,mouseX,mouseY);
  line(pmouseX+10,pmouseY+10,mouseX,mouseY);
  line(pmouseX+15,pmouseY+15,mouseX,mouseY);
  }
  fill(15,21,41);
  text("Press 'x' to clear the screen. Press 'p' to draw. Press 'c' for another option. .",20,450);
  text("Press 'a' to create dots. Press 'spacebar' to pause drawing.",20,450);
 if (key=='c')
  {
  stroke(random(255),random(255),random(255));
  line(pmouseX,pmouseY,mouseX,mouseY);
  line(pmouseX+random(25,255),pmouseY+random(25,255),mouseX+random(25,255),mouseY+random(25,255));
  line(pmouseX+random(25,255),pmouseY+random(25,255),mouseX+random(25,255),mouseY+random(25,255));
  line(pmouseX+random(25,255),pmouseY+random(25,255),mouseX+random(25,255),mouseY+random(25,255));
  }
  if (key=='a')
  {
   ellipse(mouseX+random(25,255),mouseY+random(25,255),20,20);
  }
}


