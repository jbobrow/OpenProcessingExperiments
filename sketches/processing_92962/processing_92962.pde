


//remaking the Bubble assignment in 2011
//blow the bubble!


//ArrayList bubblelist = new ArrayList();
bubbleSystem bs = new bubbleSystem();


void setup(){
  size(800,600);
  smooth();
}

void draw(){
  background(109,199,220);
  if(mousePressed){
    bs.add(new Bubble(mouseX,mouseY));
  }
  bs.blow();
 }
  
  

// declare the bubble object

class Bubble {
  float x;
  float y;
  int diameter = int(random(10,40));
  float scalar = 0.2;
  float angle = 0.0;
  float speed = 0.01;
  int age = 0;
  float strokew = diameter/10;
  float xv = -3+random(1,5);
  float yv = -random(3);
  float maxYV = 1;
  
  Bubble(float xp, float yp) {
    x = xp;
    y = yp;
   // s = tempS;
    //diameter = tempDiameter;

  }
  
  void run(){
    move();
    display();
  }
  
   void move() {
   x = x + xv + sin(angle)*scalar;
   y += yv;
   angle += speed;
   age++;
   if (age > 500) pop();
  }
  
  void display() {
      ellipseMode(CENTER);

      noFill();
      stroke(255);
      strokeWeight(strokew*0.5);
      ellipse(x,y,diameter,diameter);
      strokeWeight(strokew*1.5);
      strokeCap(ROUND);
      arc(x,y,diameter-15,diameter-15,5.65,6.56);
      strokeWeight(strokew*1);
      arc(x,y,diameter-15,diameter-15,0.79,1.16);
  }
  
  void pop(){
      bubbles.remove(this);
  }
  
}



ArrayList  bubbles = new ArrayList();
class bubbleSystem{

  int q = int(random(10,30));
  
  void add(Bubble b){
    bubbles.add(b);
  }
  
  void blow(){
    for(int i = 0; i < bubbles.size(); i++){
      Bubble b = (Bubble)bubbles.get(i);
      b.run();
    }
  }
}


