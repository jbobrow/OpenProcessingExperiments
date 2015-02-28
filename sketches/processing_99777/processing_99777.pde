
void setup () {
  size (400, 200);
  noStroke();
  background(255, 230, 115);
}

void draw () {
  if (mousePressed==true) {
    frameRate(15);
    int a=(int)random(15);
    int b=(int)random(10);
    int c=(int)random(30);
    int d=(int)random(50, 255);
    background(255, 230, 115);
    fill(255);
    noStroke();
    rect(380, 7, 30, 15);
    triangle(380, 0, 380, 30, 370, 15);
    stroke(1);
    ellipse(350, 15, 20, 20);
    fill(0, 145, 255);
    rect(mouseX, mouseY, 20, 20);
    //rect(mouseX-30,mouseY-30, a,c);
    cursor(HAND);
        noStroke();
    fill(0, 145, 255);
    triangle(0, 0, 150, 0, 0, 100);
    triangle(400, 200, 400, 100, 250, 200);
  }
  else {
      int a=(int)random(5, 20);
      int b=(int)random(5, 30);
      int c=(int)random(255);
      frameRate(20);
      stroke(1);
      fill(255);
      ellipse(mouseX, mouseY, a, b);      
    noStroke();
    fill(0, 145, 255);
    triangle(0, 0, 150, 0, 0, 100);
    triangle(400, 200, 400, 100, 250, 200);
  }
  
/*    if (mousePressed==false) {
      int a=(int)random(5, 20);
      int b=(int)random(5, 30);
      int c=(int)random(255);
      frameRate(20);
      stroke(1);
      fill(255);
      ellipse(mouseX, mouseY, a, b);
      //ellipse(mouseY, mouseX, b, c);
    }
      noStroke();
     fill(0, 145, 255);
     triangle(0, 0, 150, 0, 0, 100);
     triangle(400, 200, 400, 100, 250, 200);*/
  }



