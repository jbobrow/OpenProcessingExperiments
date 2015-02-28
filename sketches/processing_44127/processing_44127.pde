

Sable sable;
ArrayList sables;
 
void setup() {
  size(600,256);
  sables = new ArrayList();
  for (int i = 0; i < 40000; i++) {
    
    sables.add(new Sable (random(width),random(height),0.5));
 
  }
 
}
 
void draw() {
  background (162,158,26);
  for ( int i = 0 ; i < sables.size(); i ++){
    Sable sable = (Sable) sables.get(i);
    sable.update();

 
  }
}

void keyPressed() { setup(); }

class Sable {
  float x,y,v,r;
 
 
  Sable(float x_, float y_, float r_){
    x = x_;
    y = y_;
    v = 17;
    r = int(random(1, 1.5));
  }
 
  void update(){
 
 
    float distance = dist(mouseX,mouseY,x,y);
 
    if (distance < 14 ){
      if (mousePressed){
        float radians = atan2(mouseY-y,mouseX-x)+PI;
        x = x + v * cos(radians);
        y = y + v * sin(radians);
      }
    }
 
    noStroke();
    fill(242,238,110);
    ellipse(x, y, r, r);
  }
 
 
}

