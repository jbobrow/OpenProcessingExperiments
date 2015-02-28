
float angle = 0.0;

PImage concert;
PImage balloon;

void setup() 
{
  size(1000, 800);
  smooth();

  concert = loadImage("concert.jpg");
  balloon = loadImage("balloon.png");

  imageMode(CENTER);
}


void draw() {
  

  image(concert, width/2, height/2, 1000, 800);

  translate(width/2, height/2);
  float x = cos(angle)*300;
  float y = sin(angle*4) *100;
  float j = cos(angle)*200;
  float i = sin(angle)*400;

  image(balloon, j, i, 100, 100);
  
  image(balloon, x, y*-1, 70,70);
  
  image(balloon, -(x+100),y+100,200,200);
  
  image(balloon, -(x*-1), y, 150,150);
  
  angle += 0.2;
}


 /* xpos = xpos + horizontal;


  if (xpos>=width-50)
  { 
    horizontal = horizontal*-1;
  }

  if (xpos<=50)
  {
    horizontal = horizontal*-1;
  }

  ypos = ypos + vertical;
  if (ypos>=height-50)
  {
    vertical = vertical *-1;
  }

  if (ypos<=)
  {
    vertical=vertical*-1;
  }
}
*/


