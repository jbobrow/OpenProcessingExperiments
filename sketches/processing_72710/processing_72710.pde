
//David Kim
//Creative Programming
//Assignment 1 mod
//10-1-12

//variables
int quadChange = 4;
float fillChange = 5;
float angle = (PI/2);

void setup() {
  size(800, 800);
  background(0, 0, 0);
  smooth();
}

void draw() {
  //quads
  strokeWeight(1);
  stroke(200, 200, 200, 150); //light grey, 50% opacity
  for(int i=0; i<102; i+=1) {
    translate (mouseX*1.5, mouseY*1.5);
    rotate(angle);
    if (i < 51) {
      fill(0, 255-(i*fillChange), 0+(i*fillChange), 20); //green to blue gradient
    } else {
      fill(0+(i*fillChange), 0, 255-(i*fillChange), 20); //blue to red gradient
    }
    beginShape();
      vertex (0+(i*quadChange), height-(i*quadChange));
      vertex (width-(i*quadChange), 350);
      vertex (width/2-(i*quadChange), 230);
      vertex (500, height-(i*quadChange));
      vertex (700, height/4+(i*quadChange));
      vertex (0+(i*quadChange), height/2-(i*quadChange));
    endShape();
  }
    noStroke();
    fill(0, 0, 0, 20);
    ellipse(width/2, height/2, width*10, height*10);
}
