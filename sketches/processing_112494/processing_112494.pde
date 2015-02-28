
void setup() {
 size(600, 600);
 background(0);
}

int value =#F7F49B;
void draw() {
   strokeWeight(0);
   stroke(0);
   fill(value);
   ellipseMode(CENTER);
   ellipse(300, 450, 225, 225);
  quad(250,100,350,100,450,350,150,350);
}

void mouseReleased() {
 if(value == 0) {
 value = #F7F49B;
 } else {
 value = 0;
 }
}


