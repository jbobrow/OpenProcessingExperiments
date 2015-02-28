
Ship ship;
void setup () {
    size(400,400);
    ship = new Ship();
}
 void draw () {
 background(0);
 fill(255);
 ship.move();
 ship.draw();
}   
   
class Ship {
    int degree = 90;
    int dist = 40;
    float acc = .07;
    PVector loc = new PVector(width / 2, height / 2);
    PVector movement = new PVector(0,0);
    int x1;
    int x2;
    int x3;
    int y1;
    int y2;
    int y3;
    
    public Ship() {
        loc = new PVector(width / 2, height / 2);
        movement = new PVector(0,0);
    }
    
    public void move() {
        loc.add(movement);
    }
    
    public void draw() {
    float x = loc.x;
    float y = loc.y;
    x1 = (int) (x + (dist + 5) * cos(radians(degree)));
    y1 = (int) (y - (dist + 5) * sin(radians(degree)));
    x2 = (int) (x + (dist) * cos(radians(degree - 90)));
    y2 = (int) (y - (dist) * sin(radians(degree - 90)));
    x3 = (int) (x + (dist) * cos(radians(degree + 90)));
    y3 = (int) (y - (dist) * sin(radians(degree + 90)));
    triangle(x1,y1,x2,y2,x3,y3);
    
   }
  
  public void accelerate() {
   move.add(cos(radians(degree)) * acc,-(sin(radians(degree)) * acc));  
          
    
  }   
 }
 
 class Bullet {
 int x;
 int y;
 int radi;
 int degree;
 PVector loc;
 PVector movement;
 public Bullet() {
 ellipse(float x, float y, int degree, int r} 
 radi = r;
 loc = newPVector(x,y);
 movement = newPVector(cos(radians(degree)) * 3,-sin(radians(degree)) * 5);
 }
     
 
 
 
 
    
                                                                                                                                                                                                
