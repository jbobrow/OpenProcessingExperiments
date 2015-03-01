
  float x;
  float y;
  float diam;

void setup(){
  size(255,255);
  background(255);
}

  void draw(){
    fill(x,y,255);
    ellipse (x, y, diam, diam);
    
    x=random(width);
    y= random(height);
    diam = random(10, 20);
    }

 

  




