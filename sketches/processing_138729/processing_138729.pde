
//Collision of two ellipses in an ugly way. Use classes, but this will work for just two ellipses


int diameter1 = 30;
float x1 = 200;
float y1 = 0;
float x3 = 0;
float y3 = 0;

int speed = 3;
int speed2 = 2;

int diameter2 = 15;
//float x2 = 100;
//float y2 = 100;
float x2 = 200;
float y2 = 200;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  //background(255);
  fill(0,40);
  rect(0,0,width,height);
  noStroke();
  
  fill(255);
  ellipse(x1, y1, diameter1, diameter1); 
  ellipse(x3, y3, diameter1, diameter1); 
  ellipse(x2, y2, diameter2, diameter2);//center circle
  //x1 += 1.0;
 // x1= x1+speed;
  y1 = y1+speed;
  x3 = y3+speed2;
  y3 = y3+speed2;
  boolean bla = false;
  detectCollision(x1,y1,x2,y2,1);
  detectCollision(x3,y3,x2,y2,2);

  if(y1 < 1){
    speed  = -speed;
  }
   if(y3 < 1){
    speed2  = -speed2;
  }
}

public boolean detectCollision(float x1,float y1,float x2,float y2, int who){
  if(dist(x1, y1, x2, y2) <=20){
  if(who == 1){
    println("Collision ellipse 1");
    speed = -speed;
  }
  if(who == 2){
    println("Collision ellipse 2");
    speed2 = -speed2;
  }
  return true;
  }else{
    return false;
  }
}
