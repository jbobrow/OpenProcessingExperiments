
int tc = 0;
int ct = 130;
void setup() {
  size(600, 800);
  background (191, 73, 242);
}
void draw() {
  tc++;
  colorMode(RGB);
  if (tc>100 && mousePressed || tc>300) {
    tc=0;
  }
  if (ct>200) {
    ct=130;
  }
  fill(244, 244, 0);
  rect(150, 150, 300, 300);
  ellipse(mouseX, mouseY, tc, tc);

  stroke(150, 255, 255);
  fill(255, 0, 255);
  ellipse(300, 300, 150, 150);




  colorMode(RGB);



  fill(255, 175, 222, 155);
 
  stroke(255, 255, 255);
  ellipse(pmouseX, 300, 25, 25);
  ellipse(pmouseY, 300, 12, 12);
  rect(300, 300, 37, 37);
}
void mouseDragged() {
  noStroke();
  colorMode(HSB);
  fill(random (180, 250), 200, 200);
  float aleatorioX= random(-50, 50);
  float aleatorioY= random(-50, 50);
  float tamano= random(5, 50);
  ellipse(mouseX+aleatorioX, mouseY+aleatorioY, tamano, tamano);
}


