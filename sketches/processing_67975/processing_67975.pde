
float r;
float r_x = 150;
float r_y = 150;
float alp = 255;
float c;
float w = random(1,10);

float s = random(90);

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  //frameRate(10);
}

void draw() {
  fill(360, 5);
  noStroke();
  rect(0, 0, width, height);

  ripple();
}

void ripple() {
  pushMatrix();
  translate(r_x, r_y);
  for (int i = 0 ; i < 8;i++) {
    rotate(radians(360*i / 8));
    noFill();
    strokeWeight(w);
    stroke(c,50,100, alp);
    arc(0, 0, r*2, r, radians(s), radians(180-s));
    r+=0.2;
    alp-=0.25;
  }    
  popMatrix();

  if (alp < 0) {
    alp = 255;
    r = 0;
    s = random(90);
    c += 15;
    if(c > 360){
      c = 0;
    }
    w = random(1,10);
  }
}

