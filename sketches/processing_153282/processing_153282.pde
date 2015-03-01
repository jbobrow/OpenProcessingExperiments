
int frames = 48;
int num = 11; //a number of row
float gap, theta;
float radius = 200; //target movement radius
PVector target;
Dot[] dots = new Dot[num*num];


void setup() {
  frameRate(48);
  size(500, 500);
  background(255);
  strokeWeight(0.5);

  gap = width/float(num-1); //num = 11 -> gap = 50;
  target = new PVector();

  for (int y=0; y<num; y++) {
    for (int x=0; x<num; x++) {
      dots[y*num+x] = new Dot(x*gap, y*gap);
    }
  }
}


void draw() {
  fadeToWhite(48);

  target.x = width/2 + radius*cos(theta); //target move
  target.y = height/2 + radius*sin(theta);

  for (int y=0; y<num; y++) {
    for (int x=0; x<num; x++) {
      dots[y*num+x].display();
    }
  }

  drawArc();

  theta +=TWO_PI/float(frames);
  
//  saveFrame("render/render_####.jpg");
}


class Dot {
  PVector loc; //location
  PVector temp; //for draw line
  Dot(float _x, float _y) {
    loc = new PVector(_x, _y);
    temp = new PVector();
  }

  void display() {
    temp = PVector.sub(target, loc);
    temp.normalize();

    float d = PVector.dist(loc, target);
    temp.mult(20-d/width*20); //shorten temp

    color c1 = color(255, 0, 0);
    color c2 = color(64, 64, 255);
    float lerpAmount = map(d, 0, width, 0, 1);
    color c = lerpColor(c1, c2, lerpAmount);

    strokeWeight(0.5);
    stroke(c, 128);
    noFill();
    line(loc.x, loc.y, loc.x+temp.x, loc.y+temp.y);
    ellipse(loc.x+temp.x, loc.y+temp.y, 20-d/50, 20-d/50);
    ellipse(loc.x, loc.y, 2, 2);

    noStroke();
    fill(c, 5);
    ellipse(loc.x, loc.y, 50-d/10, 50-d/10);
  }
}


void drawArc() {
  pushMatrix();
  pushStyle();

  translate(width/2, height/2);
  rotate(theta-HALF_PI);
  stroke(192, 0, 0, 16);
  noFill();
  strokeWeight(5);
  arc(0, 0, radius*2, radius*2, 0, HALF_PI);

  popStyle();
  popMatrix();
}


void fadeToWhite(float alp) {
  noStroke();
  fill(255, alp);
  rect(0, 0, width, height);
}

