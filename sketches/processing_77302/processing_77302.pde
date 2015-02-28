
PImage imagen;
int a=0;
int b=0;

int speed = 17;


void setup ()
{
  size (500,680);
  frameRate(speed);
  imagen = loadImage ("elefante.png");
  smooth();
}

void draw () {
  image (imagen, 0, 0);
  //stroke(255);
  fill(0);
  quad(0,0,192,125,64+a,height,0,height);
  quad(306,125,width,0,width,height,382+a,height);
  
  if(b==0){
    a=a+1;
  }
  else if(b==1){
    a=a-1;
  }
  
  if(a>30){
    b=1;
  }
  if (a<0){
    b=0;
  }
  
  if(mousePressed){
    speed = 60;
    frameRate(speed);
  }
  
  if(speed > 12){
  speed = speed - 1;
  frameRate(speed);
  }
}




