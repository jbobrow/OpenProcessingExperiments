
Ball ball[] = new Ball[6];
 
boolean globalGrow = true;
 
void setup() {
 size(200, 200);
  for (int i=0;i<5;i++) {
  ball[i] = new Ball();
 }
}
 
void draw() {
 background(#713C3C );
 
 if (globalGrow == true) {
  for (int i=0;i<3;i++) {
   ball[i].sizeIt();
  }
    
  
  for (int j=0;j<3;j++) {
   int k=j+1; 
   if (k>6) {k=0;}
 
   if (ball[j].intersect(ball[k])) {
     color c = color(random(255), random(255), random(255));
     ball[j].resetMe(c);
     ball[k].resetMe(c);
   }
  }
 }
 
 for (int m=0;m<3;m++) {
  ball[m].display();
 }
}
void mousePressed() {
 if (globalGrow == true) {
  globalGrow = false;
 }
 else {
  globalGrow = true;
 }
}
 
class Ball {
 float r; 
 float x;
 float y;
 color c;
 
 Ball() {
  resetMe(color(random(255),random(255),random(255)));
 }
 
 void sizeIt() {r+=1;
 }
 void resetMe(color tempC){
  r = 0;
  x = random(width);
  y = random(height);
   c= tempC;
 }
 
 void display() {
  fill(c);
  ellipse(x,y,r*2,r*2);
 }
 
 boolean intersect(Ball b) {
   
  float distance = dist(x,y,b.x,b.y);
 
   
  if (distance < r + b.r) {
   return true;
  }
  else {
   return false;
  }
 }
}

