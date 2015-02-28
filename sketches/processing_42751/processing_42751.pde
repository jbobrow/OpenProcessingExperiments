
/* 
 Daniel C. Young
 Fuzzball Animation
 10/14/2011
 */

float easing=0.8;
float easeX=0.0;

void setup() {
  size(500, 500);
  smooth();
  background(30);
  colorMode(HSB);
  frameRate(30);
}

void draw() {
  fill(30,30);
  noStroke();
  rect(0,0,width,height);
  
  // replace mouseX with eased value
  easeX += (mouseX-easeX) * easing;
  
  for (int i=0;i<30;i++) {
    // map size, noise, and hue to mouseX
    float syz = map(easeX,0,width,30,180);
    float nyz = map(easeX,0,width,0,10);
    float clr = map(easeX,0,width,1,6.5);
    drawSpiral(i*syz, i*0.2, nyz+i, clr*i);
  }
}

void drawSpiral(float _endAng, float _angStep, float _noise, float _hue) {
  float px,py,x,y;
  float seed = random(10);  // initial radius
  px=py = 0.0;

  pushMatrix();
  translate(width/2, height/2);
  for (float ang=0; ang<_endAng; ang+=_angStep) {
    // adjust for different results
    _noise += 0.5;  
    seed += 0.2;

    // apply offset to initial radius
    float rad = seed + (noise(_noise)*100) - 50;

    x = rad*cos(radians(ang));
    y = rad*sin(radians(ang));

    // avoid drawing the first time
    if (px != 0.0) {
      stroke(_hue,200,200,60);
      strokeWeight(0.25);
      line(px, py, x, y);
    }

    px = x;
    py = y;
  }
  popMatrix();
}


