
//Thanks mark!!!
PImage a;
PImage b;
int on=0;
int x=0;
void setup(){
  background(128,64,0);
  size(650,400);
  a=loadImage("mark.jpg");
  b=loadImage("spider.JPG");
}
void draw(){
  if(mousePressed){
    on=1;
  }
  if(on==1){
    x+=1;
    if(x>=570){
      on=0;
    }
  }
  image(a,0,0);
  image(b,x,180);
}

