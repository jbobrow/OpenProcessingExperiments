
int w;
int h;

void setup() {
  size(200, 200);
  w = width/2;
  h = height/2;
}

void draw() {
  background(255);
  stroke(200);
  line(0, height/2, width, width/2);
  line(width/2, 0, width/2, height); 

  if (mouseX > 0 && mouseX < width/2 && mouseY > 0 && mouseY < height/2) {
    fill(0);
  }
  else {
    fill(255);
  }
  rect(0, 0, w, h);
  
  if (mouseX > width/2 && mouseX < width && mouseY > 0 && mouseY < height/2) {
    fill(0);
  }
  else {
    fill(255);
  }
  rect(width/2, 0, w, h);
  
  if (mouseX > 0 && mouseX < width/2 && mouseY > height/2 && mouseY < height) {
    fill(0);
  }
  else {
    fill(255);
  }
  rect(0, height/2, w, h);
  
  if (mouseX > width/2 && mouseX < width && mouseY > height/2 && mouseY < height) {
    fill(0);
  }
  else {
    fill(255);
  }
  rect(width/2, height/2, w, h);
} 


