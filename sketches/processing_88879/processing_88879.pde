
void setup() {

  size (400, 400);
 

}

void draw() {
  int m = millis();
  noStroke();
  fill(m % 255);
  rect (260, 120, 20,30);  
  rect (180,150, 180, 250);
}
