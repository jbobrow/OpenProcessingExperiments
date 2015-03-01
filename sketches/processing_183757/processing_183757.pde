
void setup() {
  size (250, 250);
  background(255);
}

void draw() {
  for (int i=0; i< 250; i=i+10) { 

    line(0, i, width, i);
   
  }
}

