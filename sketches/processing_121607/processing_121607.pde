
class planet
{
  color c;
  float xpos;
  float ypos=0;
  float tyngde;
  float v=0;

planet()
{
  c= color(0);
}

void display()
{
  fill(0);
  ellipse(xpos,ypos,30,30);
}

void drive(float g, int x)
{
   tyngde=g;
  xpos=x;
  ypos=ypos+v;
  v=v+tyngde;
}
}
planet solen;
planet merkur;
planet venus;
planet jorden;
planet manen;
planet mars;
planet jupiter;
planet saturn;
planet uranus;
planet neptun;
planet pluto;

void setup()
{
  size(500,500);
  frameRate(60);
  solen= new planet();
  merkur= new planet();
  venus= new planet();
  jorden= new planet();
  manen= new planet();
  mars= new planet();
  jupiter= new planet();
  saturn= new planet();
  uranus= new planet();
  neptun= new planet();
  pluto= new planet();
}



void draw()
{
  background(255);
  solen.drive(0.076111111,30);
  solen.display();
  merkur.drive(0.001028,70);
  merkur.display();
  venus.drive(0.002464,110);
  venus.display();
  jorden.drive(0.002728,150);
  jorden.display();
  manen.drive(0.00045,190);
  manen.display();
  mars.drive(0.001025,230);
  mars.display();
  jupiter.drive(0.006422,260);
  jupiter.display();
  saturn.drive(0.002489,300);
  saturn.display();
  uranus.drive(0.002414,340);
  uranus.display();
  neptun.drive(0.003097,380);
  neptun.display();
  pluto.drive(0.000161,420);
  pluto.display();
}
