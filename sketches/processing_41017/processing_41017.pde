
//setup and background  

void setup() {  

  size(870, 470);
}

//create new funtion for the ellipses

void makeEllipses() {

  // left side ellipses  

    //orange
  noFill();  

  strokeWeight(10);  

  stroke(216, 107, 72);  

  ellipseMode(CENTER);  

  ellipse(0, 300, 210, 210);  

  //yellow  

  noFill();  

  strokeWeight(10);  

  stroke(239, 209, 83);  

  ellipseMode(CENTER);  

  ellipse(0, 300, 125, 125);  

  //white  

  fill(255);  

  stroke(216, 107, 72);  

  strokeWeight(1);  

  ellipseMode(CENTER);  

  ellipse(0, 300, 117, 117);
}

void thickLine() {
  stroke(0);  

  strokeWeight(2);  

  line(0, 170, 80, 205);  

  line(0, 169, 80, 205);  

  line(0, 168, 80, 205);  

  line(0, 167, 80, 205);  

  line(0, 166, 80, 205);  

  line(0, 165, 80, 205);
}


void makeQuadrants() {

  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  quad(20, 75, 60, 52, 84, 89, 45, 113);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(60, 52, 95, 30, 119, 68, 84, 89);  



  fill(115, 113, 97);  

  stroke(0);  

  strokeWeight(3);  

  quad(95, 30, 133, 6, 158, 46, 121, 68);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(45, 113, 84, 89, 107, 127, 69, 150);  



  fill(115, 113, 97);  

  stroke(0);  

  strokeWeight(3);  

  quad(84, 89, 119, 68, 141, 107, 107, 127);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(121, 68, 158, 46, 181, 84, 145, 105);  



  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  quad(69, 150, 107, 127, 132, 167, 95, 190);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(107, 127, 141, 107, 165, 147, 132, 167);  



  fill(115, 113, 97);  

  stroke(0);  

  strokeWeight(3);  

  quad(145, 105, 181, 84, 206, 123, 170, 144);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(95, 190, 132, 167, 159, 210, 123, 232);  



  fill(117, 117, 96);  

  stroke(0);  

  strokeWeight(3);  

  quad(132, 167, 165, 147, 192, 192, 159, 210);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(170, 144, 206, 123, 234, 167, 199, 187);  



  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  quad( 95, 30, 76, 0, 126, 0, 133, 6);   



  fill(137, 98, 56);  

  stroke(0);  

  strokeWeight(3);  

  quad(159, 210, 192, 192, 360, 470, 337, 470);  



  fill(137, 98, 56);  

  stroke(0);  

  strokeWeight(3);  

  quad(199, 187, 234, 167, 420, 470, 400, 470);  



  fill(233, 226, 213);  

  stroke(0);  

  strokeWeight(3);  

  quad(190, 0, 220, 0, 240, 0, 204, 20);  



  fill(227, 203, 203);  

  stroke(0);  

  strokeWeight(3);  

  quad(204, 20, 233, 4, 255, 39, 227, 56);  



  fill(233, 226, 213);  

  stroke(0);  

  strokeWeight(3);  

  quad(233, 4, 240, 0, 323, 0, 255, 39);  



  fill(178, 100, 40);  

  stroke(0);  

  strokeWeight(3);  

  quad(227, 56, 255, 39, 520, 470, 507, 470);  



  fill(34, 33, 30, 170);  

  stroke(0);  

  strokeWeight(3);  

  quad(700, 0, 730, 0, 195, 340, 185, 325);  



  fill(152, 52, 25);  

  stroke(0);  

  strokeWeight(3);  

  quad(185, 325, 195, 340, 0, 470, 0, 450);
}
//create function for grid
void makeGrid() {  

  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  line(580, 140, 870, 140);  

  line(580, 210, 870, 210);  

  line(580, 280, 870, 280);  



  line(690, 70, 690, 380);  

  line(760, 70, 760, 380);  

  line(830, 70, 830, 380);  



  fill(255);  

  stroke(0);  

  strokeWeight(3);  

  rect(690, 140, 70, 70);  

  rect(760, 210, 70, 70);  



  fill(153, 66, 51);  

  stroke(0);  

  strokeWeight(3);  

  rect(760, 140, 70, 70);  



  fill(184, 150, 118);  

  stroke(0);  

  strokeWeight(3);  

  rect(690, 210, 70, 70);
}

//create function for green triangle  
void makeTriangle() {
  fill(97, 121, 79);  

  stroke(0);  

  strokeWeight(1);  

  triangle(0, 300, 0, 470, 100, 470);
}

//create function for white overlapped ellipse  and black arc
void blackWhite() {
  fill(255);  

  stroke(0);  

  strokeWeight(2);  

  ellipseMode(CENTER);  

  ellipse(0, 300, 60, 60);  

  fill(0);  

  noStroke();  

  arc(0, 300, 60, 60, 0, PI /3);  

  arc(0, 300, 60, 60, -PI, 0);
} 

//create function for green shadow upper left side  
void greShadow() {
  stroke(97, 121, 79);  

  strokeWeight(3);  

  line(0, 171, 85, 210);  

  line(0, 174, 85, 210);  

  line(0, 176, 85, 210);
}  
//create function upper left quadrant  
void draLeft() {

  fill(0);  

  noStroke();  

  quad(0, 120, 20, 100, 35, 120, 0, 147);
}  
//draw top layers
void toLayers() {

  //line reference  

  stroke(0);  

  strokeWeight(3);  

  line(20, 75, 280, 470);  

  line(20, 75, 140, 0);  

  line(159, 210, 250, 157);  

  //blue circle  

  fill(44, 83, 115, 210);  

  noStroke();  

  ellipseMode(CENTER);  

  ellipse(258, 235, 205, 205);  

  //top black stick  

  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  quad(530, 470, 500, 470, 102, 350, 107, 340);  

  //black squares  

  fill(0);  

  stroke(0);  

  strokeWeight(3);  

  triangle(500, 0, 537, 0, 510, 15);  

  quad(575, 0, 605, 53, 549, 84, 520, 35);
}  

void draw() {
  background(227, 217, 183);  

  smooth();
  makeEllipses();
  thickLine();
  makeQuadrants();
  makeGrid();
  makeTriangle();
  blackWhite();
  greShadow();
  draLeft();
  toLayers();
}
void keyPressed() {  

  saveFrame("kandinsky-###.jpeg");
} 














