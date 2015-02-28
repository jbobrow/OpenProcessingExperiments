
final ArrayList<Point> points ;
int initn = 40;

void setup(){
  size(400,300);
  background(255);
  //size(640, 480);  
  points = new ArrayList<Point>();
  // Initialize some random points
  for(int i=0; i<initn; i++){
    Point p = randomNode();
    points.add(p);
  }
} 


Point randomNode(){
  // random direction
  Vec dir = new Vec(random(1.5,9)*signum(random(-1,1)), 
   random(1.5, 9)*signum(random(-1,1)));
  int rx = (int)random(-10, 10) + width/2;
  int ry = (int)random(-10, 10) + height/2;
  
  Point p  = new Point(rx, ry, dir);
  // random color
  p.shade = color( (int)(random(235)), (int)(random(235)), (int)(random(235)), 240 );
  
  return p;
}

void draw(){
  
  background(255);
  //float brightThresh = 4;
  float speedThresh = 3.5; //remove node if its speed is lower than this
  Point c = new Point(width/2, height/2, new Vec(0,0));
   
  // draw a big circle at the center
  fill(255, 0, 0, 60);
  stroke(255);
  ellipse(c.x, c.y, 50, 50);
  
  stroke(100, 100, 100);
  // update position  
  for(int i=0; i<points.size(); i++){
    
    Point p = points.get(i);    
    // bounce x
    if(p.x < 0 || p.x > width) {
      p.dir.flipx();
      p.x += p.dir.x;   
      //p.dir.oscillatex();
      p.dir.energyLosex();
//      p.shade = brighten(p.shade, 
//        //1+(p.dir.length()>=brightThresh ? 0 : 1-p.dir.length()/brightThresh)
//        (p.dir.length()>=brightThresh ? 1 : 1.1)
//      );
    }
    // bounce y
    if(p.y < 0 || p.y > height) {
   
      p.dir.flipy();
      p.y += p.dir.y;
      //p.dir.oscillatey();
      p.dir.energyLosey();
//      p.shade = brighten(p.shade, 
//        //1+(p.dir.length()>=brightThresh ? 0 : 1-p.dir.length()/brightThresh)
//        (p.dir.length()>=brightThresh ? 1 : 1.1) 
//      );
    }
    
    p.x += p.dir.x;
    p.y += p.dir.y;
    
    fill(p.shade);
    float speed = p.dir.vlength();
    final float size = 4.5;
    
    ellipse( p.x, p.y, (int)(size*speed), (int)(size*speed));
    //println("Length: "+speed);
    //println((int)(size*speed) +" , "+ (int)(size*speed));
    
    // If the speed is too low, remove the node
    if(speed < speedThresh ){
        
//    if( tooPale(p.shade)){
      points.remove(i);
      // generate a new node
//      Point newP = randomNode();
//      points.add(newP);
    }  
  }
  
}
void mouseClicked(){
// left mouse button -> add a new node
  // right mouse button -> reset
  if( mouseButton == LEFT){
    Point newP = randomNode();
    points.add(newP);
  } else if(mouseButton == RIGHT){
    setup();
  }
}
boolean tooPale(color c){
  int t=220;
  return red(c)>=t && green(c)>=t && blue(c)>=t; 
}

color brighten(color c, float factor){
  // brighten the color by the factor (>1)
  return color( (int)(red(c)*factor), (int)(green(c)*factor), (int)(blue(c)*factor)) ;
}
int signum(float n){
  return (n>=0 ? 1 : -1);
}
////////////////////
class Point{
  int x, y;
  Vec dir;
  //int createdAt; // current frameCount this point is created
  color shade = #000000;
  
  Point(int x, int y, Vec dir){
    this.x = x;
    this.y = y;
    this.dir = dir;
    //this.createdAt = frameCount;
  }
}

class Vec{

  float x, y;
  static final float lossfac = 0.92;
  Vec(float x, float y){
    //float l = sqrt(x*x+y*y);
    this.x = x;
    this.y = y;
  }
  void  flipx(){
    this.x *= -1;   
  }
  void flipy(){
    this.y *= -1;
  }
  void oscillatex(){
    this.x += random(-1, 1);    
  }
  void oscillatey(){
    this.y += random(-1, 1);    
  }
  void energyLosex(){    
    this.x *= lossfac;
    
  }
  void energyLosey(){
    this.y *= lossfac;
  }
  float vlength(){
    return sqrt(this.x*this.x + this.y*this.y);
  }
}


///////////////////////////



