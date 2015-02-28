
void setup(){
  smooth();
  size (400,400);
  fill (70,100,210);
  frameRate(30);
}

// Assignment 5a





void orangeRect (int x, int y){
  smooth();
  fill (200,100,50);
  rect (x,y,80,40);
}

int x=22;
float frank=200;
int speed=7;
float speed2= 4+ (int(random(1)));

void draw(){
  background(40,40,250);
  orangeRect (50,50);
  orangeRect (100,100);
  orangeRect (150,150);
  orangeRect (200,200);
  orangeRect (250,250);
  orangeRect (300,300);
  int x2=100;
  float f2=50;
  
  fill (70,100,210);
  ellipse (x,frank,20,20);
  x=x+speed;
  if (frank>380) {
  }
  frank=frank+speed2;
  if ((x<20)||(x>=380)){
    speed=speed*-1;
  }
  if ((frank<20)||(frank>380)){
    speed2=speed2*-1;
    
  

  }
  }



