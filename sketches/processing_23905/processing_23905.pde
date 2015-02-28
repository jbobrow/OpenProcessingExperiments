
PImage img;
float x;

void setup(){
  size(800,600);
  img=loadImage("outthedoor.jpg");
}

void draw(){
  x +=1;
  if (x > width){
    x= -width;
    
  }
  
  image(img,x,0);
}


