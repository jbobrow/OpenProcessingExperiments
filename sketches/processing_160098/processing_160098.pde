
void setup(){
  size(300,300);
}

void draw(){
  strokeWeight(10);
  stroke(random(255), random(255), random(255),50);
  line(random(width), 0, random(width), height);
}


