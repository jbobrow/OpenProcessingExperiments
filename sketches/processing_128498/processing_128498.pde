
//Kevin Kan (kkan) Copyright © 2014
  size(400,400);
  background(214, 213, 175);
  noStroke();
  //Base Shape
    fill(64, 64, 60);
    quad(50, 50, 100, 80, 100, 350, 50, 320);
    quad(120, 50, 170, 80, 170, 200, 120, 170);
    quad(120, 200, 170, 230, 170, 320, 120, 350);
   //Shadow
    fill(52, 51, 43);
    quad(75, 65, 100, 80, 100, 350, 75, 335);
    quad(145, 65, 170, 80, 170, 200, 145, 185);
    quad(145, 215, 170, 230, 170, 320, 145, 335);
//Overlay
 fill(255, 255, 255);
  //overlay circle
    ellipse(75, 65, 25, 25);
    ellipse(75, 335, 25, 25);
    ellipse(145, 65, 25, 25);
    ellipse(145, 335, 25, 25);
  //Overlay Lines
    stroke(255, 255, 255);
    strokeWeight(1);
    strokeJoin(MITER);
    noFill();
      //Shape XY
        beginShape();
        vertex(145, 65);
        vertex(145, 125);
        vertex(75, 125);
        vertex(75, 65);
        vertex(75, 335);
        vertex(75, 275);
        vertex(145, 275);
        vertex(145, 335);
        endShape();
      //Diagonal Line
        line(145, 125, 75, 170);
        line(145, 275, 75, 230);

//Second letter
  noStroke();
  fill(64, 64, 60);
  rect(200, 0, 200, 400);
//Ellipse Lowest Opacity
fill(255,255,255, 10);
 //Vertical
    ellipse(295, 65, 25, 25);
    ellipse(295, 133, 25, 25);
    ellipse(295, 200, 25, 25);
    ellipse(295, 268, 25, 25);
    ellipse(295, 335, 25, 25);
  //Bezier
    ellipse(365, 65, 25, 25);
    ellipse(365, 133, 25, 25);
    ellipse(340, 200, 25, 25);
    ellipse(365, 268, 25, 25);
    ellipse(365, 335, 25, 25);
//Ellipse light Opacity
fill(95,95,95);
  //Vertical
    ellipse(285, 65, 25, 25);
    ellipse(285, 133, 25, 25);
    ellipse(285, 200, 25, 25);
    ellipse(285, 268, 25, 25);
    ellipse(285, 335, 25, 25);
  //Bezier
    ellipse(355, 65, 25, 25);
    ellipse(355, 133, 25, 25);
    ellipse(330, 200, 25, 25);
    ellipse(355, 268, 25, 25);
    ellipse(355, 335, 25, 25);
//Ellipse grey
fill(142, 140, 140);
  //Vertical
    ellipse(275, 65, 25, 25);
    ellipse(275, 133, 25, 25);
    ellipse(275, 200, 25, 25);
    ellipse(275, 268, 25, 25);
    ellipse(275, 335, 25, 25);
  //Bezier
    ellipse(345, 65, 25, 25);
    ellipse(345, 133, 25, 25);
    ellipse(320, 200, 25, 25);
    ellipse(345, 268, 25, 25);
    ellipse(345, 335, 25, 25);
//White Ellipse
fill(255, 255, 255);
  //Vertical
    ellipse(265, 65, 25, 25);
    ellipse(265, 133, 25, 25);
    ellipse(265, 200, 25, 25);
    ellipse(265, 268, 25, 25);
    ellipse(265, 335, 25, 25);
  //Bezier
    ellipse(335, 65, 25, 25);
    ellipse(335, 133, 25, 25);
    ellipse(310, 200, 25, 25);
    ellipse(335, 268, 25, 25);
    ellipse(335, 335, 25, 25);
//Beige Ellipse
  fill(214, 213, 175);
  //Vertical
    ellipse(255, 65, 25, 25);
    ellipse(255, 133, 25, 25);
    ellipse(255, 200, 25, 25);
    ellipse(255, 268, 25, 25);
    ellipse(255, 335, 25, 25);
  //Bezier
    ellipse(325, 65, 25, 25);
    ellipse(325, 133, 25, 25);
    ellipse(300, 200, 25, 25);
    ellipse(325, 268, 25, 25);
    ellipse(325, 335, 25, 25);
//Overlay Beige
  stroke(214, 213, 175);
  strokeWeight(1);
  line(255, 65, 255, 335);
  line(255, 200, 300, 200);
  //Shape
    noFill();
    beginShape();
    vertex(325, 65);
    vertex(300,200);
    vertex(325, 335);
    endShape();
      



