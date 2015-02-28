

void setup(){
  size (800,600);
}

void draw() {
  
  int a=0;

  background(10,mouseY,mouseX*random(255));
  noFill();
  stroke(0);

  for (int i = 0; i < 600; i = i+80) {
fill(255);
stroke(10,mouseY,mouseX*random(255));
 bezier(width-100, 600, i, mouseY, mouseX*2, i, 80, 600);
   
  }
}

