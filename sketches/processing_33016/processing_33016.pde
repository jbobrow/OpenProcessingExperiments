

void setup() {
  size (500, 500);
}

void draw() {
  background (0, 245, 140);
  
  for (int i=50; i<500; i = i+ 100) {
  fill ( 145, 225, 125);
  ellipse (i, 250, 50, 50);
  }
  
for (int i=0; i<100; i = i+2) {
    println(i);
  }
 
for (int i=0; i<500; i = i+5) {
    println(i);
  }
 

}

