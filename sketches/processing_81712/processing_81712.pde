
int x=0;
int y=0;
PImage b;
void setup(){
  size(1000,1000);
  background(0);
  b=loadImage("purpleElephant.png");
}
void draw(){
  image(b,x,y,415,350);
  keyPressed();
}
void keyPressed(){
  if (mousePressed==true){
    x=x+int(random(-100,100));
    if(x>=1000){
      x=10;
    }
    y=y+int(random(-100,100));
    if(y>=1000){
      y=10;
    }
    if(x<=0){
      x=10;
    }
    if(y<=0){
      y=10;
    }
    int a=int(random(0,255));
    int b=int(random(0,255));
    int c=int(random(0,255));
    background(a,b,c);
  }
}


