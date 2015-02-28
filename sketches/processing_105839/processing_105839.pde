
int penR, penG, penB;
int backgroundR, backgroundG, backgroundB;


void setup () {
  size (500, 500);
  frameRate (50000);
}
int x=-1, y=-1;

void draw() {
  // BACKGROUND COLOR
  fill (200, 100, 300);
  text ("background", 425, 15);
  fill (255, 0, 0);
  rect(0, 0, 30, 30);
  fill (0, 255, 0);
  rect(30, 0, 30, 30);
  fill (0, 0, 255);
  rect(60, 0, 30, 30);
  fill (0);
  rect(90, 0, 30, 30);
  fill (255);
  rect(120, 0, 30, 30);
  fill (255, 0, 255);
  rect(150, 0, 30, 30);
  fill (255, 255, 0);
  rect(180, 0, 30, 30);
  fill (0, 255, 255);
  rect(210, 0, 30, 30);

  // COLOR OF THE LINE
  fill (200, 100, 300);
  text ("color", 425, 45);
  fill (255, 0, 0);
  rect(0, 30, 30, 30);
  fill (0, 255, 0);
  rect(30, 30, 30, 30);
  fill (0, 0, 255);
  rect(60, 30, 30, 30);
  fill (0);
  rect(90, 30, 30, 30);
  fill (255);
  rect(120, 30, 30, 30);
  fill (255, 0, 255);
  rect(150, 30, 30, 30);
  fill (255, 255, 0);
  rect(180, 30, 30, 30);
  fill (0, 255, 255);
  rect(210, 30, 30, 30);


  // Color of the baackground
  if (mousePressed && mouseX<30 && mouseY < 30) {
    background (255, 0, 0);
  } else if (mousePressed && mouseX<60 && mouseX>30 && mouseY < 30) {
    background (0, 255, 0);
  } else if (mousePressed && mouseX>60 && mouseX<90 && mouseY < 30) {
    background (0, 0, 255);
  } else if (mousePressed && mouseX>90 && mouseX<120 && mouseY < 30) {
    background (0);
  } else if (mousePressed && mouseX>120 && mouseX<150 && mouseY < 30) {
    background (255);
  } else if (mousePressed && mouseX>150 && mouseX<180 && mouseY < 30) {
    background (255, 0, 255);
  } else if (mousePressed && mouseX>180 && mouseX<210 && mouseY < 30) {
    background (255, 255, 0);
  } else if (mousePressed && mouseX>180 && mouseX<240 && mouseY < 30) {
    background (0, 255, 255);
  }
  if (mousePressed && mouseY< 30) {
    x=-1;
    y=-1;
  }


  // Color of the line
  if (mousePressed && mouseX<30 && mouseY > 30 && mouseY < 60) {
    stroke(255, 0, 0);
  } else if (mousePressed && mouseX<60 && mouseX>30 && mouseY > 30 && mouseY < 60) {
    stroke(0, 255, 0);
  } else if (mousePressed && mouseX<90 && mouseX>60 && mouseY > 30 && mouseY < 60) {
    stroke(0, 0, 255);
  } else if (mousePressed && mouseX<120 && mouseX>90 && mouseY > 30 && mouseY < 60) {
    stroke(0);
  } else if (mousePressed && mouseX<150 && mouseX>120 && mouseY > 30 && mouseY < 60) {
    stroke(255);
  } else if (mousePressed && mouseX<180 && mouseX>150 && mouseY > 30 && mouseY < 60) {
    stroke(255, 0, 255);
  } else if (mousePressed && mouseX<210 && mouseX>180 && mouseY > 30 && mouseY < 60) {
    stroke(255, 255, 0);
  } else if (mousePressed && mouseX<240 && mouseX>210 && mouseY > 30 && mouseY < 60) {
    stroke(0, 255, 255);
  }
  if (mousePressed) {
    if (x==-1) { // if it's the first click
      x=mouseX;
      y=mouseY;
    }
   
    line (x, y, mouseX, mouseY);
    x = mouseX;
    y = mouseY;
    
   
  } else {
    x = -1;
    y =-1;
  }
  
}
