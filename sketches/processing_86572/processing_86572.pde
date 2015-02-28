
int RED = 255;
int BLUE = 134;
int GREEN = 134;

int ellipseSize = 100;

void setup(){
  size(600, 300);
  background(RED, GREEN, BLUE);
}

void draw(){
  background(RED, GREEN, BLUE);
  println(mouseX + " " + mouseY);
  noStroke();
  
  if(mouseX < width/2 && mouseY < height/2){
    rect(mouseX,mouseY, 40, 40);
  }else if(mouseX > width/2 && mouseY < height/2){
    ellipse(mouseX, mouseY, 40, 40);
  }else if(mouseX > width/2 && mouseY > height/2){
    rect(mouseX,mouseY, 40, 40);
  }else {
    ellipse(mouseX, mouseY, 40, 40);
  }

}


