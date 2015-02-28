
void setup() {
  size(512, 512, P2D);
  fill(0);
  background(255);
}
void draw() {
  translate(width/2, height/2);
  rotate(float(mouseX)/20);
  translate(-width/2, -height/2);
  
  strokeWeight(4);
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  fill(255);
  /////////////////////////////DO PROGRAMMIN IN HERE///////////////////////////////
  float x = 0;
  float y = 0;

while(x<width){
  y = 0;
while (y < height){
float a = noise(x/50, y/50, float(millis())/2000);
strokeWeight(a*6);
  point(x, y);
  y += 4;
}
x += 4;

  
}
  /////////////////////////////////////////////////////////////////////////////////
}






















































































