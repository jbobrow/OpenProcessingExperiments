
float r;
float g;
float b;
float t;

int xPos;
int yPos;

float x;
float y;




void setup () {
  size (500,500);
  background (0);
  
}

void draw () {
 smooth(); 

r = random(200);
g = random(100);
b = random(255);
t = random(100);

x = random (500);
y = random (500);


noStroke();
fill (r,g,b,t);
rect (x,y,20,20);
xPos = xPos + 2;
yPos = yPos + 2;

ellipse (width/2,height/2,xPos,yPos);

}

