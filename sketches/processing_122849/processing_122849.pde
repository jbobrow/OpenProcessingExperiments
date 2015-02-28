
FallingObject[] objects;


void setup() {
  
  size(800, 600, P3D);
  objects = new FallingObject[60];
  for(int i = 0; i < objects.length; i++) {
    objects[i] = new FallingObject(800, 600);
  }
}
 
void draw() {
  background(72,118,255);
  for(int i = 0; i < objects.length; i++) {
    objects[i].move();
    objects[i].draw();
  }
}
 
class FallingObject {
  float x;
  float y;
  float vel;
  float zvel;
  FallingObject(int maxx, int maxy) {
    this.x = random(maxx);
    this.y = random(maxy);
    vel = random(3,6);
  }
  
  void move(){
    y+=vel;
    x+=vel;
    
  }
  
  void draw(){
    int x2 = int(x%800);
    int y2 = int(y%600);
    translate(x2,y2);
    stroke(255,0,0);
    fill(255,165,0);
    box(40);
    translate(-x2,-y2);
  }
}
 




