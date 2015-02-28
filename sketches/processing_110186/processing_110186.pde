
void setup(){
  size(800, 400);
} 

void draw(){
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 5);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);//magic!!
  
  noStroke();
  fill(0, alpha);
  rect(0, 0, width, height);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
