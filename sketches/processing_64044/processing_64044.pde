
int rottn =1000;
Star[] quf = new Star[rottn];
PFont pp;

void setup(){
  pp = loadFont("YDIYMjO360-32.vlw");
  textFont(pp,14);
  size(400,400);
  background(0);
  for(int i=0;i<rottn; i++){
  quf[i] = new Star(random(rottn),random(rottn));
  }
}
void draw(){
  fill(255,0,0);

background(0);
  text("2009275024 Hye-Ryoung, Lee", 190,390);
  for(int i=0; i<rottn; i++){
    quf[i].display();
  }
}
class Star{    
  int l=3;
  int x ;
  int y;
float z=0;
int ak=0;
int a;

  Star(float xz, float yz){
    x=int(xz);
    y=int(yz);
  }

void display(){
  a = int(random(255));
  if (ak ==5){
  z +=0.1;
  z *= 1.1;
  if(z+x>500){
    z = 0.1;
  }
  }

  stroke(255);

point(x+z,y+z);
if(mouseX>x-l&&mouseX<x+l&&mouseY>y-l&&mouseY<y+l){
  ak = 5;


}


  println(ak);
  println(z);
}
}


