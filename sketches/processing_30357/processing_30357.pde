
//circle of circles
Circles[] circle;

//number of circles 
int amount = 10;
int a = amount;

void setup() {
 size(255,255); 
 circle = new Circles[amount];
 for (int i = 0; i < amount; i++){
    circle[i] = new Circles(cos(2*PI*(i/a))*100, sin(2*PI*(i/a))*100, i); 
 }
}

void draw() {
 background(255);
 translate(width/2,height/2);
  for (int i = 0; i < amount; i++){
   circle[i].change();
   circle[i].display();
  } 
}

class Circles {
 float x,y;
 float c; 
 
 Circles(float tempX, float tempY, float tempC) {
  x = tempX;
  y = tempY;
  c = tempC;
 }
 
 void change(){
 c += 0.02;
 
 }
 
 void display() {
  stroke(255);
 fill (127+cos(2*PI*(c/amount))*100, 127+sin(2*PI*(c/amount))*100,mouseX);
 ellipse(cos(2*PI*(c/amount))*100, sin(2*PI*(c/amount))*100,50,50);
 }
}
                
                                                              
                
