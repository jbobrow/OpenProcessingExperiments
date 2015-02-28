
void setup(){
background ( 255 ) ;
size ( 600 , 600 ) ;
frameRate ( 150 ) ;
}

void draw() {
  if (mousePressed) {
    fill(255);
  } else {
    noFill();
  }
  
  stroke(153, 0, 0, random(50));
  triangle(width/2, height/2, random(width), 0, random(width), 0);
  
  stroke(0, 153, 0, random(50));
  triangle(width/2, height/2, 0, random(height), 0, random(height));
  
  stroke(255, 128, 0, random(50));
  triangle(width/2, height/2, random(width), height, random(width), height);
  
  stroke(random(0), 102, 204, random(50));
  triangle(width/2, height/2, width, random(height), width, random(height));
  
}
