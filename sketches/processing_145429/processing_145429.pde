
PFont hip;
cloud[] cloud=new cloud [44];
int seed = 820;
float x = seed;
float speed = 0.5;
float q = 180;

void setup() {
  size (900, 1000);
  for (int i=0; i< cloud.length; i++) {
    smooth();
    noStroke();
    cloud[i]=new cloud();
    noStroke();
    fill(0, 172, 255);
    rect(0, 230, 900, 1000);
    stroke(0);
    fill(#6F5A5A);
    rect(0, 800, 900, 200);
    frameRate(10);
  }
  //  background(0, 172, 255);
}
void draw() {
  noStroke();
  fill(0, 172, 255);
  rect(0, 0, 900, 230);


  Sun();
  for (int i=0; i<cloud.length; i++) {
    cloud[i].update();
    cloud[i].display();
  }

  if (keyCode == UP && keyPressed==true) {
    noStroke();
    fill (#50411B);
    ellipse(width/2, x, 20, 40);
  }
  if (keyCode == LEFT && keyPressed==true) {
    wateringcan();
  }
  //if (mousePressed && keyPressed==true) {
    // fill(#064D17);
    //plantfood(250,800);}
    if (keyCode==RIGHT && keyPressed==true) {
      stroke(#462D21);
      root (450, 730, 100, radians(90));
      stroke(#649B44);
      bud(450, 800, 125, radians(270));
    }
    if (keyCode==DOWN && keyPressed==true) {
      stroke(#1B8320);
      branche(450, 820, 200, radians(270));
    }
    //   x+= speed;
    //   if (x > 800) {
    //     speed = 0;
    //   }
  if (mousePressed) {
      noStroke();
      fill(0, 172, 255);
      rect(0, 230, 900, 1000);
      stroke(0);
      fill(#6F5A5A);
      rect(0, 800, 900, 200);
    }}

  class cloud {
    //random 
    float x = random(width);      //x-coords 
    float y = random(0, 100);      //y-coord 
    color c = color(255, 50);      //color of the cloud
    float puff = random(40, 120); 

    cloud() {
    }
    void update() {
      //clouds moving
      x = x + random(0, .1);
      y= y + random(-1, 1);
    } 
    void display() {
      noStroke();
      fill(c);
      ellipse(x, y, puff, puff);
    }
  }
  void Sun() {
    int r=300; 
    ellipseMode(CENTER);
    noStroke();
    fill(#F5EE0C);
    ellipse(0, 0, r, r);
    if (keyCode==' ') {
      int x=400;
      ellipseMode(CENTER);
      noStroke();
      fill(#F5EE0C);
      ellipse(0, 0, x, x);
    }
  }

  void branche(float x, float y, float s, float a) {
    strokeWeight(s*0.10);
    a+=radians(random(-7, 7));
    float newx = x+cos(a)*s;
    float newy = y+sin(a)*s;
    line(x, y, newx, newy);
    if (s>3) {
      branche(newx, newy, s*(random(0.55, 0.70)), a-radians(random(17, 12)));
      branche(newx, newy, s*(random(0.55, 0.70)), a+radians(random(17, 12)));
    }
  }
  void root(float x, float y, float s, float a) {
    strokeWeight(s*0.04);
    a+=radians(random(-7, 7));
    float newx = x+cos(a)*s;
    float newy = y+sin(a)*s;
    line(x, y, newx, newy);
    if (s>3) {
      branche(newx, newy, s*(random(0.55, 0.70)), a-radians(random(17, 12)));
      branche(newx, newy, s*(random(0.55, 0.70)), a+radians(random(17, 12)));
    }
  }
  void bud(float x, float y, float s, float a) {
    strokeWeight(s*0.05);
    a+=radians(random(-7, 7));
    float newx = x+cos(a)*s;
    float newy = y+sin(a)*s;
    line(x, y, newx, newy);
    if (s>3) {
      branche(newx, newy, s*(random(0.55, 0.70)), a-radians(random(17, 12)));
      branche(newx, newy, s*(random(0.55, 0.70)), a+radians(random(17, 12)));
    }
  }

  void wateringcan () {
    noStroke();
    color c=#EA1C35;
    //  float opacity=1;
    fill (255, 0, 0);
    ellipseMode (CENTER);
    ellipse(787-q, 695, 30, 50);
    fill(0, 172, 255);
    ellipse(787-q, 695, 10, 30);

    stroke (255, 0, 0);
    strokeWeight (.5);
    fill (255, 0, 0);
    ellipseMode(CENTER);
    ellipse(670-q, 673, 10, 30);
    beginShape();
    vertex (780-q, 730);
    vertex (730-q, 740);
    vertex (700-q, 680);
    vertex (780-q, 660);
    endShape();
    stroke (255, 0, 0);
    strokeWeight (7);
    beginShape ();
    vertex (715-q, 710);
    vertex(670-q, 670);
    endShape();
  }

  //void plantfood (float x, float y) {
  //  fill(#064D17);
  //  rect(280, 790, 60,90);
  //  hip = loadFont("AppleSymbols-48.vlw");
  //  textFont (hip, 25);
  //  fill(#1CC67B);
  //  textAlign(CENTER);
  //  text("Plant", 310, 830);
  //  text("Food", 310, 860);



