
Ball b;

void setup(){
size(500,500,P3D);
b = new Ball();
}

void draw(){
background(255);
b.move();
b.draw();
}

class Ball{
  float h=random(TWO_PI);
  float x=random(10);
  color c = color(random(255), random(255), random(255));
  
  Ball(){}
  
  void move(){
    h = abs(cos(x));
    x+=.05;
    x%=TWO_PI;
  }    
  
  void draw(){
    stroke(0,50);
    translate((millis()/10)%width+50, height*.90-h*300, 0);
    rotateZ(this.x);
    if (frameCount % 60 == 0 )
      this.c = color(random(255), random(255), random(255));
    fill(c, 50);
    sphere(50);
  }
}
    

