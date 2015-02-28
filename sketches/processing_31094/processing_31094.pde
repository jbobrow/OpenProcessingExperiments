
Punts[] punt;

int amount = 12;
float r = 0;

void setup() {
size(400,400);
smooth();
background(255);
punt = new Punts[amount];
for (int i=0;i<amount;i++){
  r = random(10,width/2);
 punt[i] = new Punts(cos(2*PI*(i/amount))*r, sin(2*PI*(i/amount))*r, i,r,i); 
}
}

void draw() {
  background(255);
   translate(width/2,height/2); 
  for (int i = 0; i < amount; i++){ 
   punt[i].change(); 
   punt[i].display();
  punt[i].distance(); 
  }  
}

class Punts{
 float x,y;
 float c;
 float d;
 int id;
 float dis;
  
 Punts(float tempX, float tempY, float tempC, float tempD, int tempID) {
  x = tempX;
 y = tempY;
c = tempC; 
d = tempD;
id = tempID;
 }
 
 void change() {
  c = c + random(-0.1,0.05); 
 }
 
 void display() {
  noStroke();
 fill(0,68,128,20);
 x = cos(2*PI*(c/amount))*d;
 y = sin(2*PI*(c/amount))*d;
ellipse(x,y,25,25); 
//positions[id][1] = cos(2*PI*(c/amount))*d;
//positions[id][2] = sin(2*PI*(c/amount))*d;
 }
  
  void distance() {
   for (int i=0; i<amount;i++) {
   dis = dist(x,y,punt[i].x,punt[i].y);
   if (dis < 100) {
   dis = map(dis,0,100,0,255);
   stroke(dis);
   line(x,y,punt[i].x,punt[i].y);}
    } 
  }
  }
  
  void mouseClicked() {
   setup(); 
  }
