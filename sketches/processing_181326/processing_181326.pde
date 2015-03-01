
//Scalable House by chaging the house width variable

void setup() {
  size(1000, 800);
  background(255);
}
void draw() {
  strokeWeight(3);
  fill(123, 190, 240, 120); //BABY BLUE
  rect (0, 0, 1500, 750); //sky
  fill(#09BC52); //GREEN
  rect(0, 450, 1500, 350);  //ground
  fill(#834F1B);
  rect(230, 330, 20, 370);  //chimney
  fill(#E0E0E0);
  rect(220, 320, 40, 15);  //chimney top 
  fill(70);
  quad(250, 350, 850, 350, 870, 560, 230, 560);
  fill(183, 118, 54);  //BROWN
  rect(250, 560, 600, 160); //main house
  fill(123, 190, 240);
  rect(275, 570, 40, 80);  //window1
  line(275, 610, 315, 610);  //window sash
  rect(400, 570, 40, 80);  //window2
  line(400, 610, 440, 610);  //window 2 sash
  rect(680, 570, 100, 80);  //lg window right
  rect(680, 570, 50, 80);  //lg window right
  line(680, 610, 780, 610); //lg window sash
  fill(183, 118, 54);
  triangle(550, 425, 450, 560, 650, 560); //porch roof
  rect(475, 560, 145, 160);  //porch
  fill(#E0E0E0);
  rect(485, 720, 120, 110);
  strokeWeight(3);
  fill(#834F1B);
  rect(510, 580, 75, 130);  //door
  ellipse(580, 640, 5, 5); //doorknob
  fill(#E0E0E0);
  rect(0, 780, 1500, 20);
  noStroke();
  ellipseMode(CENTER);
  fill(129,201,245);  //OUTER RING BLUE
  ellipse(130,130,240,240);  //SUN
  fill(157, 213, 255);  //2ND RING BLUE
  ellipse(130, 130, 150, 150); //SUN
  fill(252, 255, 170);  //RAYS YELLOW
  ellipse(130, 130, 90, 90); //SUN
  fill(255, 251, 118);  //YELLOW
  ellipse(130, 130, 50, 50); //SUN
  stroke(1);
}



