
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;
float x = 60;
float y = 440;

int radius = 55;
int bodyHeight = 70;
int neckHeight = 180;
float easing = 0.02;

void setup()
{ size(360, 480);

smooth();
strokeWeight(2);
 
ellipseMode(RADIUS);
} void draw() {
 
  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=a+.03;
   
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
   
  pathB=centerB+B*sin(a2);
  a2=a2+.03;


int targetX = mouseX; x += (targetX - x) * easing;
if (mousePressed) { neckHeight = 40; bodyHeight = 90;
} else { neckHeight = 20; bodyHeight = 200;
} float ny = y - bodyHeight - neckHeight - radius;
stroke (140, 120, 240);
strokeWeight (4);
line(x-6, y-bodyHeight, x+6, ny);
line(x-12, y-bodyHeight, x+12, ny);
line(x-22, y-bodyHeight, x+22, ny);


line(x+40, ny, x+78, ny+50);
line(x+40, ny, x+85, ny+40);
line(x+40, ny, x+85, ny+60);

 
noStroke();
fill(200, 50, 140);
ellipse(x, y-33, 33, 33);
fill(0, 255, 0);
rect(x-110, y-bodyHeight, 150, bodyHeight-33);

 
fill(0, 255, 0);
ellipse(x-10, ny, radius, radius);
fill(255);
ellipse(x-15, ny+8, 14, 14);
fill(255);
ellipse(x-50, ny+8, 14, 14);
fill(0);
ellipse(x-40, ny+6, 3, 3);//eye
fill(0);
ellipse(x-24, ny+6, 3, 3); //eye
fill(255, 0, 0);
ellipse(x, ny-20, 8, 8);
ellipse(x-50, ny+26, 4, 4);
ellipse(x-41, ny-6, 3, 3);


}

