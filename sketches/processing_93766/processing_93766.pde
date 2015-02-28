
int a=0;
   int d=0;
   float b,c;
   float v=255;
Fly[] flies = new Fly[3];

void setup() {
  size(500,500);
  smooth();
  background(255);
  for (int i = 0; i < flies.length; i++) {
    flies[i] = new Fly(); 
  }
}

void draw() {
  noStroke();
  fill(v,10);
  rect(0,0,width,height);
  b =width/2+100*cos(frameCount*7);
  c =height/2;
  for (int i = 0; i <flies.length; i++) {
    flies[i].update();
    flies[i].checkEdges();
  }
    flies[0].display1(); 
    flies[1].display2(); 
    flies[2].display3(); 
}

class Fly {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Fly() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {
    PVector mouse = new PVector(b,c);
    PVector dir = PVector.sub(mouse,location); 
    dir.normalize();     
    dir.mult(0.05);        
    acceleration = dir; 

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display1() {
    noStroke();
    if(a>255){
    d=1;
    }
    else if(a<0){
      d=0;
    }
    if(d ==1){
      a=a-1;
    }
    if(d==0){
      a=a+1;
    }
      
    fill(255,a,255);
    ellipse(location.x,location.y,30-a/5,30-a/5);
  }
  void display2() {
    noStroke();
    if(a>255){
    d=1;
    }
    else if(a<0){
      d=0;
    }
    if(d ==1){
      a=a-1;
    }
    if(d==0){
      a=a+1;
    }
      
    fill(a,255,255);
    ellipse(location.x,location.y,30-a/5,30-a/5);
  }
  void display3() {
    noStroke();
    if(a>255){
    d=1;
    }
    else if(a<0){
      d=0;
    }
    if(d ==1){
      a=a-1;
    }
    if(d==0){
      a=a+1;
    }
      
    fill(255,255,a);
    ellipse(location.x,location.y,30-a/5,30-a/5);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
    } else if (location.x < 0) {
      location.x = 0;
    }

    if (location.y > height) {
      location.y = height;
    }  else if (location.y < 0) {
      location.y = 0;
    }

  }

}
void mouseClicked(){
  if(v ==255){
    v=0;
  }
  else{
    v=255;
  }
}
