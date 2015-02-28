
void setup(){
  size(851, 315);
  background(255);  
}

void draw(){  
  stroke(180+random(-50, 50), 0, 0);
  drawStuff();
}

void drawStuff(){
  noFill();
  beginShape();
  for(int i = 0; i < 10; i++){
    curveVertex(random(width), random(height));
  }
  endShape(CLOSE);
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    saveFrame("screenshot-####.png");
  }
}
