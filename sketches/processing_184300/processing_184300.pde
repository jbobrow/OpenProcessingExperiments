
int numberOfActors=10;
Food[] food=new Food[numberOfActors];
float[] x = new float[10];
float[] y = new float[10];
float length = 10;
int randomX;
int randomY;
String time = "100";
int timer;
int interval = 100;
String end = "GAME OVER";


int a=1000;
float s=5;
float m;
float n;
 






void setup() {
  
 background(135,135,135);
  size(500, 500);
  frameRate(150);
  for (int i=0;i<food.length;i++){
    randomX=int(random(width));
    randomY=int(random(height));
    food[i] = new Food(randomX,randomY);
   };
   
}

void draw() {
  background(0);
  strokeWeight(5);
  stroke(255);
  follow(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    follow(i+1, x[i], y[i]);
  }
   for (int i=0;i<food.length;i++){
  food[i].move();
  food[i].display();
  };
  timer = interval-int(millis()/1000);
    time = nf(timer , 3);
    if(timer < 1){
      noLoop();
      interval+=20;
      text(end,245,260);
    }

   text(time, width/2, height/2); 
  for (int i=0; i<a; i++) {
    stroke(random(0,255));
    m=random(0,a);
    n=random(0,a);
    line(m,n,m+random(0,s),n);
  } 
}  

void mousePressed(){
  loop();
}

void follow(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * length;
  y[i] = yin - sin(angle) * length;
  line(x[i], y[i], angle);
}

void line(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0,0,length,0);
  popMatrix();
}
class Food{
    int x,y,xDirection,yDirection;
  int howScattered=10;
  float checkDistance;

Food(int x1,int y1){
  x=x1;
  y=y1;
  xDirection=1;
  yDirection=1;
}
void move(){
  
  if(mousePressed){
    checkDistance=dist(mouseX,mouseY,x,y);
    if(checkDistance<10){
     x=int(random(width));
     y=int(random(height));
  ellipse(x,y,20,20);
    };
  }
  
}

void display(){
noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(x,y,20,20);
  
}
 
}



