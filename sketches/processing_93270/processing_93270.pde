



float r = 0;
float g = 0;
float b = 0;
float a = 0;
 
float change = 50;
float x = 100;
float y = 100;
 
void setup(){
  size(400, 400);
  background(57);
  smooth();

}
 
void draw(){
  x = mouseX;
  y = mouseY;
}
 
void mousePressed(){
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(0, 25));

  
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  a = random(0, 255);
  x = random(0, 200);
  y = random(0, 200);
  change = random(5, 80);
  fill(r, g, b, a);
  ellipse(mouseX, mouseY, change, change);
  


}



