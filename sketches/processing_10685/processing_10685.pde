
class Particle{
  float x;
  float y;
  float xs;
  float ys;
  
  Particle(){
    x = 75;
    y = 100;
    xs = random(1,2);
    ys = random(-1,-4);
  }
    
  void run(){
    x = x + xs;
    y = y + ys;
  }  
  
  void gravity(){
    ys += 0.05;
  }

  void display(){
    stroke(0);
    fill(random(50, 145), random(50, 145), random(200, 245));
    rect(x,y,random(17,20),random(12,15));
  }  
}

