
float x1 = mouseX;
float y1 = mouseY;

float radius = 25;
float afstand = 50;
float boldY = 0;
float boldX =0;
int point = 0;


void setup() 
{
size (500,500);
background (255);
smooth();
}
 

void draw() 
{

  x1 = mouseX;
  y1 = mouseY;
afstand = sqrt((boldX-x1)*(boldX-x1) + (boldY-y1)*(boldY-y1));
fill (255,7,7);

if ((afstand <= radius + 7) && (afstand >= radius))
{
 flytbold();
 background (255);
 point = point+1;
  
}
if (afstand <= radius)
{
 background (0); 
}
else { background(255); }
 
 ellipse(boldX,boldY,50,50);
 text(point,20,20);

 
}
void flytbold(){
 boldX = (random (0,500));
 boldY = (random(0,500));
  
}
