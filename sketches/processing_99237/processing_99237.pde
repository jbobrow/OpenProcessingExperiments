
ArrayList ballCollection;
int hVal;


void setup () {
  size(600,600);
  smooth();

ballCollection = new ArrayList();
 hVal = 0;


//for( int i = 0; i < 1000; i++ ){
// ballCollection[i] = new Ball(random(0,width),random(0,200));


//}
}

void draw() {
  background(0);
  
  if (mousePressed){
  background(255);
  }
  
    colorMode(HSB);
   stroke(150);
   fill (hVal,hVal,hVal);
   colorMode(RGB);
  
  
  Ball myBall = new Ball(random (0, width),random (0, 10));
  ballCollection.add(myBall);
  
  
  
 for( int i = 0; i < ballCollection.size(); i++ ) {
   Ball mb = (Ball) ballCollection.get(i);
   mb.run();
   
     hVal += 2;
  if( hVal > 255)
  {
    hVal = 0;
  }
 }
}
 
 
 
 
 

 
 
  


class Ball {
  
  float x = 0; 
  float y = 0;
  float speedX = random(-0.5,0.5);
  float speedY = random(-0.01,10);
  
  Ball(float _x, float _y) {
    
    x = _x;
    y = _y;
  }
  
  void run() {
    display();
    move();
    bounce();
    gravity();
    
  }
  
  void gravity()
  {
    speedY += 0.2;
  }
  
  void bounce() {
    if(x > width) {
      speedX = speedX * -1;
    }
    if(x < 0) {
      speedX = speedX * -1;
    }
    if(y > height) {
      speedY = speedY * -1;
    }
    if(y < 0) {
      speedY = speedY * -1;
    }
  }
  
  void move() {
    
    x += speedX;
    y += speedY;
    
  }
  
  void display() {
    rect(x,y,20,20);
  }
}




