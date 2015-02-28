
color bgColor;
Thing[] things = new Thing[1];

void setup(){
  size(800,800);
  smooth();
  frameRate(30);
  bgColor = 0;
}


void draw(){
  background(bgColor);
  Thing t = new Thing(mouseX, mouseY);
  things = (Thing[]) append(things, t);
  println(things);
  for(int i = 1; i < things.length; i++){
    things[i].update();
    things[i].display();
  }
}

void mousePressed(){
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  bgColor = color(r,b,g);
}

void keyPressed(){
  if(key == 'a' || key == 'A') {
      setup();
      things = (Thing[]) new Thing[1];
    }
}
class Thing {
  float x;
  float y;
  float r;
  float g;
  float b;
  float a;
  float h;
  float w;
  float d;
  float speed = 20;
  int t;
  int v;

  Thing(float mx, float my) {
    x = mx;
    y = my;
    r =random(255);
    g =random(255);
    b =random(255);
    a =random(255);
    h = random(10, 100);
    w = random(10, 100);
  }

  void update() {
    t = mouseX;
    v = mouseY;
    x -= speed;
    fill(r, g, b, a);
  }
  
  void display(){
    ellipse(x,y,h,w);
  }
}



