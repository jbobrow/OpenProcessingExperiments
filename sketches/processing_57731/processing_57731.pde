
//Problem Set 3
//Question 5
//Karen Wan

void setup() {
  size (300, 300);
  smooth();
}

void draw() {
  background(12, 32, 148);
  rectMode(CENTER);
  if (mousePressed == true) { 
    //right ear
    fill(32, 34, 223);
    ellipse (200+mouseX, 80+mouseX, mouseY+50, mouseX+50);
    //left ear
    ellipse (100+mouseY, 80+mouseX, mouseX+50, mouseX+50);
    //head
    fill(32, 134, 23);
    ellipse(width/2+mouseY, width/2+mouseX, mouseY+200, mouseX+200);
    //left eye
    fill(123, 23, 223);
    ellipse(width/3+mouseX, height/2+mouseY, mouseY+20, mouseX+20);
    //right eye
    ellipse(width/3*2+mouseY, height/2+mouseY, mouseX+20, mouseY+20);
    //mouth
    fill(23, 100, 100);
    ellipse(width/2+mouseX, height/3*2+mouseX, mouseX+20, mouseX+10);
  }
  else {
    //right ear
    fill(32, 34, 223);
    ellipse (200, 80, 50, 50); 
    //left ear
    ellipse (100, 80, 50, 50); 
    //head
    fill(32, 134, 23);
    ellipse(width/2, width/2, 200, 200);
    //left eye
    fill(123, 23, 223);
    ellipse(width/3, height/2, 20, 20);
    //right eye
    ellipse(width/3*2, height/2, 20, 20);
    //mouth
    fill(23, 100, 100);
    ellipse(width/2, height/3*2, +20, 10);
  }
}

