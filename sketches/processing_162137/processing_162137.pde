
color paintColor = color(0, 0, 0);
int box = 30;

void setup() {
  size(600, 600);
  background(255);
  stroke(0, 0, 0);
}

void draw() {
  strokeWeight(1);
  stroke(255);


  fill(233, 125, 129);
  rect (0, 0, box, box);

  fill(255, 155, 115);
  rect(30, 0, box, box);

  fill(209, 178, 116);
  rect(60, 0, box, box);

  fill(207, 204, 162);
  rect(90, 0, box, box);

  fill(189, 213, 94);
  rect(120, 0, box, box);

  fill(97, 185, 119);
  rect(150, 0, box, box);

  fill(83, 174, 168);
  rect(180, 0, box, box);

  fill(81, 143, 187);
  rect(210, 0, box, box);

  fill(106, 101, 187);
  rect(240, 0, box, box);

  fill(154, 84, 206);
  rect(270, 0, box, box);

  fill(229, 115, 174);
  rect(300, 0, box, box);

  fill(149, 16, 21);
  rect(330, 0, box, box);

  fill(69, 36, 91);
  rect(360, 0, box, box);

  fill(43, 40, 95);
  rect(390, 0, box, box);

  fill(76, 81, 31);
  rect(420, 0, box, box);

  fill(120, 92, 37);
  rect(450, 0, box, box);

  fill(60, 63, 69);
  rect(480, 0, box, box);

  fill(0, 0, 0);
  rect(510, 0, box, box);

  fill(154, 154, 154);
  rect(540, 0, box, box);

  //clear
  fill(255);
  rect(570, 0, box, box);

  fill(0);
  textSize(9);
  text("Clear", 573, 10, box, box);
  


  //painting 
  if (mousePressed == true) {

    if (mouseX < 30 && mouseX > 0 && mouseY < box && mouseY > 0) {
      paintColor = color(233, 125, 129);
    }
    if (mouseX < 60 && mouseX >30 && mouseY <box && mouseY >0) {
      paintColor = color(255, 155, 115);
    }
    if (mouseX < 90 && mouseX >60 && mouseY <box && mouseY >0) {
      paintColor = color(209, 178, 116);
    }
    if (mouseX < 120 && mouseX >90 && mouseY <box && mouseY >0) {
      paintColor = color(207, 204, 162);
    }
    if (mouseX < 150 && mouseX >120 && mouseY <box && mouseY >0) {
      paintColor = color(189, 213, 94);
    }
    if (mouseX < 180 && mouseX >150 && mouseY <box && mouseY >0) {
      paintColor = color(97, 185, 119);
    }
    if (mouseX < 210 && mouseX >180 && mouseY <box && mouseY >0) {
      paintColor = color(83, 174, 168);
    }
    if (mouseX < 240 && mouseX >210 && mouseY <box && mouseY >0) {
      paintColor = color(81, 143, 187);
    }
    if (mouseX < 270 && mouseX >240 && mouseY <box && mouseY >0) {
      paintColor = color(106, 101, 187);
    }
    if (mouseX < 300 && mouseX >270 && mouseY <box && mouseY >0) {
      paintColor = color(154, 84, 206);
    }
    if (mouseX < 330 && mouseX >300 && mouseY <box && mouseY >0) {
      paintColor = color(229, 115, 174);
    }
    if (mouseX < 360 && mouseX >330 && mouseY <box && mouseY >0) {
      paintColor = color(149, 16, 21);
    }
    if (mouseX < 390 && mouseX >360 && mouseY <box && mouseY >0) {
      paintColor = color(69, 36, 91);
    }
    if (mouseX < 420 && mouseX >390 && mouseY <box && mouseY >0) {
      paintColor = color(43, 40, 95);
    }
    if (mouseX < 450 && mouseX >420 && mouseY <box && mouseY >0) {
      paintColor = color(76, 81, 31);
    }
    if (mouseX < 480 && mouseX >450 && mouseY <box && mouseY >0) {
      paintColor = color(120, 92, 37);
    }
    if (mouseX < 510 && mouseX >480 && mouseY <box && mouseY >0) {
      paintColor = color(60, 63, 69);
    }
    if (mouseX < 540 && mouseX >510 && mouseY <box && mouseY >0) {
      paintColor = color(0, 0, 0);
    }
    if (mouseX < 570 && mouseX >540 && mouseY <box && mouseY >0) {
      paintColor = color(154, 154, 154);
    }
    if (mouseX < 600 && mouseX >570 && mouseY <box && mouseY >0) {
      background(255);
    }

    strokeWeight(2);
    stroke(paintColor);
    if (mouseY > 30) line(pmouseX, pmouseY, mouseX, mouseY);
  }
} 

