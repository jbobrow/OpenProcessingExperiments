
float xCor;

void setup() {
  smooth();

  size(800, 600);
  strokeWeight(.5);
  background(255);
  xCor=200;
  //noStroke();
}

void draw() {
  //ellipse(mouseX, mouseY, 55, 55);
  xCor=xCor+2;
  ellipse(xCor, height/2, mouseX, mouseX);
  stroke(#95C8FA, 50); 
  fill(#EA079F, 25);
  //ellipse(width/4*2, height/2, mouseX, mouseY);
  // stroke(#EA079F, 50);
  // fill(#95C8FA, 25);
  // ellipse(width/4*3, height/2, mouseX, mouseY);
  //stroke(255, 0, 0, 50);
  // fill(#FFE91F, 25);


  //ellipse(200, 400, 55, 55);

  //saveFrame("hajdin####.png");
}




