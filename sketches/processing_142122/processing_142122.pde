
// This would be a good candidate for using OOP (objects), but I don't 
// want to complicate it too much, as it is in response to
// http://funprogramming.org/29-Rectangle-spinning-around-the-mouse-pointer.html#comment-1310753018

// Rotations and rotation increments for three rectangles
float r0 = 0, r0inc =  PI/90;
float r1 = 0, r1inc = -PI/100;
float r2 = 0, r2inc =  PI/70;

void setup() {
  size(500, 500);
  background(#113388);
  rectMode(CENTER);
  noStroke();
  smooth();
}

void draw() {
  background(#113388);

  drawBlurRect(width*0.5, height*0.5, r0, r0inc, 200, 255);
  drawBlurRect(width*0.7, height*0.5, r1, r1inc, 100, #FF0000);
  drawBlurRect(width*0.6, height*0.7, r2, r2inc, 150, #FFCC00);

  r0 += r0inc;
  r1 += r1inc;
  r2 += r2inc;
}
void drawBlurRect(float x, float y, float ang, float anginc, float sz, color col) {
  pushMatrix();
  translate(x, y);
  rotate(ang);
  // for each blurry rectangle, draw 10 rectangles with different transparency
  for (int c=0; c<10; c++) {
  
    // Easy alternative: linear mapping of transparency from 5 to 255 
    //fill(col, 5 + (1-c/10.0) * 250);
    
    // Less easy alternative: non-linear mapping of transparency from 5 to 255
    // spending more time closer to 5, so the transparency quickly
    // decreases and stays low.
    // Why? See:
    // http://www.wolframalpha.com/share/clip?f=d41d8cd98f00b204e9800998ecf8427epfkcpiv0li
    fill(col, 5 + pow(1-c/10.0, 5) * 250);
    
    // use 40 just for fun (center of rotation is displaced)
    rect(40, 0, sz, sz);
    rotate(-anginc);
  }
  popMatrix();
}

