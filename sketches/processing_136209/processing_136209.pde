

PImage img;
PImage img2;
int x1=0;
int y1=500;
int direction=1;
int direction1=1;
void setup(){
   size(1000,700);
   img = loadImage("bgrnd.jpg");
  image(img,0,-50);
}

void draw(){
  

  img2 = loadImage("airpl.png");
  image(img2,x1,y1);
  
  x1=x1+direction;
    if(x1>width){
    direction = -3;
 
  } else if (x1<0){
    direction = 3;
  } 



  y1=y1-direction1;
  if (keyPressed && key == 'w'){
    direction1=1;
  } else {
    direction1=-1;
  }
  }

