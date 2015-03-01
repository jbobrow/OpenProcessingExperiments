
Point p1, p2, p3;
ArrayList<Triangle> Triangles;
void setup(){
  size(600,400);
  smooth();
  Triangles = new ArrayList<Triangle>();
  p1 = new Point(new PVector(random(width),random(height)), new PVector(random(100)/10,random(100)/10));
  p2 = new Point(new PVector(random(width),random(height)), new PVector(random(100)/10,random(100)/10));
  p3 = new Point(new PVector(random(width),random(height)), new PVector(random(100)/10,random(100)/10));
  Triangles.add(new Triangle(p1,p2,p3,color(0,0,0,0)));
}

  void draw(){
    background(255);
    for(int i = Triangles.size()-1; i>=0; i--){
      Triangle triangle = Triangles.get(i);
      triangle.display();
      triangle.update(4);
      if (alpha(triangle.c) == 1 && triangle.a==true) Triangles.remove(i);
      
    }
      
    p1.update();
    p2.update();
    p3.update();
    Triangles.add(new Triangle(p1,p2,p3,color(0,0,0,1)));
  }
  
  
  
class Triangle{
  Point p1, p2, p3;
  boolean a;
  color c;
  Triangle(Point p1_, Point p2_, Point p3_, color c_){
    p1 = new Point(p1_.pos,p1_.vel);
    p2 = new Point(p2_.pos,p2_.vel);
    p3 = new Point(p3_.pos,p3_.vel);
    c = c_;
    a = false;
  }
  
  void display(){
    stroke(c);
    line(p1.pos.x,p1.pos.y,p2.pos.x,p2.pos.y);
    line(p2.pos.x,p2.pos.y,p3.pos.x,p3.pos.y);
    line(p3.pos.x,p3.pos.y,p1.pos.x,p1.pos.y);
  }
  void update(float inc){
    float cn;
    if(!a){
      cn = alpha(c) + inc;
      if (cn>=200) a = true;
      if (cn<=0) cn = 0;
    }
    else{
      cn = alpha(c) - inc;
      if (cn>=255) cn = 255;
      if (cn<=1) cn = 1;
    }
    c = color(red(c),green(c),blue(c),cn);
  }
}
class Point{
  PVector pos,vel;
  
  Point(PVector pos_, PVector vel_){
    pos = pos_.get();
    vel = vel_.get();
  }
  
  void update(){
    pos.add(vel);
    if (pos.x<0 || pos.x>width){
      vel.x = -vel.x;
    }
    if (pos.y<0 || pos.y>height){
      vel.y = -vel.y;
    }
  }
}   


