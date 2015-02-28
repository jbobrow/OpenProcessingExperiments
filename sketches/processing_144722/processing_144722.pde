
/* @pjs preload="test1.jpg"; */
PImage pic;

void setup(){
  size(300,300);
  background(255);
  pic = loadImage("test1.jpg");
  pic.resize(100,100);
}

void draw(){
  pic.filter(THRESHOLD, .6); 
  for(int i=0; i<500;i+=100)
  {
    image(pic,i,0);
    image(pic,0,i);}
    noFill();
  for(int i=0; i<570;i+=10){
    ellipse(100,100,i,i);}
}

   
  


