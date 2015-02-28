
int numDots = 100000;
MovingDots[]dots = new MovingDots[numDots];
int currentDot= 0;

void setup(){
  size (200,200);
  smooth();
  frameRate(45);
  for (int i = 0; i< numDots; i++){
    dots[i] = new MovingDots();
  }
}

void draw(){
  background(10);
  for (int i = 0; i< currentDot; i++){
    dots[i].display();
  }
}

void mousePressed(){

  if(currentDot< numDots-1){
    currentDot++;
  }
}

class MovingDots{
  
  float y;
  int x =  int (random(width));
  float xnoise =1;
  
 
 void display(){
  x*=xnoise;
  y+=random(-0.05,0.5);
  fill(255);
  ellipse(x,y,5,5);

}
}




