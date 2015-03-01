
int NUM_BALLS = 3;

Ball[] ball = new Ball[NUM_BALLS];
boolean globalGrow = true;

void setup() {
size(400,400);
smooth();

// Initialize balls
  for(int i = 0; i < NUM_BALLS; i++)
  {
    ball[i] = new Ball();
  }
}

void draw() {
background(255);

if(globalGrow == true){
    for(int i = 0; i < NUM_BALLS; i++)
    {
      ball[i].sizeIt();
    }
}

for(int i = 0; i < NUM_BALLS; i++)
{
 for(int j = i+1; j < NUM_BALLS; j++)
 {
  if(ball[i].intersect(ball[j]))
  {
    color c = color(random(255),random(255),random(255));
    ball[i].resetMe(c);
    ball[j].resetMe(c);
  }
 } 
}

for(int i = 0; i < NUM_BALLS; i++)
{
 ball[i].display();
}

}
void mousePressed(){
if(globalGrow == true){
globalGrow = false;
}
else{
globalGrow = true; 
} 
}

// ANSWER (class code):
class Ball {
float r; // radius
float x,y;
color c;

Ball() {
resetMe(color(random(255),random(255),random(255)));
}

void sizeIt() {
r+=1;
}
void resetMe(color tempC){
r = 0;
x = random(width);
y = random(height);
c = tempC;
}

void display() {
noStroke();
fill(c);
ellipse(x,y,r*2,r*2);
}

boolean intersect(Ball b) {
// Objects can be passed into functions as arguments too! 
float distance = dist(x,y,b.x,b.y); // Calculate distance

// Compare distance to sum of radii
if (distance < r + b.r) {
return true;
} 
else {
return false;
}
}
}


