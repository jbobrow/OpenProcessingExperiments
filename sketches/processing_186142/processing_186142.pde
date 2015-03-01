
class machi {
  color c;
  float x;
  float y;
  float s;

machi(float xx,float yy,color cc,float ss){
  x=xx;
  y=yy;
  c=cc;
  s=ss;
}
void update(){
  x = x +s;
  y = y +s;
}

void display(){
  fill(c);
  ellipse(x,y,100,100);
  fill(c/2);
  rectMode(CENTER);
  rect(x,y,50,50);
  fill(0);
  rect(x,y,20,20);
}
  }

machi newMachi;
machi newMachi2;
machi newMachi3;


void setup(){
  size(500,500);
  smooth();
  newMachi = new machi (255,255,color(0,0,255),1);
  newMachi2= new machi (100,100,color(255,0,0),2);
  newMachi3= new machi (400,400,color(255,255,0),0.5);
}

void draw(){
  pushMatrix();
  rectMode(CORNER);
  noStroke();
fill(200,10);
rect(0,0,500,500);
popMatrix();
 newMachi.update();
newMachi.display();
newMachi2.update();
newMachi2.display();
newMachi3.update();
newMachi3.display();

}

  
