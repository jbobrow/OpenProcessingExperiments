
PFont font;

void setup() {
  size(640, 480);
  background(0);
  font = loadFont("Abel-Regular-48.vlw");
  textFont(font, 32);
}

void draw() {
  int x = 5;
  int y = 5;
  for(int i = 1; i < 4; i ++) {
    pushMatrix();
    translate(width/i-150, height/i-150);
    smooth(); 
    beginShape(TRIANGLES); 
      smooth();
      String all_text = "Figure " + i;
      text(all_text, 30, 75 );
      vertex(30, 75);
      vertex(40, 20);
      vertex(50, 75);
      vertex(60, 20);
      vertex(70, 75);
      vertex(80, 20);
    endShape(); 
    popMatrix(); 
  }
}
