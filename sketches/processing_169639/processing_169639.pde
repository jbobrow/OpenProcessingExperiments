
void setup(){
  size(640, 640);
  noStroke();
  fill(255, 50);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int x = -width/2-100; x <= width/2+100; x+=20){
    for(int y = -height/2-100; y <= height/2+100; y+=20){
      float d = abs(sin(radians(x+y))*30);
      ellipse(x+sin(radians(x+frameCount*2))*20, y+cos(radians(y+frameCount*2))*20, d, d);
    }
  }
}


