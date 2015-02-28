
//Problem Set 3.3
//by: Nathan Smofsky

Explode[] explodes = new Explode[500];

boolean paused = false;

float mouse; //position 

void setup() {
  size(700, 500); 
  smooth();
  noStroke();
  rectMode(CENTER);

  for (int i=0; i < explodes.length; i++) {

    float x = random(width);   // mouseX = explosion distance
    float y = random(height);  // mouseY = # dots


    explodes[i] = new Explode(x, y);
  }
}

//---------------------------------------------------------------
void draw() {
  background(0);
  rotate(-45);// the angle 

  translate(-200, -100);
  int numRect = int(map(mouseY, 0, height, 0, explodes.length));
  for (int i=0; i < numRect; i++) {// loop 

    explodes[i].display();
  }
}


// class goes here 
class Explode {
  float x;
  float y;
  color c;


  Explode( float boomX, float boomY ) {
    this.x = boomX;
    this.y = boomY;
  } 

  //----------------------------------------------------
  void display() {

    mouse = mouseX * 0.001;// explosion distance

    rectMode(CENTER);
    pushMatrix();

    translate(this.x * mouse, (this.y * mouse)+height/2);// position

    c = int( map(c, 0, height, 50, 200) );// colours 
    fill(mouseX, c, mouseY);
    ellipse(0, 0, 10, 10);
    popMatrix(); // pop back
  }
}


