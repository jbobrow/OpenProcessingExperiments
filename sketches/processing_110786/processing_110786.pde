
void setup() {
  size(600,800);
  background(206, 206, 185);
}

void draw() {
  
  fill(0);
  ellipse(175, 450, 200, 200);
  noFill();
  
  strokeWeight(2);
  line(100, 368, 350, 368);
  strokeWeight(1);
  line(340, 350, 340, 550);
  strokeWeight(1);
  line(100, 368, 310, 600);
  line(310, 600, 175, 600);
  
  strokeWeight(4);
  line(185, 605, 220, 605);
  line(202, 620, 202, 580);
  
 
  
  noStroke();
  fill(93);
  quad(310, 447, 375, 447, 270, 270, 240, 319);//when this is behind lines, lines don't show for some reason.
  
  fill(206, 206, 185); //way to group these quads+rec to all move with mouse?
  quad(260, 347, 275, 347, 250, 319, 240, 319);
  noStroke();
  fill(108);
  quad(260, 347, 260, 363, 240, 330, 240, 320);
  fill(0);
  rect( 260, 347, 18, 18); //260, 347, or mouseX/Y. change fill redraw?
  noFill();
  
}
