
/**************************************************
 Spewing Cursor Test v. 2
 Kyle Kuepker
 July 21, 2010

 The idea is to have the mouse move a cursor and have 
 it spew pixels in different directions like a fountain

**************************************************/
int array_max = 60;
int firework_count = 0;
int spew_length_max = 200;
int spew_length_min = 50;
int fade_speed = 7;
float angle;
int MouseX;
int MouseY;
int spew_length;
PImage reticle;
Firework f_array[] = new Firework[array_max];

void setup()
{
  size(400, 400);
  background(25);
  reticle = createImage(15, 15, ALPHA);
  formReticleSquare();  
  noCursor();
  smooth();
  stroke(255, 150);
  strokeWeight(3);
  strokeCap(ROUND);
  fill(255, 150);
  for(int i = 0; i < array_max; i++)
  {
    f_array[i] = new Firework(0,0,0,0);
  }
  
}

void draw()
{
  background(25);
  image(reticle, mouseX-8, mouseY-8);
  
  if(mousePressed)
  {
    spew_length = int(random(spew_length_min, spew_length_max));
    angle = random(0, 2*PI);
    f_array[firework_count] = new Firework(mouseX, mouseY, spew_length, angle);
    f_array[firework_count].f_draw();
    firework_count++;
    println(firework_count);
    if(firework_count > 59)
    {
      firework_count = 0;
      println("RESET");
    }
  }
  
  for(int i = 0; i < f_array.length; i++)
  {
    f_array[i].update();
  }
}

