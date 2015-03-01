
Ball balls[]= new Ball [5];
boolean pause = false;
void setup(){
  size(600, 600);
  background(105);
  for (int k = 0; k < balls.length; k++){
      balls[k]= new Ball();
  }
  
}

void draw() {
   if(!pause){
    background(105);
    for(int k = 0; k < balls.length; k++){
      balls[k].display();
    }
  for (int k=0; k< balls.length; k++) {
    for (int i= k+1; i< balls.length; i++){
if (balls[k].intersect(balls[i])) {
color c = color(random(100,255),random(50,255),random(100,255));
balls[k].reset(c);
balls[i].reset(c);
}
  }
  }
  for (int k=0; k< balls.length; k++){
    balls[k].display();
    balls[k].grow();
  }
}
}
void mousePressed() {
  pause = !pause;
}

class Ball {
float r; // radius
float x,y;
color c;

Ball() {
reset(color(random(100,255),random(100,255),random(100,255)));
}

void grow() {
  r+=.7;
}

void reset(color tempC){
r = 0;
x = random(width);
y = random(height);
c = tempC;
background(105);
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
