
void setup(){
 size (200,200);
} 	

void draw() {
  background(204);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  rect(s, 0, s, 33);
  rect(m, 44, m, 44);
  rect(h, 99, h, 99);
}

