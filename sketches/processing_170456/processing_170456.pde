
Circle[] circle;
 
boolean pause = false;
 
void setup(){
  circle = new Circle[5];
  for(int i = 0; i < 5; i++)
    circle[i] = new Circle();
  size(500,500);
}
 
void draw(){
  if(!pause){
    background(174);
    for(int i = 0; i < circle.length; i++){
      circle[i].display();
    }
    for(int i = 0; i < circle.length; i++){
      for(int j = 0; j < circle.length; j++){
        if(i != j){
          if (circle[i].intersect(circle[j])) {
            color c = color(random(255),random(255),random(255));
            circle[i].reset(c);
            circle[j].reset(c);
          }
        }
      }
    }
    for(int i = 0; i < circle.length; i++)
      circle[i].r++;
  }
}
 
void mousePressed(){
  pause = !pause;
}
 
void keyPressed(){
  Circle b = new Circle();
  circle = (Circle[]) append(circle, b);
}
class Circle{
  float x;
  float y;
  int r;
  color c;
  Circle(){
    x = random(width);
    y = random(height);
    c = color(random(255),random(255),random(255));
  }
   
  void display(){
    fill(c);
    noStroke();
    ellipse(x,y,2*r,2*r);
  }
   
  boolean intersect(Circle b){
    if(dist(x,y,b.x,b.y)<(r+b.r))
      return true;
    else
      return false;
  }
   
  void reset(color w){
    c = w;
    x = random(width);
    y = random(height);
    r = 0;
  }
   
}
