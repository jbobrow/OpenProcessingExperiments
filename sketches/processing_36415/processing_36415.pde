
void setup() {
  size (300, 300);
  colorMode(RGB);
}

//Backgoound
void draw() {
  background(37, 189, 229);
  fill(72, 237, 65);
  stroke(72, 237, 65);

  //Butterfly wings ON $ OFF
  if (mouseX >= 100) {
    background(37, 189, 229);
  }//else{
  //background(mouseX,100,150);
  //}
  rect(0, 225, width, 225);
  if (mouseY<=height) {
    fill(mouseX, 100, 150);
    smooth();

    //Butterfly Form
    noStroke();
    //stroke(250, 255, 0);
    ellipse(100, 100, 75, 75);

    //Butterfly Form
    ellipse(140, 140, 65, 65);
    ellipse(170, 170, 35, 35);

    //Antennas
    stroke(0);
    line(170, 180, 180, 195);
    line(180, 175, 195, 190);   
   
    noStroke();
    if (mouseX < width/2) {
      //Butterfly Wing Left
      ellipse(120, 160, 15, 90);

      //Butterfly Wing Right
      ellipse(140, 90, 15, 90);
    }
  }
}


