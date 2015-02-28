
void setup(){
  size(300, 300);
  stroke(255);
}

void draw(){
  translate(width/2, height/2);
 
  int circleResolution = floor(mouseY / 7);
  int radius = 5 * abs(width/2 - mouseX);
  float angle = (2 * PI) / circleResolution;
  
  background(0);
  for (int i = 0; i < circleResolution; i++ ) {
    line(0, 0, radius * cos(i * angle), radius * sin(i * angle));
  } 
}


