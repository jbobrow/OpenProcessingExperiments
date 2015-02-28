
void setup() {
  size(300, 300);
  smooth();
}

int x = 0;

void draw() {
  background(131, 38, 38);
  
  strokeWeight(2); //light switch
  fill(255, 245, 214);
  rectMode(CORNERS);
  rect(150, 50, 275, 250);

  rect (202, 130, 227, 170);

  rect(206, 125, 223, 164);

  strokeWeight(.5);
  line(206, 149, 223, 149);

  fill(0); //text
  textSize(10);
  text("on", 209, 160);

  fill(124); //screw # 1
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(214, 100, 15, 15);
  line(208, 100, 221, 100);

  ellipse(214, 193, 15, 15); //screw # 2
  line(214, 187, 214, 199);

  strokeWeight(3);//window sill
  fill(255);
  rect(-10, -10, 100, 150);

  fill(67, 175, 255); //sky
  rect(-10, -10, 50, 100);

  //turns the light switch off
  if (mouseY > 150) {
    background(95, 33, 33);
    
    strokeWeight(2);
    fill(203, 190, 148);
    rectMode(CORNERS);
    rect(150, 50, 275, 250);

    rect (202, 130, 227, 170);

    rect(206, 135, 223, 174);

    strokeWeight(.5);
    line(206, 154, 223, 154);

    fill(0);
    textSize(10);
    text("off", 208, 149);

    fill(95); //screw # 1
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(214, 100, 15, 15);
    line(208, 100, 221, 100);

    ellipse(214, 193, 15, 15); //screw # 2
    line(214, 187, 214, 199);

    strokeWeight(3);//window sill
    fill(180);
    rect(-10, -10, 100, 150);

    fill(8, 33, 52);
    rect(-10, -10, 50, 100);
  }
}


