
int counter;
int width = 500, height = 500, num = 4;

void grid(int width, int height) {
  size(width, height);
  background(255);  //set background white
  for(int i=0; i<=num; i++) {
      int x = width*i/num, y = height*i/4;
      line(x, 0, x, height);
      line(0, y, width, y);
  }
}
class Test {}
void smiley() {
    int xrad = width*1/8, yrad = height*1/8;
    ellipse(width*3/8, height*3/8, xrad, yrad);
    ellipse(width*5/8, height*3/8, xrad, yrad);
}

void setup() {  //setup function called initially, only once
  grid(width, height);
  smiley();
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),200,200,250);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
