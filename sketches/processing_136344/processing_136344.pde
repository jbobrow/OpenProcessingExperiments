
int outsideCircleW= 15;
float oldX;
float oldY;

void setup () {
  size(800, 800);
  smooth();
  background(250);
  frameRate(200);
}

void draw () {
  strokeWeight(1);
  stroke(20, 0, 40, 50);
  
if (mousePressed) {
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, outsideCircleW, outsideCircleW);
  ellipse(mouseX, mouseY, outsideCircleW/2, outsideCircleW/2);
  strokeWeight(4);
  line(mouseX, mouseY, oldX, oldY);
  stroke(random(200), 0, random(100), 50);
  strokeWeight(random(3));

  line(mouseX, mouseY, mouseX+(random(100)), mouseY+(random(200)));
}



oldX=mouseX;
oldY=mouseY;


}

void keyPressed() { //hit the "s" key and save my image
  if (key=='s')
  {
    saveDrawing();
  }
}

function saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}



