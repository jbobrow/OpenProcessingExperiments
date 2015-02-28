
ArrayList Circles = new ArrayList(); 
Circle D; 
 
void setup(){
  size(600,600); 
  smooth(); 
}
 
void draw(){
  background(0);
  stroke(0);
  fill(203);
  ellipse(width/2, height/2, width, height);
  strokeWeight(3);
  for (int i=0; i<Circles.size(); i++){ 
    Circle D = (Circle) Circles.get(i); 
    D.run(); 
  }
}

class Circle { 
 
  PVector pos; 
  color c; 
  float s; 
  int age; 
 
  Circle( PVector _pos, color _c, float _s  ) { 
    pos = _pos; 
    c = _c;
    s = _s;
  }
 
  void run() { 
    render(); 
    age += 3; 
    if(age > 600) { 
      Circles.remove(this);
    }
  }
 
  void render() { 
    fill(0, 0, 255, 155-age*0.35); 
    ellipse( pos.x, pos.y, age*1.5, age*1.5 ); 
  }
}
 
void keyPressed(){
   
  
  Circle D = new Circle( new PVector(random(width), random(height)), color(100),0); 
  Circles.add(D); 
  }
  




