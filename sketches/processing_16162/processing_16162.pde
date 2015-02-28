

void setup()
{
  size(600,600);
  smooth();
}

void draw()
{
  background(255);
  file(200,200,1,1,255);
  folder(0,0,1,1,255);
}
void file(int x, int y, int sw, int sh, int t)
{
  pushMatrix();
  translate(x,y);
  scale(sw,sh);
  stroke(200,t);
  fill(240,t);
  quad(100,100,170,110,170,210,100,200);
  fill(230,t);
  stroke(170,t);
  beginShape();
  vertex(150,106);
  vertex(170,128);
  bezierVertex(163,124,157,122,152,130);
  bezierVertex(152,125,152,111,150,106);
  endShape();
  fill(255);
  noStroke();
  triangle(145,101,180,140,180,105);
  fill(0);
  ellipse(120,135,9,10);
  ellipse(150,138,8.5,10);
  stroke(70,t);
  fill(0,0);
  beginShape();
  vertex(120,165);
  bezierVertex(121,173,122,174,127,175);
  vertex(142,178);
  bezierVertex(147,180,148,184,149,188);
  endShape();
  popMatrix();
}

void folder(int x,int y,int sw,int sh,int t)
{
  pushMatrix();
  translate(x,y);
  scale(sw,sh);
  stroke(242,192,0,t);
  fill(255,239,160,t);
  beginShape();
  vertex(189,186);
  vertex(199,123);
  bezierVertex(198,116,197,113,192,111);
  vertex(150,103);
  vertex(149,94);
  vertex(119,89);
  vertex(116,100);
  vertex(110,99);
  vertex(102,170);
  endShape();
  fill(255,217,26,t);
  beginShape();
  vertex(100,170);
  vertex(189,186);
  vertex(180,124);
  bezierVertex(176,116,175,115,164,112);
  vertex(140,108);
  vertex(137,124);
  vertex(93,116);
  vertex(100,170);
  endShape();
  popMatrix();
}


