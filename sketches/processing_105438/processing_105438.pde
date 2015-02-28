
void setup() {
  size(540, 540);
  colorMode(HSB);
}
void draw() {

  int dis = 60; 
  for  (int i=0; i<500; i+=dis) {
    for  (int j=0; j<500; j+=dis) {
    noStroke();
      float distance = abs(mouseX-i);
      fill (distance);
      star(i, j, 50);
    }
  }
}
void star(int i, int j, int size) { 
  //fill(200, 100, 200); 
  beginShape();//begin drawing the star
  vertex(30+i, 0+j);
  vertex(38+i, 20+j);
  vertex(58+i, 20+j);
  vertex(40+i, 35+j);
  vertex(53+i, 58+j);
  vertex(30+i, 43+j);
  vertex(7+i, 58+j);
  vertex(20+i, 35+j);
  vertex(2+i, 20+j);
  vertex(22+i, 20+j);
  vertex(30+i, 0+j);
  endShape();//end of the shape
}



