
float x = 0;

void setup () {
    size(200, 200);
    stroke(255, 0, 0);
    frameRate(50);
}
    
void draw() {
   background(0);
    x = x + 1;
    if (x > width/2) {
        x = 0;
    }
  line(width/2-x, 0, width/2-x, height);
  line(width/2+x, 0, width/2+x, height);

} 

