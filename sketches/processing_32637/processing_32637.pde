
void setup(){
   size(400,400);
}

void draw(){
  int r = 0;
  int g = 0;
  int b = 0;
  if(mouseX < 100 && mouseY < 100){
    fill(r, g, b);
    ellipse(200, 200, 300, 300);
    fill(r + 10, g + 25, b + 50);
    ellipse(200, 200, 200, 200);
    fill(r + 25, g + 50, b + 75);
    ellipse(200, 200, 100, 100);
  } else if  (mouseX < 200 && mouseY < 200) {
    fill(r + 25, g + 30, b + 45);
    ellipse(200, 200, 300, 300);
    fill(r + 35, g + 40, b + 55);
    ellipse(200, 200, 200, 200);
    fill(r + 45, g + 50, b + 65);
    ellipse(200, 200, 100, 100);
  } else if  (mouseX < 300 && mouseY < 300) {
    fill(r + 30, g + 55, b + 85);
    ellipse(200, 200, 300, 300);
    fill(r + 40, g + 65, b + 95);
    ellipse(200, 200, 200, 200);
    fill(r + 50, g + 75, b + 100);
    ellipse(200, 200, 100, 100);
  } else if  (mouseX < 400 && mouseY < 400) {
    fill(r + 50, g + 75, b + 105);
    ellipse(200, 200, 300, 300);
    fill(r + 60, g + 85, b + 115);
    ellipse(200, 200, 200, 200);
    fill(r + 70, g + 95, b + 125);
    ellipse(200, 200, 100, 100);
  }
}


