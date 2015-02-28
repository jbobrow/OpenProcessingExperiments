
void setup() {
  size(500, 500);
  colorMode (RGB, 500);
  //background(134); //background colour
  
  //set background colour
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
      stroke (i, j, 250);
      point(i, j);
    }
  }
  
  smooth(); //so that the image is not pixelated
  
  stroke(0);
  strokeWeight(7);
}

void draw() {
  
  // point(34, 82);
  
  color c1 = color(#969696);
  fill(c1);
  ellipse(140, 340, 100, 100); //circle medium - bottom left
  
  color c2 = color(#993333, 60);
  fill(c2);
  ellipse(390, 370, 125, 125); //circle large - bottom right
  
  color c3 = color(#cc99cc, 40);
  fill(c3);
  quad(30, 100, 180, 0, 275, 160, 130, 250); //large square
  
  color c4 = color(#ff3366, 10);
  fill(c4);
  ellipse(80, 70, 60, 60); //circle small - top left
  
  color c5 = color(#ccff66, 80);
  fill(c5);
  quad(80, 80, 50, 160, 130, 190, 160, 110); // small square

  line(70, 380, 340, 90); //first diagonal line from left
  line(0, 500, 290, 165); //second diagonal line from left
  line(30, 500, 235, 270); //third diagonal line from left
  
  
  //set of arrows from bottom upwards
  
  line(295, 460, 345, 450); //horizontal
  line(345, 450, 350, 500); //vertical
  
  line(310, 420, 365, 410); //horizontal
  line(365, 410, 375, 470); //vertical
  
  
  //set of arrows from top downwards
  
  line(395, 50, 415, 130); //vertical
  line(415, 130, 490, 110); //horizontal
  
  line(360, 115, 380, 195); //vertical
  line(380, 195, 455, 175); //horizontal
  
  line(320, 200, 335, 270); //vertical
  line(335, 270, 420, 255); //horizontal
  
  line(275, 280, 290, 350); //vertical
  line(290, 350, 375, 335); //horizontal
}

