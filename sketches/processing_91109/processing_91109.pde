
//blowing bubble via mousePress in 3D space

bubbleSystem bs = new bubbleSystem();

PImage img;

void setup(){
  size(800,600,P3D);
  img = loadImage("tunel.jpg");
  smooth();
}

void draw(){
  directionalLight(100,0,0,-150,0,0);
  directionalLight(0,100,0,0,-150,0);
  directionalLight(0,0,200,0,0,-150);
  pointLight(255,255,0,0,0,-200);
  pointLight(255,0,255,0,-200,0);
  pointLight(0,255,255,-200,0,0);
  background(img);
  //create bubble from bubbleSystem
  if(mousePressed){
    bs.add(new Bubble(mouseX,mouseY));
  }
  bs.blow();
 }
  
  

// declare the bubble object

class Bubble {
  float x;
  float y;
  float z;
  float scalar = 2;
  float angle = 0.0;
  float speed = 0.01;
  int age = 0;
  float xv = -3+random(-1,4);
  float yv = -random(2);
  float zv = -random(3,10);
  float maxYV = 1;
  float scale = random(10,30);
  
  Bubble(float xp, float yp) {
    x = xp;
    y = yp;
  }
  
  //pack to the bubble system
  void run(){
    move();
    display();
  }
  
   void move() {
   x = x + xv + sin(angle)*scalar;
   y += yv;
   z += zv;
   angle += speed;
   age++;
   if (age > 250) pop();
  }
  
  void display() {
    noStroke();
    fill(255,30);
    pushMatrix();
    translate(x,y,z);
    sphere(scale);
    popMatrix();
  }
  
  void pop(){
      bubbles.remove(this);
  }
  
}


//making series of bubble
ArrayList  bubbles = new ArrayList();
class bubbleSystem{

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


