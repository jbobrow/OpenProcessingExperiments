
int counter;

void setup(){
  size (600, 600);
  smooth();
  stroke(0, 102);
}

void draw(){
  background(0);
  for(int i = 10; i < width; i += 30) {
    for(int u = 10; u < height; u += 30){
      ellipse(i + mouseX*0.1, u + mouseY*0.1, 20-u*0.05, 20-u*0.05);
    }
  }

}

void mousePressed(){
  for(int counter = 0; counter< 255; counter += 5){
    fill(0, 30, 90);
  }
}

void mouseReleased(){
  counter ++;
  fill(255);
  println(counter);
}


