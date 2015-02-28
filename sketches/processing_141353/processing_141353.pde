
int num=8;
float[] px = new float[num];
float[] py = new float[num];
float angle=-PI/2, vari, mvari, theta, step, radius = 150;

void setup() {
  size(500, 500);
  strokeWeight(1);
  //stroke(#D9AD70);
  //fill(#D75322);
  initCircle();

  //drawCircle();
}

void draw() {
  //background(#143641);
  background(255);
  drawCircle();
  mvari = map(sin(theta),-1,1,0,200);
  theta += 0.0523;
  
  //if (frameCount%4==0 & frameCount<121) saveFrame("image-###.gif");
  
}



void drawCircle() {
  noFill();
  beginShape();
  for (int i=0; i<num+3; i++) {
    vari = 0;
    if (i%num==0) vari = mvari;
    if (i%num==num/2) vari = -mvari;
    ellipse(px[i%num], py[i%num]+vari, 5, 5);
    curveVertex(px[i%num], py[i%num]+vari);
  }
  endShape();

}

void mouseReleased() {
  initCircle();
}

void initCircle() {
  for (int i=0; i<num; i++) {
    px[i] = width/2 + cos(angle)*radius;
    py[i] = height/2 + sin(angle)*radius;
    //px[i] = random(width*.1, width*.9);
    //py[i] = random(height*.1, height*.9);
    angle += (TWO_PI/num);
  }
}

