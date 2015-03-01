
//i will try to draw a pattern of hexagons.
//i got a code and adapted its logic to this shape

float i = 3;

void setup() {
  size(550, 600);
  background(10,200,200);
}

void draw(){
  for(float y = 0; y<=height; y+=(15*i)) {
    for(float x = 0; x<=width; x+=(23*i)) {
      
     
      stroke(255);
      strokeWeight(3);
      noFill();
      beginShape();
      vertex(x, y);
      vertex(x+6*i, y-8*i);
      vertex(x+16*i, y-8*i);
      vertex(x+22*i, y);
      vertex(x+16*i, y+8*i);
      vertex(x+6*i, y+8*i);
      endShape(CLOSE);
     
    }
  }
}

  


