
Mover[] movers = new Mover[5000];

PVector mouse;
float g = 0.1;
float inc = 0.000001;

void setup() {
  size(500,500);
  smooth();
  stroke(255);
  fill(255);
  textSize(10);
  textAlign(LEFT,CENTER);
  
  mouse = new PVector(width/2, height/2);
  
  for(int i = 0; i < movers.length ; i++ ) {
    movers[i] = new Mover(random(width/4, 3*width/4), random(height/4, 3*height/4));
  }
  
  //addMouseMotionListener(this);

}


void draw() {
  mouse.set(mouseX, mouseY);
  background(0);
//  text("g  : " +nf(g,0,8), 10,10);
//  text("inc: " +nf(inc,0,8), 10,20);
  for(int i = 0; i < movers.length; i ++ ) {
    movers[i].display();
  }
  
  //saveFrame("frames/#####.png");
}

//void mouseWheel(MouseEvent e) {
//  float delta = e.getAmount();
//  g += delta > 0 ? inc : -inc;
//}

//void mousePressed(MouseEvent e) { 
//  if(e.getButton() == LEFT) {
//    inc *= 10;
//  } else {
//    inc *= 0.1;
// }
//}
  class Mover {
   PVector position;
   PVector velocity;

  Mover(float x_, float y_) {
    position = new PVector(x_,y_);
    velocity = new PVector();
  }
  
  void display() {
    PVector force = PVector.sub(mouse, position);
    force.normalize();
    force.mult(g);
    velocity.add(force);
    velocity.limit(15);
    position.add(velocity);
    
    point(position.x, position.y);
  }
 
}

