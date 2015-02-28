
void setup(){
  size (500, 500);
  smooth();
  noStroke();
  
}
  
void draw(){
  background (201, 139, 47);
  
  float xPos;
  float yPos;
  float insideColor;

 
//loopty loop
for (int x = 0; x <= width; x += 50) {
for (int y = 0; y <= height; y+=50) {
  
  
  xPos = x + random(mouseX/50);
  yPos = y + random(mouseX/50);
  
  
    insideColor = map(mouseX, 0, 300, 300, 0);
    fill(random(insideColor, 255), random(insideColor, 255), random(insideColor, 255), 200);
    ellipse(x, y, 30, 30);
    noFill();
 
  fill(250, 240, 250);
  ellipse(x, y, 25, 25);
 

  fill (205, 164, 244);
  ellipse(xPos, yPos, 10, 10);
  

  fill(252, 25, 56);
  ellipse(xPos, yPos, 5, 5);

  //fill (71, 51, 188);

}
}
}
