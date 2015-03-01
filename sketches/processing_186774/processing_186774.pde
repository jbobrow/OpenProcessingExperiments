
void setup() {
  size(400,400);
  background(155,50,50);
  fill(155);
  ellipse(200,200,200,200);
}
void draw() {
  fill(165,83,83);
  ellipse(200,200,150,150);
  fill(188,68,68);
  ellipse(200,200,100,100);
  fill (209,48,48);
  ellipse(200,200,50,50);
  fill (245,10,10);
  ellipse(200,200,10,10);
}
  void mousePressed() {
  noLoop();
    fill(83,83,165);
  ellipse(200,200,150,150);
  fill(68,68,188);
  ellipse(200,200,100,100);
  fill (48,48,209);
  ellipse(200,200,50,50);
  fill (10,10,245);
  ellipse(200,200,10,10);
  }
  void mouseDragged() {
  fill(83,165,83);
  ellipse(200,200,150,150);
  fill(68,188,68);
  ellipse(200,200,100,100);
  fill (48,209,48);
  ellipse(200,200,50,50);
  fill (10,245,10);
  ellipse(200,200,10,10);
  loop();
}
