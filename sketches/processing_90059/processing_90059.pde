
//Ana Cecilia Thompson Motta
//February 17
//Assingment 3

void setup() {
  size(800, 800);
  background(0);
}

void draw() {

  //top left sq
  fill(255, 0, 0);
  noStroke();
  rect(0, 0, 400, 400);
  if (mousePressed==true) {
    fill(0, 0, 255);
    rect(0, 0, 400, 400);
  }


  //top right sq
  fill(255);
  rect(400, 0, 400, 400);
  if ((mouseX>400) && (mouseX<800))
  if ((mouseY>0) && (mouseY<400)) {
    fill(0);
    ellipse(600, 200, mouseX, mouseY);
  }

  //bottom left sq
  fill(120, 255, 30);
  rect(0, 400, 400, 400);
  if ((mouseX>0) && (mouseX<400))
  if ((mouseY>400) && (mouseY<800)) {
    fill(255);
    rect(200, 600, 200, 200);
    rect(0,400,200,200);
    fill(0);
    rect(200,400,200,200);
    rect(0,600,200,200);
  }

  //bottom right sq
  
  if((mouseX>400) && (mouseX<800))
  if((mouseY>400) && (mouseY<800)) {
    fill(100,100,100);
    stroke(7);
    ellipse(mouseX,mouseY,100,100);
  }
}



