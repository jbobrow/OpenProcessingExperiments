
int numPlus = 40;
float s= 4.5;
int count = 0;
Plus p;
ArrayList <Plus> pluses;
  
void setup() {
  size(700, 500);
  noStroke(); 
  pluses = new ArrayList<Plus>();
  for (int i = 0; i < numPlus; i++) {
    p = new Plus();
    pluses.add(p);
  }
   
}

void draw() {
   
  background(#434343);
   
  for (int i = 0; i < pluses.size(); i++) {
    pluses.get(i).update();
    pluses.get(i).display();
  }
}

void mousePressed() {
  for (int i = 0; i < numPlus; i++) {
    p = new Plus();
    pluses.add(p);
  }
}  
class Plus {
  color cPlus;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float speed;

  color [] cArray = {
    color(#620ce8), // purply cobalt
    color(#0dbeff), // bright sky 
    color(#22ff3c), // lime
    color(#ff771f), // orangey red
    color(#ff2a3f), // rose
    color(#1b28e8), // mild cobalt
    color(#1dff76), // bluey green
    color(#ffe237), // butter yellow
    color(#38e8d9), // bright aqua
    color(#f359ff), // wisteria
    color(#26e82d), // bright leaf green
    color(#cae803), // yellow green
    color(#ff9726), // bright orange
    color(#176fe8), // cornflower
    color(#f7ef1d), // bright yellow
    color(#e81922), // coraly red
    color(#ff227b) // bright pink
  };
  
  Plus() {
    location = new PVector(random(0, width), random(0,height));
    velocity = new PVector(0,0);
    speed = s;

    int rnum  = (int)random(cArray.length);
    cPlus = cArray[rnum];
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouse, location);
    direction.normalize();
    direction.mult(.075);
    acceleration = direction;
    
    velocity.add(acceleration);
    velocity.limit(speed);
    location.add(velocity);
  }
  
  void display() {
    fill(cPlus);
    beginShape();
      vertex(location.x, location.y);
      vertex(location.x+3, location.y-10);
      vertex(location.x+6, location.y);
      vertex(location.x+16, location.y+3);
      vertex(location.x+6, location.y+6);
      vertex(location.x+3, location.y+16);
      vertex(location.x, location.y+6);
      vertex(location.x-10, location.y+3);
    endShape(CLOSE);
  }  
  
}


