

PImage img;
int i=0;

void setup(){
  size(800,600);
  img=loadImage("fractal_intro.jpg");
}

void draw(){
  if(i==0){
    tint(255,255,255);
  }
  else if(i==1){
    tint(255,0,0);
  }
  else if(i==2){
    tint(0,255,0);
  }
  else if(i==3){
    tint(0,0,255);
  }
  else if(i==4){
    tint(255,255,0);
  }
  else if(i==5){
    tint(255,0,255);
  }
  else if(i==6){
    tint(0,255,255);
  }
  image(img,0,0,800,600);
}


void mousePressed(){
  if(i<7){
    i++;
  }
  if(i==7){
    i=0;
  }
}

