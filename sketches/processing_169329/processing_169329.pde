
float theta;

void setup() {
  size(500, 500);
  frameRate(5);
}

void draw() {
  background(20);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  for (int i=1; i<10; i++) {
    String s="";
    int n = int(map(sin(theta+TWO_PI/9*i), -1, 1, 1, i+1));
    for (int j=1; j<=n; j++) {
      s += i;
    }
    text(s, width/2, 20+1.2*i*textAscent());
  }
  theta += TWO_PI/9;
  //saveFrame("image-###.gif");
  //if (frameCount==9) noLoop();
}
