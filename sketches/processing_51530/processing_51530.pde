
//Mitsuko Verdery 
//target drawing program
//Copyright 2012

 float x;
 float y;
 float o;
 float wdth;
 float hght;

void setup()
{
size ( 400, 400);
background(255, 175, 195);
noStroke();
smooth();

o = 15;
x = 200;
y = 250;
wdth = 300;
hght = 300;
}

void draw()
{
fill(#FF90AC, 10);
rect(0, 0, width, height);
drawheart(mouseX, mouseY, wdth, hght);

}

//void drawTarget( int x, int y, int d)
void drawheart(float x, float y, float wd, float ht)
{
  
  fill(255, 62, 110);
  
  triangle(x, y, x - .147*wd, y - .175*ht, x + .147*wd, y - .175*ht);
  ellipse(x - .07*wd, y - .2*ht, .154*wd, .18*ht);
  ellipse(x + .07*wd, y - .2*ht, .154*wd, .18*ht);

}


void mouseClicked()

{
  float s;
  drawheart(100,100,40,40);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);

}

void keyPressed()

{

if ( keyCode == UP)

{
hght = hght + 5;

}
 if ( keyCode == DOWN)
{
hght = hght - 5;
}

if (keyCode == LEFT)
{
wdth = wdth - 5;

}

if ( keyCode == RIGHT)

{
wdth = wdth + 5;
}

}




                
                
