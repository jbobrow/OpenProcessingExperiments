
void setup(){
size (400, 400);
  smooth();
  noStroke();
  colorMode(HSB);
}

int y=0;
int x=0;
int z=400;
int w=400;
int speed=2;
int speed2=2;
int speed3=-2;
int speed4=-2;

void draw(){
  background (255);
  frameRate(60);
  Redd();
  Yellow();
  Bluue();
  Black();
}

  void Redd(){
  fill(0, 255, 220, 255);
  ellipse(y, 200, 100, 100);
  y=y+speed;
   if (y<-75||y>=200){
    speed=speed*-1;
  }
  }
  
  void Yellow(){
  fill(35, 200, 255, 255);
  ellipse(200, x, 100, 100);
  x=x+speed2;
   if (x<-75||x>=200){
    speed2=speed2*-1;
  }
  }
  
  void Bluue(){
  fill(160, 255, 220, 255);
  ellipse(z, 200, 100, 100);
  z=z+speed3;
     if (z<200||z>=475){
    speed3=speed3*-1;
  }
  }
  
  void Black(){
  fill(130, 0, 0, 255);
  ellipse(200, w, 100, 100);
   w=w+speed4;
  if (w<200||w>=475){
    speed4=speed4*-1;
  }
}

