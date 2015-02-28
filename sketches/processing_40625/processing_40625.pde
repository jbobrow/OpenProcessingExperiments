
void setup() {
  size(400, 400);
  smooth();
};

void draw() {  
  noStroke();
  //black white quad
  if (mouseY > height - 30) {
    fill(255, 50);
    rect(0, 0, width, height);
    fill(0);
  } else {
    fill(0, 50);
    rect(0, 0, width, height);
    fill(255);
  }
  println(mouseY);
  quad(0,0, 0, width - mouseY, width, mouseY, width, 0);   
}; 

