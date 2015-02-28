
//rachel ciavarella
//may be uploaded late due to old computer

float x , y;
float wd , ht;
float xDist, yDist;
float easingCoef;

void setup()
{
  size( 400, 400 );
  noCursor();
  easingCoef = .2;
  wd = 40;
  ht = 40;
  xDist = mouseX - 50 *.5;
  yDist = mouseY - 50 *.5;
  
}

void draw()
{
fill( 100 , 100 , 100 , 10 );
rect( 0 , 0 , 400 , 400 );
x = mouseX;
y = mouseY;
wd = 50;
ht = 50;

noStroke();
fill(random(0,255));
ellipse ( mouseX , mouseY ,wd , ht );
}


