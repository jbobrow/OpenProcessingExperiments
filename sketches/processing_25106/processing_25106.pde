
PImage img;

PImage buf;

void setup(){
  size(300,300);
  background(0);
  
  img = loadImage("sample.png");
  
  imageMode(CENTER);
  
  noCursor();
}

void draw(){
  background(0);
  image(img,mouseX,mouseY);
  if(buf!=null) blend(buf,0,0,width,height,0,0,width,height,SCREEN);
  buf = get();
}

