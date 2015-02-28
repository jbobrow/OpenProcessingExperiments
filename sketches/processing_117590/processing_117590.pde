
Watch red;
Watch green;
Watch blue;

void setup() {
  size(800, 500);
  smooth();
  red = new Watch(200, 250, 255, 0, 0, 0.01);
  green = new Watch(400, 250, 0, 255, 0, 0.03);
  blue = new Watch(600, 250, 0, 0, 255, 0.05);
}

void draw() {
  background(255);

  red.display();
  red.update();
  
  green.display();
  green.update();
  
  blue.display();
  blue.update();
}

class Watch {
  //data
  float x, y;
  float r, g, b;
  float ro;
  float rspeed;

  //constructor
  Watch(float xpos, float ypos, float re, float gr, float bl, float rs) {
    x = xpos;
    y = ypos;
    r = re;
    g = gr;
    b = bl;
    ro = 0;
    rspeed = rs;
  }

  //function
  void display() {
    pushMatrix();
    translate(x, y);
    noStroke();
    fill(r, g, b);
    rect(-15, -150, 30, 300);
    ellipse(0, 0, 60, 60);
    rect(-20, -130, 40, 10);
    rect(-20, -100, 40, 10);
    fill(255);
    ellipse(0, 0, 45, 45);
    ellipse(0, 70, 10, 10);
    ellipse(0, 90, 10, 10);
    ellipse(0, 110, 10, 10);
    ellipse(0, 130, 10, 10);
    strokeWeight(5);
    stroke(r, g, b);
    rect(-17.5, -180, 35, 30);
    line(0, -170, 0, -150);
    line(0, 0, 10, 0);
    rotate(ro);
    line(0, 0, 0, -15);
    popMatrix();
  }

  void update() {
    pushMatrix();
    translate(x, y);
    ro = ro+rspeed;
    popMatrix();
  }

}



