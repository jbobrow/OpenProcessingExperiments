
float x=250.2;
float y=250.2;
boolean a=true;
boolean b=false;
String s = "Push the circle around. Do not touch the sides or let the yellow circles touch the green center. Can you make it past the first wave? Click to play.";

Object[] objects=new Object[1000];
void setup () {
  size(500, 500);
  background(220);
  smooth();
  frameRate(3000);
  for(int i=0;i<1000;i++){
   objects[i]=new Object((int)random(30,480),10*(int)random(-200,0),(int)random(5,20));
  }
}

void draw () {
 if (b==false) {
    reset();
  background(150);
  textAlign(CENTER);
  textFont("fantasy", 30);
  fill(50);
   text(s,50,50,400,400);
   x=250;
   y=250;
 }
   else{
  if(a==true){
    background(220);
  for(int i=0;i<1000;i++){
   objects[i].drawObject();
   if(frameCount%(3)==0){
   objects[i].moveDown(); 
   }
   if(objects[i].checkCollision (x,y,5) == true){
  b=false;
  }
  
  }
  noStroke();
  fill (255,0,0);
  rect(0,0,20,500);
  rect(480,0,20,500);
  rect(0,0,500,20);
  rect(0,480,500,20);
  fill(0);
  ellipse(x, y, 20, 20);
  fill(0, 255, 0);
  ellipse(x, y, 8, 8);

  if ((abs((mouseX)-x)<7)&&(abs((mouseY)-y)<7)) {
  x=x+x-mouseX;
  y=y+y-mouseY;
  }
 
  if (x>470) {
   b=false;
  }
  if (y>470) {
  b=false;
  }
  if (x<30) {
  b=false;
  }
  if (y<30) {
   b=false;
  }
}
}
}
void mouseClicked() {
  b=true;
}
class Object{//begin Object
int x, y, w;
Object(int xVal, int yVal, int size){
  x=xVal;
  y=yVal;
  w=size;
}

void drawObject(){
 fill(255,255,0);
  stroke(1);
  ellipse(x,y,w,w);
}

void moveDown(){
  y++;
}


boolean checkCollision(float circlex,float circley,int circler) {
  if(sqrt((x-circlex)*(x-circlex)+(y-circley)*(y-circley))<=circler+w/2){
  return true;
  }else{
  return false;}
}

}
void reset(){
  for(int i=0;i<1000;i++){
   objects[i]=new Object((int)random(30,480),10*(int)random(-200,0),(int)random(5,20));
  }
}
