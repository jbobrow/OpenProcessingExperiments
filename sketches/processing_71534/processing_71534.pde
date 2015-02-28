
// void setup cannot be recalled
void setup() {
  size(800,800);
  colorMode(HSB);
  smooth();
  noStroke();
  background (255);
}

 //Circle trail
  void draw() {
  fill (random (164), random (60), random(mouseY));
  ellipse (mouseX, mouseY, mouseX, mouseY);
   fill (255);
  text ("PRESS ENTER", 700,750);
}  
 
 //press enter button (change the backgroudn)
    void keyPressed() {  
       if (key == ENTER) 
       background(random(164),random(60),mouseY);      // clears the background
       fill (random(100),random(90),random(100));
 }

//reset
  void mouseClicked() {
   background (255);
  }
