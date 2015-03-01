

public void setup() {
  size(800, 600, P2D);
  
  fill(4);
}
  
public void draw() {    
  background(#58F2DC);
  for (int i = 0; i < 50; i++) {
    float x = random(width);
    float y = random(height);
    float z0 = random(-100, 100);
    text("Hello Art", x, y);
  }
  if (frameCount % 40 == 0) println(frameRate);
}


