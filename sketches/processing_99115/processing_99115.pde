
ArrayList<Particule> p = new ArrayList<Particule>();
ArrayList<Triangle>  t = new ArrayList<Triangle> ();
int MAX_TR = 16;

void setup(){
  size(600, 600);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  background(0);
}

class Point {
  int x, y;
  public Point(int x, int y){
    this.x = x;
    this.y = y;
  }
}

class Particule {
  Point p;
  Point v;
  
  public Particule(int x, int y, int dx, int dy){
    p = new Point(x, y);
    v = new Point(dx, dy);
  }
  
  public void update(){
    p.x = p.x + v.x;
    p.y = p.y + v.y;
    
    v.x = p.x > width ? -v.x : p.x < 0 ? -v.x : v.x;
    v.y = p.y > width ? -v.y : p.y < 0 ? -v.y : v.y;
  }
  
  public boolean collide(){
    return p.x > width || p.x < 0 || p.y > width || p.y < 0;
  }
}

class Triangle {
  Particule a, b, c;
  int hue;
  
  public Triangle(Particule a, Particule b, Particule c, int hue){
    this.a = a;
    this.b = b;
    this.c = c;
    this.hue = hue;
  }
  
  public void draw(){
    stroke(hue, 100, 100);
    fill(0);
    triangle(a.p.x, a.p.y, b.p.x, b.p.y, c.p.x, c.p.y);
  }
  
  public void update(){
    a.update();
    b.update();
    c.update();
    
    hue = a.collide() ? b.collide() ? c.collide() ? (int)random(10, 360) : (int)random(10, 360) : (int)random(10, 360) : hue;
  }
}


void draw(){
  stroke(360,0,100);
  for(Particule P: p) point(P.p.x, P.p.y);
  for(int i = 0; i < min(t.size(), MAX_TR); ++i){
    t.get(i).draw();
    t.get(i).update();
  }
}

void mousePressed(){
  if(t.size() < MAX_TR){
    p.add(new Particule(mouseX, mouseY, ((int)random(0,1)) == 1 ? -((int) random(1,3)) : ((int) random(1,3)), ((int)random(0,1)) == 1 ? -((int)random(1,3)) : ((int)random(1,3))));
    if(p.size() == 3){
      t.add(new Triangle(p.get(0), p.get(1), p.get(2), (int)random(10,360)));
      p.clear();
    }
  }
}
