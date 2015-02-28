
PImage background1;

void setup() {
  size(900, 600);
  smooth();
  background(255);
  strokeWeight(4);
  
  background1 = loadImage("waves.png");
}
void draw() {
  image (background1, 0, 0);
beginShape(); 
  vertex(125,400);
  vertex(115,410);
  vertex(118,415);
  vertex(365,403);
  vertex(380,398);
  vertex(395,390);
  fill(255,0,0);
  endShape(CLOSE);
  line(200,405,205,360);
  line(205,360,250,320);
  line(250,320,305,350);
  line(305,350,300,400);
  line(250,320,265,205);
  ellipse(269,185,50,50);
  point(260,177);
  point(280,175);
  beginShape();
  vertex(265,193);
  vertex(280,193);
  vertex(276,198);
  vertex(272,200);
  vertex(268,198);
  endShape(CLOSE);
  fill(255,255,255); 
  line(210,250,310,260);
  line(210,250,165,280);
  line(310,260,345,290);
}



