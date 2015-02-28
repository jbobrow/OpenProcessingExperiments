
//Chun Yi Wu 
// Spring season!!
// Butterfly passing through the grass ,it seems like river of rainbow .
// The flag waving.

float xstart, xnoise, ynoise, t;
//radius  
int s = 17, S = 500;
int m = 0  ;
//arc function
float ONE_HALF_PI = PI + HALF_PI;
float flying;
void setup() {
  size(1000, 550, P3D);
  //noLoop();
  frameRate(5);
}
void draw() {
  background(255);
  count(20, 20, 14, 14);
  flag( 300, 500 );
}


void flag(int c, int d) {
  float wave = random(20);
  pushMatrix();
  stroke(0);
  strokeWeight(0.5);
  translate(100, 0, -500);
  line(-350+wave, c-10, -350, d);
  fill(255,255,229,50);
  xnoise = random(10);
  ynoise = random(10);
  beginShape();
  curveVertex(-350+wave,c);
  curveVertex(-350+wave,c);
  curveVertex(-250+wave,c-10+3*noise(xnoise, ynoise));
  curveVertex(-150+wave,c+50+noise(xnoise, ynoise));
  curveVertex(-150+wave,c+50+noise(xnoise, ynoise));
  curveVertex(-250+wave,c+60+noise(xnoise, ynoise));
  curveVertex(-250+wave,c+60+noise(xnoise, ynoise));
  curveVertex(-270+wave,c+60+2*noise(xnoise, ynoise));
  curveVertex(-350+wave,c+40);
  curveVertex(-350+wave,c+40);
  endShape();
  popMatrix();
  
}
void count(int o, int p, int q, int r) {
  flying +=25; 
  ynoise = random(30);
  //////////////for//////////////
  for (int y = 0; y <= height; y+=o) {
    ynoise += 0.2;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=p) {
      xnoise += 0.2; 
      butterfly(x, y, noise(xnoise, ynoise), flying);
    }
  }
  ynoise = random(10);
  //////////////for//////////////
  for (int y = 0; y <= height; y+=q) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=r) {
      xnoise += 0.1;
      ground(x/2, y/2, 2*noise(xnoise, ynoise), -680, random(50));
      ground(x/2, y/2, 2*noise(xnoise, ynoise), -10, random(0, 30)-30);
      ground(x/2, y/2, 3*noise(xnoise, ynoise), 500, random(40)-20);
      ground(x/2, y/2, 3*noise(xnoise, ynoise), 1030, random(10, 80));
    }
  }
  pushMatrix();
  fill(0);
  
  textSize(11);
  text("The world comes filled with color and the scent of delicious greenery. ", 335, 240);
  popMatrix();
} 

void ground(float a, float b, float noiseFactor, float m1, float h) {
  pushMatrix();
  translate(m1, 550, -b*20);
  float ch = noiseFactor ;
  stroke(33, random(40, 100), 4, 200);
  beginShape();
  curveVertex(a, b); 
  curveVertex(a, b);  
  curveVertex(a+random(20-ch), b-32-h); 
  curveVertex(a+random(20-ch), b-57-h);
  curveVertex(a+random(6-ch), b-70-h);
  curveVertex(a+random(6-ch), b-70-h);
  endShape();
  popMatrix();
}

void butterfly(float a, float b, float noiseFactor, float m3) {
  float len = 2 * noiseFactor; 
  pushMatrix();
  translate(m3, 330, -a*27);
  rotate(-1.5);
  scale(noiseFactor*2);
  ////// shape  ///////// 
  noFill();
  strokeWeight(0.6);
  stroke(random(255), random(255), random(255)); 
  if (random(S) < m) {          
    arc(a, b, s, s, 0, HALF_PI);
    arc(a+s-3, b+s-3, s, s, -PI, -HALF_PI);
  } 
  else {
    arc(a+s-4, b+4, s, s, HALF_PI, PI);
    arc(a, b+s, s, s, ONE_HALF_PI, TWO_PI);
  }
  popMatrix();
}




void mouseClicked() { 
  m = mouseX; 
  redraw();
}




