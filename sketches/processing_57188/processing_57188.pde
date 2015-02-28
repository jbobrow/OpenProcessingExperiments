
float s = 35, cx= s, cy=s, t=0, k = 1;
float r, i = 1;

void setup() {
  size(1200, 700);
  smooth();
  colorMode(HSB);
  background(120);
}

void draw() {

  r = s/k;

//  fill(120, 50);
background(120);
//  rect(0, 0, width, height);

  //  noFill();
  stroke(255,150);

  float x = 10*cos(radians(5*s));
  float y = 10*sin(radians(10*s));

  for ( int i = 1; i < width; i += s) {
    for ( int j = 1; j < height; j += s) {

      float ci = map(i, 1, width, 150, 200);
      float cj = map(j, 1, height, 100, 200);

      pushMatrix();
      translate(cx+2*i, cy+2*j);  

      fill(ci+50*sin(radians(t)), 200, 200, 100);
//      stroke(ci+20*sin(radians(t)), 200, 200);
      beginShape();
      vertex(2*r, 0);
      vertex(s, s/r);
      vertex(s, -(r-1)*s/r);
      vertex(2*r, -s);
      vertex(2*r, 0);
      endShape(CLOSE);

      beginShape();
      vertex(-2*r, 0);
      vertex(-s, -s/r);
      vertex(-s, (r-1)*s/r);
      vertex(-2*r, s);
      vertex(-2*r, 0);
      endShape();

      fill(cj+20*cos(radians(t)), 200, 200, 100);
 //     stroke(cj+20*sin(radians(t)), 200, 200);      
      beginShape();
      vertex(2*r, 0);
      vertex(-s, s/r);
      vertex(-s, -(r-1)*s/r);
      vertex(2*r, -s);
      vertex(2*r, 0);
      endShape(CLOSE);
      
      beginShape();
      vertex(-2*r, 0);
      vertex(s, -s/r);
      vertex(s, (r-1)*s/r);
      vertex(-2*r, s);
      vertex(-2*r, 0);
      endShape(CLOSE);
      
      popMatrix();

    }
  }

  t += 10;
  k += i*1;

  if ( k >= s || k <= -s) {
    i *= -1;
  }
}

void mousePressed() {
  save("capturas/img"+frameCount+".png");
}


