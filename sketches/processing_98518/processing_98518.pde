

//Danielle Gorodenzik
//Final Presentation Rough Draft 



float x_position = 100;
float y_position = 10;
void setup () {
  size(600, 600);
  smooth();
}
void draw() {
  background(0, 214, 144);



  //Four Corners

  //top left israel
  //Israel
  noStroke();
  fill(157, 227, 245);
  rect(0, 0, 100, 100);
  if ((mouseX>0)&&(mouseX<400))
    if ((mouseY>0)&&(mouseY<400)) {
      fill(255, 0, 0);
      noStroke();
      rect(0, 0, 800, 800);
    }

  //top right New York
  //New York
  noStroke();
  fill(244, 56, 19);
  rect(500, 0, 100, 100);

  if ((mouseX>400)&&(mouseX<800))
    if ((mouseY>0)&&(mouseY<400)) {
      fill(255, 14, 252);
      noStroke();
      rect(100, 100, 600, 600);
    }


  //bottom center Los Angeles
  //Los Angeles
  noStroke();
  fill(244, 188, 19);
  rect(270, 499, 100, 100);
  if ((mouseX>0)&&(mouseX<400))
    if ((mouseY>400)&&(mouseY<800)) {
      fill(0, 255, 39);
      noStroke();
      rect (300, 300, 200, 200);
    }




  //Airplane
  fill(0);
  ellipse (mouseX, mouseY, 20, 20);
}

