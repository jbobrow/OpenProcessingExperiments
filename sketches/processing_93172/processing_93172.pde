
int numCircles = 20;
float increment = 25;
int counter = 0;
int x1 = 0;
int y1 = 0;

void setup()
{
size(800, 800); 
background(230);
noFill();
smooth();
strokeWeight(0.5);
}


void draw()
{
smooth();

float x2 = random(16,48);
float y2 = random(16,48);

float x3 = random(32,68);
float y3 = random(50,68);

float x4 = random(50,-50);
float y4 = random(50,- 50);

for(int a = 1; a < numCircles; a++)
{
//stroke(random(255), random(255), random(255));
arc(width/2 + x1, height/2 + y1, a*increment, a*increment, PI, PI*1.5); 
arc(width/2 + x2, height/2 + y2, a*increment, a*increment, PI*1.5, PI * 2);

//drawing line
//float angle=TWO_PI/(float)numPoints;
line(width/2 + (a*increment*sin(PI) + x1)/2, height/2 + (a*increment*cos(PI) + y1)/2, width/2 + (a*increment*sin(PI))/2 + x2, height/2 + (a*increment*cos(PI) )/2 + y2);
//println(a*increment*sin(PI*1.5));
arc(width/2 + x3, height/2 + y3, a*increment, a*increment, 0,  PI / 2.0); 
line(width/2 - (a*increment*sin(PI*1.5))/2 + x2 , height/2 + y2, width/2 - (a*increment*sin(PI*1.5))/2 + x3, height/2 + y3);
arc(width/2 + x4, height/2 + y4, a*increment, a*increment, PI /2.0, PI); 
line(width/2 + x3 , height/2 + (a*increment*cos(PI*2))/2 + y3, width/2 + x4, height/2 + (a*increment*cos(PI*2))/2 + y4);
line(width/2 - (a*increment*sin(PI/2))/2 + x4 , height/2 + y4, width/2 - (a*increment*sin(PI/2))/2 + x1, height/2 + y1);
counter++;
}

//println(counter);
noLoop();
}


