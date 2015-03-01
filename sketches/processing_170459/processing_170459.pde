
Ball[] balls = new Ball [5];
 
boolean globalGrow = true;
 
void setup() {
size(400,400);
smooth();
 
for(int i = 0; i < balls.length; i++){
  balls[i] = new Ball();
}
 
}
 
void draw() {
background(255);
 for (int i = 0; i< balls.length; i++) {
     balls[i].grow();
      balls[i].display();
       
  for(int j = 0; j < balls.length; j++){ 
   if (balls[i].intersect(balls[j])) {
     if(i != j){
      color c = color(random(255),random(25),random(255));
          balls[i].resetMe(c);
          balls[j].resetMe(c);
          }
   }
 }
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
class Ball{
float r; // radius
float x,y;
color c;
 
Ball() {
resetMe(color(random(0,255)));
}
 
void grow() {
  if (globalGrow){
    r+=0;
  }else{
    r+=.7;}
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



