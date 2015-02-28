
import processing.pdf.*;

void setup() {
  size(500, 500, PDF, "rtadeu_mola_wallpaper.pdf");
  background(178, 11, 11);
  smooth();
}

void draw() {
  int gridSize = width/10;
  for (int col = 0; col < 10; col++) {
    for (int row = 0; row < 10; row++) {
      for (int i = 0; i <= 1; i++) {
        if (i == 0) {
          strokeWeight(random(3.5, 4.0));
          stroke(196, 211, 240);
        }
        else {
          strokeWeight(random(1.5, 2.5));
          stroke(39, 74, 142);
        }
        
        int dx = gridSize * col;
        int dy = gridSize * row;
        // top left quadrant
        line(13+dx, 12+dy, 12+dx, 16+dy);
        line(12+dx, 16+dy, 9+dx, 16+dy);
        line(9+dx, 16+dy, 10+dx, 9+dy);
        line(10+dx, 9+dy, 17+dx, 9+dy);
        line(17+dx, 9+dy, 17+dx, 20+dy);
        line(17+dx, 20+dy, 6+dx, 21+dy);
        line(6+dx, 21+dy, 5+dx, 5+dy);
        line(5+dx, 5+dy, 21+dx, 4+dy);
        line(21+dx, 4+dy, 20+dx, 25+dy);
        line(20+dx, 25+dy, 5+dx, 26+dy);
        // bottom left quadrant
        line(5+dx, 26+dy, 5+dx, 45+dy);
        line(5+dx, 45+dy, 22+dx, 46+dy);
        line(22+dx, 46+dy, 21+dx, 30+dy);
        line(21+dx, 30+dy, 9+dx, 31+dy);
        line(9+dx, 31+dy, 10+dx, 40+dy);
        line(10+dx, 40+dy, 16+dx, 41+dy);
        line(16+dx, 41+dy, 16+dx, 36+dy);
        line(16+dx, 36+dy, 12+dx, 34+dy);
        line(12+dx, 34+dy, 12+dx, 37+dy);
        // top right quadrant
        line(37+dx, 12+dy, 37+dx, 15+dy);
        line(37+dx, 15+dy, 39+dx, 16+dy);
        line(39+dx, 16+dy, 40+dx, 9+dy);
        line(40+dx, 9+dy, 32+dx, 10+dy);
        line(32+dx, 10+dy, 33+dx, 20+dy);
        line(33+dx, 20+dy, 45+dx, 20+dy);
        line(45+dx, 20+dy, 42+dx, 5+dy);
        line(42+dx, 5+dy, 28+dx, 4+dy);
        line(28+dx, 4+dy, 26+dx, 26+dy);
        // bottom right quadrant
        line(26+dx, 26+dy, 45+dx, 25+dy);
        line(45+dx, 25+dy, 44+dx, 45+dy);
        line(44+dx, 45+dy, 28+dx, 45+dy);
        line(28+dx, 45+dy, 27+dx, 30+dy);
        line(27+dx, 30+dy, 40+dx, 30+dy);
        line(40+dx, 30+dy, 40+dx, 40+dy);
        line(40+dx, 40+dy, 32+dx, 40+dy);
        line(32+dx, 40+dy, 33+dx, 34+dy);
        line(33+dx, 34+dy, 37+dx, 35+dy);
        line(37+dx, 35+dy, 36+dx, 37+dy);
      }
    }
  }
  exit();
}               
