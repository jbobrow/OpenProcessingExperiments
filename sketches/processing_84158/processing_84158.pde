
float x = 60;
float y = 440;
int radius = 45;
int bodyHeight = 160;
int neckHeight = 70;

float easing = 0.02;

void setup(){
  size(360, 480);
  smooth();
  strokeWeight(2);
  
  
  ellipseMode(RADIUS);
 
  }
 
void draw(){

int targetX = mouseX;
x += (targetX - x) * easing;

if (mousePressed){
  neckHeight = 16;
  bodyHeight = 90;
} else {
  neckHeight = 70;
  bodyHeight = 160;
 }

float ny = y-bodyHeight -neckHeight-radius;

background(0,200,250);


//Earth
noStroke();
fill(0,160,0);//earths color
rect(0,440,360,480);
noStroke();
fill(255,255,0);
ellipse(330,80,60,60);

//Neck
stroke(102);
line(x+12, y-bodyHeight, x+12, ny);

//Antennae
line(x+12, ny, x-18, ny-43);
line(x+12, ny, x+42, ny-99);
line(x+12, ny, x+78, ny+15);

//Body
noStroke();
fill(100);//wheel
ellipse(x, y-33, 33, 33);
fill(0);//body color
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(255,0,0);
ellipse(x+15,y-120,5,5);


//Head
fill(0);//head color
ellipse(x+12, ny, radius,radius);
fill(255);//eye color
ellipse(x+24, ny-6, 14, 14);
fill(255,0,0);//pupil
ellipse(x+24, ny-6, 3, 3);

}

 
