
void setup(){
  size (400, 600);
  background (0);
  smooth();
}

void draw(){
  background(0);
  stroke(127);
  strokeWeight(2);
  for(int x=25; x<width; x+=50){
    for(int y = 0; y<height; y +=40){
      fill(106, 0, 118);
      beginShape();
      vertex(x,y);
      vertex(x-25, y+40);
      vertex(x+25, y+40);
      endShape(CLOSE);
      fill(158,123,212);
      ellipse(x, y+25, 10, 10);
    }
  }

}



