
void setup() {
  size(300, 300);
  colorMode(RGB);
}

void draw() {
  smooth();
  background(mouseX, 0, 255, 0);
  //makes the cannon ball come out whenever the mouse is after the cannon
  if (mouseX>55) {
    fill(0);
    ellipse(mouseX, mouseY, 15, 15);
  }
  //this if statement makes the hut exploed whenever the mouse is touching the hut
  if (mouseY < 200) {
    //cannon
    fill(20, 40, 30);
    quad(15, 270, 55, 250, 65, 270, 25, 290);
    fill(0);
    ellipse(25, 285, 20, 20);
    fill(255);
    ellipse(25, 285, 15, 15);
    fill(0);
    ellipse(25, 285, 5, 5);
    //pig
    fill(45, 255, 0);
    ellipse(275, 285, 20, 20);
    ellipse(270, 282, 3, 3);
    ellipse(280, 282, 3, 3);
    ellipse(275, 288, 10, 10);
    line(273, 286, 273, 288);
    line(277, 286, 277, 288);
    //hut
    fill(193, 115, 51);
    rectMode(CORNERS);
    rect(250, 260, 255, 295);
    rect(250, 255, 295, 260);
    quad(250, 250, 295, 210, 298, 215, 253, 255);
  } 
  else {
    //cannon
    fill(20, 40, 30);
    quad(15, 270, 55, 250, 65, 270, 25, 290);
    //pig
    fill(0);
    ellipse(25, 285, 20, 20);
    fill(255);
    ellipse(25, 285, 15, 15);
    fill(0);
    ellipse(25, 285, 5, 5);

    if (mouseX<250) {
      //pig
      fill(45, 255, 0);
      ellipse(275, 285, 20, 20);
      ellipse(270, 282, 3, 3);
      ellipse(280, 282, 3, 3);
      ellipse(275, 288, 10, 10);
      line(273, 286, 273, 288);
      line(277, 286, 277, 288);
      //hut
      fill(193, 115, 51);
      rectMode(CORNERS);
      rect(250, 260, 255, 295);
      rect(250, 255, 295, 260);
      quad(250, 250, 295, 210, 298, 215, 253, 255);
    }

    else {
      //exploded hut
      fill(193, 115, 51);
      rectMode(CORNERS);
      rect(225, 290, 260, 295);
      quad(253, 285, 287, 275, 289, 280, 255, 290);
      quad(267, 285, 296, 254, 300, 257, 270, 289);
      //squished pig
      fill(45, 255, 0);
      ellipse(280, 293, 30, 12);
      ellipse(280, 295, 20, 5);
      line(275, 293, 275, 296);
      line(285, 293, 285, 296);
      line(277, 290, 277, 292);
      line(283, 290, 283, 292);
    }//closes the if statement for the exploded hut
  }//closes the if statement for the cannon ball rang for hitting the hut
}


