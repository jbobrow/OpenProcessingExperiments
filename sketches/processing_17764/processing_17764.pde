
int maxImages=100;
int imageIndex;
float d;
float x;
float y;
float o;
PImage[] images=new PImage[maxImages];

void setup(){
  size(650,650);
  background(255);
  for(int i=0;i<images.length;i++){
    images[i]=loadImage("ghost"+i+".png");
  }
}

void draw(){
  float d=random(0.07,0.2);
  float x=random(0,50);
  float y=random(0,50);
  float o=random(180,230);
  tint(255,o);
  image(images[imageIndex],x,y);
  imageIndex=int(random(images.length));
  frameRate(d);
}

