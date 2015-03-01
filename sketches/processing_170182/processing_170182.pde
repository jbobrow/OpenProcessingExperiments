
Ball[] ball = new Ball[5]; 

boolean click;

void setup() {
  size(600, 600);

for(int i = 0; i < ball.length; i++){
  ball[i] = new Ball();
}

}

void draw() {
  background(255);
    
    for(int i = 0; i < ball.length; i++){
      ball[i].grow();
      ball[i].display();
      
      for(int n = 0; n < ball.length; n++){
        if (ball[i].intersect(ball[n])) {
          if(i != n){ 
          color c = color(random(255),random(255),random(255));
          ball[i].reset(c);
          ball[n].reset(c);
          }
        }
      }
    }
}


void mousePressed() {
 if(click){
   click = false;
 }
   else{
     click = true;
   }
} 

class Ball {
  float r = 1;
  int x = int(random(width));
  int y = int(random(height));
  color c = color(random(255),random(255),random(255));
  
  Ball() {
    
  }
   
  void grow() {
    if(click){
      r+=0;
    }
    else {
    r+=1;
    }
  }
  
  void display() {
    ellipseMode(CENTER);
    fill(c);
    noStroke();
    ellipse(x,y,r*2,r*2);

  }
  
  void reset(color tempC) {
    c = tempC;
    r = 1;
    x = int(random(width));
    y = int(random(width));
  }
  
  
  boolean intersect(Ball b) {
    
    float distance = dist(x,y,b.x,b.y); 
    
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  }
}


  


