
void setup() {
  size(200, 200);
  background(240);
  smooth();
  noStroke();
  frameRate(3);
  //noLoop();
}
 
void draw() {
  fill(240, 75);
  rect(0, 0, 200, 200);
 
  //Red - Right Triangle
  fill(255, 50, 0, 225);
  triangle(random(width/3, width/2), height, random(width/2, width*.75), random(height/4, height/3), random(width, width*1.25), height);
 
  //Blue - Left Triangle
  fill(0, 100, 255, 225);
  triangle(random(-25, 0), height, random(width/4, width/2), random(height/2, height*.66), random(width/3, width*.66), height);
}
 
void keyPressed() {
  if (key == 's') {
    save("myDrawing.png");
    println("saved");
  }
}
