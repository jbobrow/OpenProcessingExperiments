
Ball ball;

float x,y;
float scale = 120;

void setup(){
  
  size(600,600);
  ball = new Ball();
  x = width/2;
  y = height/2;
  
}

void draw(){
  
  background(105,220,255);
  ball.update();
  ball.display(x,y);
  
  x += 1;
  
  if (x > width+scale/2){
    x = -scale/2;
  }
  
}

class Ball {
  
  float x,y,by,d;
  float angle;
  
  Ball(){
    
  }
  
  void update(){
    
    by = sin(angle)*(scale*0.3);
    angle += 0.05;
    
  }
  
  void display(float tempX, float tempY){
    
    noStroke();
    ellipseMode(CENTER);
    
    x = tempX;
    y = tempY;
    
    pushMatrix();
    
    translate(x,y);
      
    d = dist(x,-scale,x,by);  
      
    fill(50,120);
    ellipse(0,0+scale,0.6*d,0.2*d);
    
    fill(255,70,90);
    ellipse(0,0+by,scale,scale);
    
    popMatrix();
    
  }
  
}
    
    


