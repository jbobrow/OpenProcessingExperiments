
void setup() {
  size(500, 200);
  strokeWeight(0.5);
  stroke(255, 150); 
 
}

void draw() {
  background(0);

for (int i =0 ; i < 640; i = i+4) 
 line(i, 50, i, 150);

}
