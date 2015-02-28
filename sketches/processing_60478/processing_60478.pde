
//angry monkey hack exercise chris 23/12/4

//declare variables

float x1 = 225;
float x2 = 225;
float x3 = 225;
float x4 = 225;


void setup ()
{
size(459, 126); //window size
smooth(); //anti-alias curves
}
void draw ()
{
fill(140);//ear fill colour in single grayscale value
strokeWeight(20); // stroke for ears

background(255);

if (x1 <373) //animation loop for right ear
{
  x1 = x1+1;
}

ellipse(x1, 60, 78, 82); //right ear

if (x2>86) //animation loop for left ear
{
  x2 = x2-1;
}

ellipse(x2, 60, 78, 82); //left ear

strokeWeight(68); //stroke for eyes
fill(245,82,27);//fill colour for eyes using RGB values

if (x3>182)  //animation loop for left eye
{
  x3 = x3-1;
}

ellipse(182, 57, 95, 100); //left eye

if (x4<277)  //animation loop for right eye
{
  x4 = x4+1;
}
ellipse(x4, 57, 95, 100); //right eye
}

