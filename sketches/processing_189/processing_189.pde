
float sc = 0.0;
float mn = 0.0;
float hr = 0.0;
PFont arial;

void setup() {
  size(900,450, P3D);
  arial = loadFont("Arial-Black-96.vlw");
  noStroke();
} 

void draw() {
  background(255);
  fill(0);
  triangle(width/2-5, 0, width/2, 25, width/2+5, 0); 
  textFont(arial, 96);
  translate(450,350,-1000);
  rotateX(mouseY/1000.0);
  
  Hand(hr, 1, 5, 50, -600);
  Hand(mn, 5, 10, 100, -200);
  Hand(sc, 5, 50, 150, 200);

  sc = sc + 0.0036;
  mn = mn + 0.00006;
  hr = hr + 0.0000001;
  
  if (sc > TWO_PI) sc = 0.0;
  if (mn > TWO_PI) mn = 0.0;
  if (hr > TWO_PI) hr = 0.0;

}

void Hand (float move, int rescale, int spoke, int gray, int level) {
    fill(gray,gray,gray,225);
  for( int s = 0; s < 12; s++ ){
    float shift = s * (PI/6.0);
    for( int w = 0; w < spoke; w++ ){
      int numSpace = w * 150;
      pushMatrix();
      rotateY(move+shift-HALF_PI);
      translate(numSpace, level, 0);
      text((rescale*12)-(rescale*s), 25,0,0);
      popMatrix();
    }
  }
}

