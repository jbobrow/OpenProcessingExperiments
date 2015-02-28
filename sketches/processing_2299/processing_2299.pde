
int numDots = 100000;
MovingDots[]dots = new MovingDots[numDots];
int currentDot= 0;
float dragX;
float dragY;

void setup(){
  size (1600,900);
  smooth();
 
  frameRate(25);
  for (int i = 0; i< numDots; i++){
    dots[i] = new MovingDots();
    noStroke();
  }
}

void draw(){
  
    fill(0, 8);
  rect(0,0,1600,900);
 
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
 float x;
  
 
 



void display(){
 x= random (width);
 y= random (height);
  if (mousePressed == true){
    x = mouseX + random(22) ;
    y = mouseY + random(22) ;
  }
 
  float radius = random(20);
  fill(random(255),random(255),random(255),random(255));
  ellipse(x, y,radius,radius);
 

  
}
}




