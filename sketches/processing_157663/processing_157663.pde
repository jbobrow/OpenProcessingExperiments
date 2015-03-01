
Droid[] snipe = new Droid[50];

int count;
int i;

void setup ()
{
size (600, 600);
count = 3;

for (int i = 0; i < count; i++) {
  snipe[i] = new Droid(i*100);
}
}

void draw ()
{
background (255,255,255);


for (int i = 0; i < count; i++) {
snipe[i].checkEdges();
snipe[i].update();
snipe[i].display();

}

}


class Droid {

PVector location;
PVector velocity;
PVector acceleration;
int r;
float t;

Droid (float time__) { 
  
location = new PVector (random(width), random (height));
velocity = new PVector (random(-2,2), random(-2,2));
acceleration = new PVector (1,1);
t = time__;
r = 50;

}

void display() {
pushStyle ();  
stroke (0, 0, 0);
strokeWeight(2);
fill (165,163,160);
ellipse (location.x, location.y, r, r);
popStyle();
}

void update() {


velocity.x = random(-2,2);
velocity.y = random(-2,2);


location.add(velocity);
} 

void checkEdges() {

if (location.x > width) {
  location.x = 0;
}

if (location.x < 0) {
  location.x = width;
}
if (location.y > height) {
  location.y = 0;
}
if (location.y < 0) {
  location.y = height;
}

}


}
