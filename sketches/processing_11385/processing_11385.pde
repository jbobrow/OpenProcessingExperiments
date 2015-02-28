
void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 100);
  background(54, 100, 80); 
  noLoop();
  noFill();
}

void draw() {
  
  for(int i = 0 ; i < width; i++) {
    stroke(99); //white
    beginShape();
    vertex(0, 47.0+i*10);
    bezierVertex(0, 47.0+i*10, 30.0, 20.7941130+i*10, 51.0, 20.7941130+i*10);
    bezierVertex(72.0, 20.7941130+i*10, 111.0, 45.02942+i*10, 132.0, 46.0+i*10);
    bezierVertex(150.0, 45.97058+i*10, 195.0, 15.0+i*10, 221.0, 15.0+i*10);
    bezierVertex(247.0, 15.0+i*10, 280.0, 45.058838+i*10, 308.0, 45.058838+i*10);
    bezierVertex(336.0, 45.058838+i*10, 371.0, 13.0+i*10, 398.0, 13.0+i*10);
    bezierVertex(427.0, 14.0+i*10, 457.0, 46.02942+i*10, 500.0, 47.0+i*10);
    endShape();
  }
  for(int i= 0; i < width; i++){
    //ifを使って線の大きさを太くする
    if(i % 11 == 0){
    pushMatrix();
    strokeWeight(8);
    beginShape();
    vertex(0, 47.0+i*10);
    bezierVertex(0, 47.0+i*10, 30.0, 20.7941130+i*10, 51.0, 20.7941130+i*10);
    bezierVertex(72.0, 20.7941130+i*10, 111.0, 45.02942+i*10, 132.0, 46.0+i*10);
    bezierVertex(150.0, 45.97058+i*10, 195.0, 15.0+i*10, 221.0, 15.0+i*10);
    bezierVertex(247.0, 15.0+i*10, 280.0, 45.058838+i*10, 308.0, 45.058838+i*10);
    bezierVertex(336.0, 45.058838+i*10, 371.0, 13.0+i*10, 398.0, 13.0+i*10);
    bezierVertex(427.0, 14.0+i*10, 457.0, 46.02942+i*10, 500.0, 47.0+i*10);
    endShape();
    popMatrix();
  }
}
}

