
//Kevin Cantone - Sept 19th, 2013
//Gloog, Zoog's friend
//Move mouse left or right to change hat side
//Click to close mouth, press any key to open
//press 'b' to wink

void setup() {
  size(300, 360);
  background(255);
  fill(0);
  textSize(25);
  text("Click to feed", 0, 330);
  {
    //Body
    ellipseMode(CENTER);
    fill(0, 255, 0);
    ellipse(150, 180, 200, 80);
  }



  {
    //mouth
    fill(255);
    ellipse(150, 180, 120, 50);
  }   
  {
    //teeth
    line(110, 162, 110, 199);
    line(190, 162, 190, 199);
    line(130, 158, 130, 203);
    line(170, 158, 170, 203);
    line(150, 155, 150, 205);
  }
  {
    //between upper and lower teeth
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(150, 180, 120, 4);
  }



  {
    //Legs (left to right)
    line(90, 212, 60, 260);
    line(120, 218, 110, 260);
    line(180, 218, 190, 260);
    line(210, 212, 240, 260);
  }
  {
    //feet (left to right)
    line(30, 260, 60, 260);
    line(90, 260, 110, 260);
    line(190, 260, 210, 260);
    line(240, 260, 270, 260);
  }
  {
    //neck (left to right)
    line(110, 143, 110, 110);
    line(190, 143, 190, 110);
  }
  {
    //Head (left to right)
    //fill head here
    fill(0, 255, 0);
    arc(110, 110, 60, 100, -PI, 0);
    line(80, 110, 140, 110);
    arc(190, 110, 60, 100, -PI, 0);
    line(160, 110, 220, 110);
  }
  {
    //eyes (left to right)
    fill(255);
    ellipseMode(CENTER);
    ellipse(110, 90, 15, 30);
    ellipse(190, 90, 15, 30);
    //pupils
    //fill pupil here
    fill(0, 0, 255);
    arc(110, 95, 13, 15, -PI, 0);//left pupil
    arc(190, 95, 13, 15, -PI, 0);//right pupil
  }
}




void draw() {

  {

    if (mouseX >= 0 & mouseX <=150) { //NEEDS FIX
      //hat
      fill(255);
      stroke(255);
      arc(190, 70, 60, 50, -PI, 0);

      line(220, 70, 250, 70);
      line(220, 69, 250, 69);
      stroke(0, 0, 255);
      fill(0, 255, 0);


      arc(190, 110, 60, 100, -PI, 0);
      line(160, 110, 220, 110);
      fill(255);
      ellipseMode(CENTER);

      ellipse(190, 90, 15, 30);
      fill(0, 0, 255);

      arc(190, 95, 13, 15, -PI, 0);//right pupil



      fill(0, 0, 255);
      arc(110, 70, 60, 50, -PI, 0);
      stroke(0, 0, 255);
      line(80, 70, 50, 70);
      line(80, 69, 50, 69);
    }


    else if (mouseX >= 150) {

      fill(255);
      stroke(255);
      arc(110, 70, 60, 50, -PI, 0);

      line(80, 70, 50, 70);
      line(80, 69, 50, 69);
      stroke(0, 0, 255);
      fill(0, 255, 0);
      arc(110, 110, 60, 100, -PI, 0);
      line(80, 110, 140, 110);

      fill(255);
      ellipseMode(CENTER);
      ellipse(110, 90, 15, 30);

      //pupils
      //fill pupil here
      fill(0, 0, 255);
      arc(110, 95, 13, 15, -PI, 0);//left pupil

      fill(0, 0, 255);
      arc(190, 70, 60, 50, -PI, 0);
      stroke(0, 0, 255);
      line(220, 70, 250, 70);
      line(220, 69, 250, 69);
    }
  }
}
void mouseClicked() {

  {
    //Body
    ellipseMode(CENTER);
    fill(0, 255, 0);
    ellipse(150, 180, 200, 80);
  }
  {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(150, 180, 120, 4);
    fill(0);
    textSize(25);
    text("Yummy!", 0, 20);
  }
}
void keyPressed() {
  if (key == 'q' || key == 'Q') {
    setup();
  }
  else if (key == 'b' || key == 'B') {
    fill(255);
    ellipseMode(CENTER);
    ellipse(110, 90, 15, 30);
    ellipse(190, 90, 15, 30);
  }
}






