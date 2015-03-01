
void setup (){
size(600, 600);
}

void draw(){

for (int x = 0;x<30;x++) {
  for (int y = 0;y<30;y++) {
 
    ellipse(x*10, y*10, 20, 20);
    float d= dist(mouseX, mouseY, x*10, y*10);
    fill (d);
    ellipse(x*10, y*10, 20, 20);
  }
}
}

