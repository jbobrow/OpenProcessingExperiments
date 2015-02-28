
void setup() {
  size(400, 400);
  background (255);
  /*fill(0);
  rect(0,200,400,200);*/
  noStroke();
  smooth();
}

void draw() {
  for (int x =0; x <= width; x = x + 100 - mouseX/5) {
    fill(255,1);
    rect(0,0,400,400);
    
    fill (0,0,100, 5);
    ellipse (x,200,50,50);
    /*rect (x-25,200,50,225);*/
  }
  
  for (int y =0; y <= width; y = y + 100 - mouseX/10) {

    fill (255);
    ellipse (y + 50,200,50,50);
    //rect (x-25,200,50,225);
  }
}
