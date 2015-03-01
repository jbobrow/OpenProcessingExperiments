

void setup() {
  background(255);
  size(800, 500);
}

void draw() {

  if (key == 'q' || key == 'Q') {
      colorblindness();
  }
  if (key == 'w' || key == 'W') {
      pale();
  }
  if (key == 'e' || key == 'E') {
      contrast();
  }
 
}

void colorblindness() {
  background(255);
  size(800, 500);
  noStroke();
  fill(17, 206, 242);
  rect(250, 100, 250, 350);
  fill(69, 145, 160);
  ellipse(300, 150, 70, 70);
  ellipse(450, 150, 70, 70);
  fill(17, 206, 242);
  rect(260, 150, 80, 80);
  rect(410, 150, 80, 80);
  fill(213, 240, 245);
  rect(355, 150, 45, 45);
  fill(180, 234, 245);
  ellipse(500, 330, 70, 20);
  ellipse(250, 330, 70, 20);
  fill(11, 52, 59);
  rect(290, 250, 180, 20);
}
  


void pale() {
  background(255);
  size(800, 500);
    noStroke();
  fill(19, 198, 232);
  rect(250, 100, 90, 200);
  //color changes depending on position of mouse
  if(mouseX > width/2){
    fill(202, 242, 252);
  } else{
    fill(19, 198, 232);
  }
  rect(450, 100, 90, 200);
}


void contrast() {
  //background changes depending on mouse
  if (mouseX > width/2){
    background(0);
  }else{
    background(195, 200, 201);
  }
  fill(15, 210, 247);
  rect(200, 100, 80, 80);
  rect(200, 250, 80, 80);
  rect(500, 100, 80, 80);
  rect(500, 250, 80, 80);
}
