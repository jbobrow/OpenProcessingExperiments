
void setup() {
size(666,666);
background(255);
frameRate(10000);
}

void draw() {
for (int k = 50; k < 350; k++) {
  triangle(k,mouseX+100,mouseX+50 - mouseY+50,k,600,mouseY+100);
  fill(205,123,147);
}
}



