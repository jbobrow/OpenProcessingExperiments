
int x = 60;          //X coordinate
int y= 420;          //Y coordinate
int bodyHeight = 110;  //Body Height
int neckHeight = 140;  //Neck Height
int radius = 45;  //Head Radius
int ny = y - bodyHeight - neckHeight - radius; //Neck Y

float easing = 1;

void setup() {
size(600,480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);
}

// Movement
void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;

  
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  
  background(234,44,0);
  

//Neck
stroke(102);
line(x+1, y-bodyHeight,x+2,ny);
line(x+6,y-bodyHeight,x+12,ny);
line(x+11,y-bodyHeight,x+22,ny);
//Antenna
line(x+12,ny,x-18,ny-43);
line(x+12,ny,x+42,ny-99);
line(x+22,ny,x+78,ny+15);
//Body
noStroke();
fill(102);
ellipse(x,y-33,45,45);
fill(156,200,67);
rect(x-45,y-bodyHeight,90,bodyHeight-33);
//Head
fill(0);
ellipse(x+20,ny,radius,radius);
fill(255);
ellipse(x+24,ny-6,14,14);
fill(0);
ellipse(x+24,ny-6,3,3);
fill(153);
ellipse(x,ny-8,5,5);
ellipse(x+30,ny-26,4,4);
ellipse(x+41,ny+6,3,3); }



