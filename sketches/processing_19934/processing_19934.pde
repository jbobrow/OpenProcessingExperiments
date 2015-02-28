
float starH;
float starS;
float starB;

void setup() {
  size (600, 600);
  colorMode(HSB);
  background(0);
  smooth();
}

void draw(){

  starH = random(255);
  starS = random(50, 255);
  starB = random(50, 255);
  
  //Draw a star that follows the mouse
  fill(starH,starS,starB,100);
  noStroke();
  
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX+15, mouseY);
  vertex(mouseX+20, mouseY-14.15);
  vertex(mouseX+25, mouseY);
  vertex(mouseX+40, mouseY);
  vertex(mouseX+28, mouseY+9.38);
  vertex(mouseX+32.2, mouseY+23.5);
  vertex(mouseX+20, mouseY+15.3);
  vertex(mouseX+7.7, mouseY+23.5); 
  vertex(mouseX+11.7, mouseY+9.38); 
  endShape(CLOSE);

}

void mousePressed() {
 background(0);
}

void keyPressed() {
  println("Saved!");
  save("star.jpg");
}

