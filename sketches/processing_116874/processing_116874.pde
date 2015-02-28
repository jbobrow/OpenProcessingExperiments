
table one;
table two;

float xpos;

void setup() {
  size(800, 200);
  smooth();
  one = new table("table", 100, 20, 50);
  two = new table("table",100, 20, 500);
}


void draw() {
  background(255);
  
  one.update();
  one.display();
  one.wrap();
  
  translate(200, 0);
  two.update();
  two.display();
  two.wrap();
  translate(200, 0);
  two.display();
  
  
  
  
}


  
class table {
  
  float xpos, ypos;
  String name;
  float s,w;
  float xspeed;
  
  table(String n, float x, float y, float s) {
    name = n;
    xpos = x;
    ypos = y;
    
    xspeed = random(2,5);
  }

  void display() {
    fill(random(255), random(255), random(255));
    strokeWeight(s);
    beginShape();
    vertex(164, 80);
    vertex(164, 90);
    vertex(96, 126); 
    vertex(29, 90);
    vertex(29, 80);
    vertex(96, 116);
    vertex(164, 80);
    endShape();

    stroke(0);
    beginShape();
    vertex(97, 45);
    vertex(164, 80);
    vertex(96, 116);
    vertex(29, 80);
    vertex(97, 45);
    endShape();

    line(29, 80, 29, 150);
    line(96, 116, 96, 186);
    line(164, 80, 164, 150);
    
    text(name, xpos, ypos, 50,50);
  }
  
  void update(){
    xpos = xpos + xspeed;
  }
  
  void wrap(){
    if(xpos > width +50)
    xpos = -w-50;
  }
}


