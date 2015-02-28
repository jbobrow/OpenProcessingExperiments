
PImage img01;
PImage img02;
PImage img03;
PImage img04;
PImage img05;
PImage img06;

void setup()
{
  size(405,268);

img01 = loadImage("01.jpg");

img02 = loadImage("02.jpg");

img03 = loadImage("03.jpg");

img04 = loadImage("04.jpg");

img05 = loadImage("05.jpg");

img06 = loadImage("06.jpg");


}

void draw()
{
  
  if(mousePressed==true)
  {image(img06,0,0);}
   else
   {
float t01= map(mouseX,0,67,0,255); 
tint(255,t01);
image(img01, 0, 0);
noTint();

float t02= map(mouseX,67,134,0,255); 
tint(255,t02);
image(img02, 0, 0);
noTint();

float t03= map(mouseX,134,201,0,255); 
tint(255,t03);
image(img03,0, 0);
noTint();

float t04= map(mouseX,201,268,0,255); 
tint(255,t04);
image(img04, 0, 0);
noTint();

float t05= map(mouseX,268,344,0,255); 
tint(255,t05);
image(img05, 00, 0);
noTint();

float t06= map(mouseX,344,405,0,255); 
tint(255,t06);
image(img06, 0,0);
noTint();

   }
}


