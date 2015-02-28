
int num = 14;
float a, dis, radius, theta, endpos;
float[] angle = new float[num];
//PVector[] center = new PVector[num];


void setup() {
  size(500, 500);
  background(255);
  noFill();
  strokeCap(SQUARE);

  radius = 180;
  float sw = 20;

  strokeWeight(sw);

  // calculating the distance between two circles
  float cx = sin(TWO_PI/num)*radius;
  float cy = cos(TWO_PI/num)*radius;
  dis = dist(0, radius, cx, cy)+1.2;

  for (int i=0; i<num; i++) {
    angle[i] = a; 
    a += (TWO_PI/num);
  }
}


void draw() {
  background(#4F3538);
  translate(width/2, height/2);

  for (int i=0; i<num; i++) {

    pushMatrix();
    rotate(angle[i]);
    float x = 0;
    float y = -radius;
    stroke(#F0A24C);
    //endpos = map(sin((theta-angle[i])*2), -1, 1, PI*1.1, TWO_PI);
    endpos = map(sin(theta), -1, 1, PI*1.1, TWO_PI*1.025);
    /*
    if (i%2==0) {
      arc(x, y, dis, dis, 0, PI);
    } 
    else {
      arc(x, y, dis, dis, PI*.97, endpos);
    }
    */
    arc(x, y, dis, dis, PI*.97, endpos);
    stroke(#EB3979);
    arc(x, y*.7, dis*.7, dis*.7, PI*.97, endpos);
    stroke(#EFD5AE);
    arc(x, y*.4, dis*.4, dis*.4, PI*.97, endpos);

    popMatrix();
  }
  
  fill(#30A4A1);
  noStroke();
  ellipse(0,0,70,70);
  noFill();

  theta += 0.0523*2;
}

