
int status = 0;

void setup()
{
  smooth();
  size(500, 500);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  println(mouseX, mouseY);

  rectMode(CENTER);
  fill(255);
  stroke(0);
  rect(0, 0, 400, 400);
  noStroke();
  fill(0);
  rect(0, 0, 300, 300);

  fill( 0);
  noStroke();
  ellipse(175, 0, 20, 20);
  noStroke();
  fill(0);
  ellipse(-175, 0, 20, 20);

  fill(0);
  PFont myFont;
  myFont = createFont("Verdana", 18);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text("ON", -175, -30);
  fill(0);
  text("OFF", 175, -30);



  if (mouseX>=64 && mouseX<=84 && mouseY>=240 && mouseY<=260)
  {
    if (mousePressed==true)
    {
    status=1;
    }
  }
  
  if (mouseX>=415 && mouseX<=435 && mouseY>=240 && mouseY<=260)
  {
    if (mousePressed==true)
    {
    status=0;
    }
  }

  if (status==1)
  { 
    for (int i=0; i<1; i+=10)
    {

      pushMatrix();  
      rotate(radians(i));
      fill(255, 106, 106);
      triangle(-150, 150, 150, 150, 0, -140+random(200));
      popMatrix();

      pushMatrix();
      rotate(radians(i));
      fill(255, 130, 71);
      triangle(-100, 150, 100, 150, 0, -60+random(200));
      popMatrix();
    }
  }
}

