
PShape s;
int x, y;
int xspeed, yspeed;
float angle;

void setup()
{
size (600,600);
smooth();

s = loadShape ("final_logo.svg");

x=width/2;
y=width/2;

}

void draw()
{
   background(255);
  angle += 0.05;
  
  float theta = 3 + (3 * sin(angle)); //DIFFERENCE TO A SMOOTHER OSCILATION
  //THE 3+ IS TO MOVE THE ENTIRE GRAPH UP TO POSITIVE VALUES
  
  pushMatrix();
  translate(width/2, height/2);
  scale(theta);
  shape(s, -50, -50, 100, 100);
  popMatrix();


}


