
//Julie Romano
//New Critter
 
void setup() {
  size (500, 500); //the size of perimeter
  smooth(); //turns on anit-alliasing, which smooths out some rough edges
}
 
void draw () {
  background (51, 255, 204); //turquoise
   
  ellipseMode(CENTER);
   
  //Body
  stroke(0); //black
  fill(245, 184, 0); //mango
  //ellipse(160, 130, 80, 80);
  ellipse(mouseX, mouseY, 80, 80);
   
  //Right eye
  stroke(0); //black
  fill(50); //almost black
  //ellipse(145, 125, 10, 10);
  ellipse(mouseX-15, mouseY-5, 10, 10);
   
  //Left eye
  stroke(0); //black
  fill(50); //almost black
  //ellipse(175, 125, 10, 10);
  //ellipse(175, 125, 10, 10);
  ellipse(mouseX+15, mouseY-5, 10, 10);
   
   
   
  //Beak
  stroke(0);
  fill(255, 102, 51); //purpley = 204, 51, 255
  //triangle(160, 160, 170, 140, 150, 140);
  triangle(mouseX, mouseY+30, mouseX+10, mouseY+10, mouseX-10, mouseY+10); 
   
   
  //Hat
  stroke(0);
  fill(204, 255, 51); //lime
  //triangle(130, 100, 190, 100, 160, 50);
  triangle(mouseX-30, mouseY-30, mouseX+30, mouseY-30, mouseX, mouseY-80);
   
   
   
   
  //Right arm
  stroke(0);
  strokeWeight(1);
  line(120, 130, 100, 150);
   
  //Right hand
  stroke(0); //black
  fill(255, 102, 51); //Pick color!!!
  ellipse(95, 155, 10, 10);
   
  //Left arm
  stroke(0);
  strokeWeight(1);
  line(200, 130, 220, 150);
   
  //Left hand
  stroke(0); //black
  fill(255, 102, 51); //Pick color!!!
  ellipse(225, 155, 10, 10);
   
   
   
   
   
  //Right leg
  stroke(0);
  strokeWeight(1);
  line(140, 160, 140, 345);
   
  //Right foot
  stroke(0); //black
  fill(255, 102, 51); //Pick color!!!
  ellipse(135, 345, 10, 10);
   
  //Left leg
  stroke(0);
  strokeWeight(1);
  line(180, 160, 180, 345);
   
  //Left foot
  stroke(0); //black
  fill(255, 102, 51); //Pick color!!!
  ellipse(185, 345, 10, 10);
   
  //Star
  beginShape();
  vertex(150, 60); //A
  vertex(160, 40); //B
  vertex(170, 60); //C
  vertex(150, 50); //D
  vertex(170, 50); //E
  endShape(CLOSE);
   
}
  


