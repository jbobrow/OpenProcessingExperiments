
PImage m,o,v,t,t2,t3,t4;
float x;
float i=0.2;
void setup(){
  size(652,900);
  background(0);
  m=loadImage("vanfair.jpg");
  o=loadImage("obese.png");
  v=loadImage("vanity-fair-logo.jpg");
  t=loadImage("magtext1.png");
  t2=loadImage("magtext2.png");
  t3=loadImage("magtext3.png");
  t4=loadImage("magtext4.png");
}

void draw(){
  x=map(i,0,5,0,mouseX);
  if(x>15){
  background(0);
  image(v,20,-10);
  image(t,460,600);
  image(t2,20,400);
  image(t3,460,300);
  image(t4,20,150);
  image(o,135,70);
  filter(BLUR,x);
    if(x>23){
        background(0);
        image(v,20,-10);
        image(t,460,600);
        image(t2,20,410);
        image(t3,460,300);
        image(t4,20,160);
        image(o,135,70);
    }
  }
  else{
  image(m,0,0);
  filter(BLUR,x);
  println(x);
} 
}

