
int dia = 75;
int something = 300;

void setup() {
  size (600, 600);
  background (255);
  smooth();
  noFill();
  stroke(100,100,100,50);
  frameRate(30);
}

void draw() {
  if(mousePressed){
  strokeWeight(random(5));
  line(mouseX, mouseY, dia, dia);
  dia = random(600);
  }
}

void keyPressed() {
  if (key=='s')
  {
    saveDrawing();
  }
}

function saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}



