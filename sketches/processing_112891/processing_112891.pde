
float xPos2;
float yPos2;
float a2 = -45;

float xPos3;
float yPos3;
float a3 = -45;

float xPos;
float yPos;
float a = 45;

void setup(){
size(600,600);
xPos = width/1.4;
yPos = height/2.6;
background(random (255),random (255),random (255), random(255));
smooth();
}

void draw(){
  
  drawellipse1 ();
  drawellipse2 ();
  drawellipse3 ();
  
float xChange = cos(radians(a));
float yChange = sin(radians(a));
float xChange2 = -cos(radians(a+2));
float yChange2 = -sin(radians(a+2));
float xChange3 = -cos(radians(a+3));
float yChange3 = -sin(radians(a+3));
 
xPos += xChange *3;
yPos += yChange *2;

xPos2 += xChange2 *3;
yPos2 += yChange2 *2;

xPos3 += xChange3 *3;
yPos3 += yChange3 *2;
 }

void drawellipse1 ()
{
  fill(random (255), random (255),random (255),random (255));
ellipse(xPos, yPos, 64, 64);
a=a+1;


}
void drawellipse2 ()
{
  fill(random (255), random (255),random (255),random (255));
ellipse(xPos2+180, yPos2+220, 64, 64);
a2=a2-1;
}
void drawellipse3 ()
{
   fill(random (255), random (255),random (255),random (255));
ellipse(xPos3+180, yPos3+552, 64, 64);
a3=a3-1;
}





