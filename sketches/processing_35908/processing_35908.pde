
float x, y; //variable declarations
color col;

int value = color(random(256), random(255), random(256), 10);

void setup () //constant elements throughout the program
{
size (400,400);
smooth();
fill (255,0,0);
stroke(255,255,255);
background (0);
noCursor();


//frameRate(5);
  
}


void draw()
{
  //background (255,255,255);
  fill(0,10);
 // rect(0,0,width,height);
  //ellipse(frameCount, width/2, 80, 80);
 // ellipse(mouseX, mouseY, 80, 80);
  //fill(value);
  ellipse(width/2, height/2,mouseX,mouseY);
  ellipse(width/2, height/2+(width/4),mouseX,mouseY);
  ellipse(width/2, height/2-(width/4),mouseX,mouseY);
  ellipse(width/4, height/2,mouseX,mouseY);
  ellipse(width/2+(width/4), height/2,mouseX,mouseY);
  rectMode(CENTER);
  rect(width/2, height/2, mouseX, mouseY);
 // ellipse(width/4, height/4,mouseX,mouseY);
 // ellipse(width, height,mouseX,mouseY);
  //println(frameRate);
}

/*void mousePressed()
{
  stroke(random(256), random(255), random(256));
  
}
*/

void mouseMoved()
{
  stroke (random(256), random(255), random(256));
 /* value = value+5;
  if (value > 255)
  {
    value=0;
  }
  */
}


