
//Mut

void setup () {
  size (400, 400);
  strokeWeight(5);
  smooth();
  background(255);
}

void draw () {
//fill(100, 10);
//rect(0,0, width, height);
//versatz = versatz + 0.15;
    for (int y = 155; y <= 355; y = y + 20) {
      line (155, y, 0, y+200);
    }

}
