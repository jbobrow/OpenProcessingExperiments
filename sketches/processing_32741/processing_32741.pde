
float[] x=new float [7500];
int[] g= {-30000, -29970, -29940, -29910, -29880, -29850, -29820, -29790, -29760, -29730, -29700};
void setup() {
  size(1000, 500);
  smooth();
  noStroke();
  for (int c=0;c<x.length;c++) {
    x[c]=random(-20000, 500);
  }
}
void draw() {
  background(0);
  for (int c=0;c<x.length;c++) {
    fill(200, 200, 50);
    x[c]+=8;
    float y=c*0.4;
    arc(x[c], y, 10, 10, 0.75, 5.5);
  }
  fill(200, 5, 5);
  for (int b=0;b<g.length;b++) {
    g[b]+=11;
  }
  beginShape();
  vertex(g[0], 475);
  vertex(g[1], 445);
  vertex(g[2], 475);
  vertex(g[3], 445);
  vertex(g[4], 475);
  vertex(g[5], 445);
  vertex(g[6], 475);
  vertex(g[7], 445);
  vertex(g[8], 475);
  vertex(g[9], 445);
  vertex(g[10], 475);
  vertex(g[10], 175);
  vertex(g[0], 175);
  vertex(g[0], 475);
  endShape();
  ellipse(g[5], 175, 300, 330);
  fill(255);
  ellipse(g[5]+60,180,100,100);
  ellipse(g[5]-60,180,100,100);
  fill(0);
  ellipse(g[5]+60,180,50,50);
  ellipse(g[5]-60,180,50,50);
}


