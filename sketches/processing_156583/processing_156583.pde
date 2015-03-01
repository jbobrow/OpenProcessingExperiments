
/*
  MFADT BOOTCAMP Day02 HOMEWORK by Sherry Zhang
  MR. BROCCOLI now moves as your mouse moves, and raises his eyebrows when you press your mouse.
*/

int y;

void setup() {
  size(600, 800); //set window size
}

void draw() {
  //set background color
  background(255); 

  //draw a face
  noStroke();
  fill(124,250,129);
  triangle(mouseX-150,mouseY-200,mouseX+150,mouseY-200,mouseX,mouseY+200);
  
  //draw a body
  quad(mouseX-50,mouseY+125,mouseX+50,mouseY+125,mouseX+50,mouseY+250,mouseX-50,mouseY+250);

  //draw curly hair
  ellipseMode(CORNER);
  fill(101,227,106);
  ellipse(mouseX-200,mouseY-350,150,150);
  ellipse(mouseX-100,mouseY-350,150,150);
  ellipse(mouseX,mouseY-350,150,150);
  ellipse(mouseX+100,mouseY-350,150,150);
  ellipse(mouseX-200,mouseY-300,150,150);
  ellipse(mouseX-100,mouseY-300,150,150);
  ellipse(mouseX,mouseY-300,150,150);
  ellipse(mouseX+100,mouseY-300,150,150);
  
  //draw two arms
  stroke(0);
  strokeWeight(3);
  line(mouseX-150,mouseY+200,mouseX-50,mouseY+150);
  line(mouseX+150,mouseY+200,mouseX+50,mouseY+150);
  
  //draw two legs
  line(mouseX-25,mouseY+250,mouseX-25,mouseY+350);
  line(mouseX+25,mouseY+250,mouseX+25,mouseY+350);
  
  //draw two eyebrows
  y = mouseY-150; // y value of the location of an eyebrow
  if(mousePressed) y -= 20;
  drawEyebrows(mouseX-150,y);
  
  //draw two eyes
  strokeWeight(15);
  point(mouseX-50,mouseY-100);
  point(mouseX+50,mouseY-100);
  
  //draw a nose
  strokeWeight(3);
  ellipse(mouseX,mouseY,5,5);
  
  //draw a mouth
  arc(mouseX-15,mouseY+50,40,30, HALF_PI, PI);
}

//draw two eyebrows
void drawEyebrows(int a, int b) {
  strokeWeight(3);
  noFill();
  arc(a+100,b,40,30, HALF_PI, PI);
  arc(a+200,b,40,30, HALF_PI, PI);
}

// raise eyebrows when clicking mouse
void mouseClicked() {
  y -= 20;
}
