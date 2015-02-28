
void setup () {
  size (250, 250);
  background (30);
  smooth ();
  frameRate (18);
};

float x;
float y;

void draw () {
  fill (30, 25);
  noStroke ();
  rect (0, 0, width, height);
  

  y += 10;
  stroke (255,10);
  
  for (x = random(x); x < 250; x += 10) {
    line (width/2, height/2, random(x), random(x));
    
    line (width/2+50, height/2+50, random(x), random(x));
    line (width/2-50, height/2-50, random(x), random(x));
    line (width/2+100, height/2+100, random(x), random(x));
    line (width/2-100, height/2-100, random(x), random(x));
    
    line (width/2, height/2+20, random(x), random(x));
    line (width/2, height/2-20, random(x), random(x));
    line (width/2, height/2+60, random(x), random(x));
    line (width/2, height/2-60, random(x), random(x));    
  }
  
};

void mouseMoved() {
  
  float d = dist (width/2, height/2, mouseX, mouseY);
  noFill();
  stroke (#D1D161);
  ellipse (width/2, height/2, d, d);
  
  ellipse (width/2+50, height/2+50, d-50, d-50);
  ellipse (width/2-50, height/2-50, d-50, d-50);
  
  ellipse (width/2+100, height/2+100, d-100, d-100);
  ellipse (width/2-100, height/2-100, d-100, d-100);

};

