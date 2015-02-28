
int time=0;
int ratio=0;
float al=0;
int i=0;
PImage images[] = new PImage[11];

public void setup(){
  size(400,400);
  background(0);
  frameRate(30);
  for (int i = 0; i < 11; i++) {

   images[i] = loadImage("p"+i+".png");
  }
}

void draw(){

  //background(0);
  if(time % 60 ==0)i++;
  if(i>=11)i=0;
  images[i].resize(200,0);
  imageMode(CENTER);
  image(images[i],width/2,height/2);
  //ratio+=4;
  //al+=255/30;
  time++;
}
  

