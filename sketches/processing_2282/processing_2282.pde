
float y = 10.0;
float x = 30.0;
float radius = 5.0;
float speedX = .94;
float speedY = 1.0;
int directionX = 1;
int directionY = -1;
int rackx;
int racky;


void setup(){
size(300, 300);
smooth ();
noStroke();
ellipseMode (RADIUS);
rectMode(CENTER);

}

void draw(){
frameRate(300);

background (0);
fill(200);
ellipse (x, y, radius, radius);
fill(200);
rect(mouseX, mouseY, rackx, racky);

rackx=75;
racky=3;

y += speedY*directionY;
if (y > height-radius/2 || y < 0+radius/2 ) {directionY = -directionY;
}

x += speedX*directionX;
if (x > width-radius/2 || x< 0+radius/2) {directionX = -directionX;}

if (y <= mouseY+racky/2+radius && y>=mouseY-racky/2-radius && (x>mouseX-rackx/2) 
&& (x<mouseX+rackx/2)){
         directionY = -directionY;  
          }
}





