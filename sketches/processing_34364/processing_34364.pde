
float max_distance;
void setup(){
  size(200,200);
  smooth();
  background(0);
  frameRate(50);
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw(){
  stroke(mouseX,80,mouseY);
  float distance =dist(pmouseX,pmouseY, mouseX, mouseY);
  float maxStroke =8;
  strokeWeight(maxStroke - constrain(distance,0,maxStroke));
   
background(142,255,239);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 90;
      fill(252,247,191,50);
      ellipse(i, j, size, size);
      fill(222,60,82,100);
      rect(i, j, size, size);
      fill(72,240,70,30);
      rect(70,j,size,size);
    }
  }
}




