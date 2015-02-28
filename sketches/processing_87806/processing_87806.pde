
void setup(){
size(500,500);
smooth();
}

void draw() {
for (int i = 0; i <= width; i= i+20) {
    for (int j = 0; j <= height; j += 20) {
      
      fill(222, 185, 92, 40);
      strokeWeight(.75);
      stroke(255);
      ellipse(i, j, 15, 15);
      rotate(PI);
      
      fill(61, 224, 209, 40);
      strokeWeight(.25);
      ellipse(i, j, 55, 55);
      rotate(HALF_PI);
      
    }
 }
}


