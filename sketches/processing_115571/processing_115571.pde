

void setup() {
  size(450, 450);
  rectMode(CORNER);
  background(255);
}
void draw() {
  
  background(255);
  for (int i=0;i<height;i+=60) {
    for (int j=0;j<width;j+=60) {
      if ((i+j) %120==0) {
        man2(j+20, i);
      }
      else {
        man(j+20, i);
      }
      if (mousePressed == true) {
        fill(0);
      }
    }
  }
}
void man(int x, int y) {
 
  noStroke();
  fill(255, int(random(50, 255)), 0);
  rect(x, y, 20, 20);  //body
  rect(x+5, y-10, 10, 10); // head
  rect(x, y+20, 5, 20);  //leftleg
  rect(x+15, y+20, 5, 20); //rightleg
  rect(x-15, y, 15, 5);  //leftarm
  rect(x+20, y, 15, 5);  //rightarm
  rect(x-15, y, 5, 15);
  rect(x+30, y, 5, 15);
}
void man2(int x, int y) {
  noStroke();
  fill(0, 255, int(random(50, 255)));
  rect(x, y, 20, 20);  //body
  rect(x+5, y-10, 10, 10); // head
  rect(x, y+20, 5, 20);  //leftleg
  rect(x+15, y+20, 5, 20); //rightleg
  rect(x-15, y, 15, 5);  //leftarm
  rect(x+20, y, 15, 5);  //rightarm
  rect(x-15, y, 5, -15);
  rect(x+30, y, 5, -15);
}




