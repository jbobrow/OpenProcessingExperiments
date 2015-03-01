
float speed = 0;
int value = 0;

void setup()
{
  size(500, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  background(360, 0, 100);

  float heartheight = map(sin(speed), -1, 1, -20, 20);
  float heartwidth = map(sin(speed), -1, 1, -200, 200);
  float heartcolor1  = map(cos(speed), -1, 1, 50, 100);

  fill (0);
  text ("Wähle deine Laune:", 190, width/8);
  text ("happy", width/4 -20, height/8 +30);
  text ("so lala", width/2 -20, height/8 +30);
  text ("mies", 3*width/4 -15, height/8 +30);

  translate(width/4, height/4);
  rectMode(CENTER);
  fill(360, 100, 100);
  stroke(360, 100, 0);
  rect(0, 0, 20, 20);  //erstes 4eck ROT
  translate(width/4, 0);
  fill(240, 100, 100);
  rect(0, 0, 20, 20);  //zweites 4eck BLAU
  translate(width/4, 0);
  fill(120, 100, 100);
  rect(0, 0, 20, 20); //drittes 4eck GRÜN


  translate(-width/4, height/3 +heartheight);

  float heartcolor2 = 360;
  float add = 0.0;
  if (mouseX>=115 && mouseX<=135 && mouseY>=(height/4)-10 && mouseY<=(height/4)+10)
  {
    heartcolor2=360;
    if (mousePressed == true)
    {
      add = 0.12;              //Herz wird am schnellsten
    }
  } else if (mouseX>=245 && mouseX<=265 && mouseY>=(height/4)-10 && mouseY<=(height/4)+10)
  {
    heartcolor2=240;
    if (mousePressed == true)
    {
      add = 0.08;            //Herz wird mittelschnell
    }
  } else if (mouseX>=365 && mouseX<=385 && mouseY>=(height/4)-10 && mouseY<=(height/4)+10)
  {
    heartcolor2=120;
    if (mousePressed == true)
    {
      add = 0.02;
    }
  } else { 
    heartcolor1=0;
    add = 0.0;
  }

  stroke(heartcolor2, 100, heartcolor1);
  fill(heartcolor2, 100, heartcolor1);
  ellipse(-25, -50, 50, 40);
  ellipse(25, -50, 50, 40);
  triangle(-50, -48, 50, -48, 0, 10);

  speed += add;
}
 
 void mousePressed()
 {value = 1;}
