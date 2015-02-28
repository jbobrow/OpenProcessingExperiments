
void setup() {
  size(500,500);
  smooth();
  strokeWeight(2);
  for (int i=0; i<11; i++) { //test goes out to 11 so that the canvas is filled completely
    int x=50*i;
    for (int j=0; j<11; j++) {
      int y=50*j;
      hummingbird(x,y); //calls the hummingbird
    }
  }
}
  void hummingbird(int moveX, int moveY) {
    fill(random(0,255),random(0,255),random(0,255)); //makes them all different birds
    beginShape(); //the hummingbird is made with beginShape
    vertex(0+moveX,0+moveY); //each vertex is named separately because there's no pattern to it
    vertex(-30+moveX,-10+moveY); //notice that each X coordinate has +moveX while each Y coordinate has +moveY. When the hummingbird function gets called, those tell it where to go.
    vertex(0+moveX,-40+moveY);
    vertex(0+moveX,-20+moveY);
    vertex(10+moveX,-10+moveY);
    vertex(20+moveX,-10+moveY);
    vertex(50+moveX,-0+moveY);
    vertex(20+moveX,10+moveY);
    vertex(10+moveX,30+moveY);
    vertex(20+moveX,40+moveY);
    vertex(10+moveX,40+moveY);
    vertex(0+moveX,30+moveY);
    vertex(0+moveX,10+moveY);
    vertex(-30+moveX,40+moveY);
    vertex(-40+moveX,30+moveY);
    vertex(-30+moveX,10+moveY);
    vertex(0+moveX,0+moveY);
    endShape();
  }

