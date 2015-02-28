
//import fullscreen.*;

PFont font;

Segment segment;
//FullScreen full;

void setup(){
  size(600, 600);
  //full = new FullScreen(this);
  //full.enter();
  smooth();
  
  font = loadFont("Monaco-24.vlw");
  textFont(font, 10);
  
  background(0);
  fill(255);
  textAlign(LEFT);
  text("TOPOLOGY GENERATOR", 10, height-400);
  /*
  text("IN THIS SKETCH, EACH RECURSION OF THE FRACTAL IS GIVEN A LIFETIME BASED ON VARIABLE PARAMETERS SET RANDOMLY BY THE COMPUTER", 10, height-300);
  text("THE PERMUTATIONAL POSSIBILITIES OF THE SKETCH MAKES IT HIGHLY UNLIKELY TO EVER GET TWO IDENTICAL RESULTS", 10, height-280);
  */
  text("CLICK MOUSE TO GENERATE FRACTAL PATTERNS", 10, height-240);
  text("[ESC] TO EXIT", 10, height-220);
}

void draw(){
}

void render(float rot){
  segment = new Segment(200.0, 1.0, rot, 2);
  int x = width/2;
  int y = height/2;
  background(255);
  translate(x, y);
  stroke(0);
  //strokeWeight();
  segment.run();
}

void mousePressed(){
  render(450); //try 180, 225, 360, 450
}

class Segment{
  float b, l, r;
  float g;

  Segment(float ib, float il, float ir, float ig){
    b = ib;
    l = il;
    r = ir;
    g = ig;
  }

  void run(){
    seg(b, l, r, g);
  }

  void seg(float b, float l, float r, float g){

    b *= 0.8;
    l *= 0.92;
    if (b > g){
      stroke(0, b*4);
      float n = noise(0, -b);
      r += n;
      if (random(0, 0.95)<l){
        pushMatrix();
        rotate(radians(r+n));
        rect(0, 0, 0, -b+n);
        translate(0, -b+n);
        seg(b, l, r, g);
        popMatrix();

        pushMatrix();
        rotate(radians(-r+n));
        rect(0, 0, 0, -b+n);
        translate(0, -b+n);
        seg(b, l, r, g);
        popMatrix();

        pushMatrix();
        rotate(radians((-r+n)/5));
        rect(0, 0, 0, -b+n);
        translate(0, -b+n);
        seg(b, l, r, g);
        popMatrix();
      }
      else{
        pushMatrix();
        rect(0, 0, 0, (-b+n)/2);
        translate(0, -b+n);
        popMatrix();
      }
    }
  }
}






