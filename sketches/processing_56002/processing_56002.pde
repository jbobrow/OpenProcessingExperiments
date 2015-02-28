
void setup(){
  size(720, 480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//neck
stroke(102);
line(266, 257, 266, 162);
line(276, 257, 276, 162);
line(286, 257, 286, 162);

line(276, 155, 246, 112);
line(276, 155, 306, 56);
line(276, 155, 342, 170);

noStroke();
fill(102);
ellipse(264, 377, 33, 33);
fill(0);
rect(219, 257, 90, 120);
fill(102);
rect(219, 274, 90, 6);

fill(0);
ellipse(276, 155, 45, 45); 
fill(255); 
ellipse(288, 150, 14, 14); 
fill(0); 
ellipse(288, 150, 3, 3); 
fill(153); 
ellipse(263, 148, 5, 5); 
ellipse(296, 130, 4, 4); 
ellipse(305, 162, 3, 3);



}




//my head
void draw(){
  
  strokeWeight(2);
  stroke(100);
  line(2*width/3, 350, 2*width/3, 360);
  stroke(0);
  fill(0);
  ellipse(2*width/3, 380, 20, 20);
  fill(100);
  ellipse(2*width/3, 380, 10, 10);
  
  noFill();
stroke(100, mouseY, mouseX);
ellipse(2*width/3, 80, 30, 30);

  noFill();
stroke(mouseY, 100, mouseX);
ellipse(2*width/3, 80, 50, 50);
  
  stroke(0);
  fill(0);
ellipse(2*width/3, 155, 50,50);
fill(mouseX, mouseY, 100);
ellipse(500, 145, 10, 10);
fill(mouseY, mouseX, 100);
ellipse(455, 145, 5, 5);
noFill();
stroke(100);
strokeWeight(2);
arc(2*width/3, 155, 40, 40, 1, 2.1);

//antennea
fill(100);
stroke(mouseY, mouseX, 100);
ellipse(2*width/3, 80, 10, 10);
stroke(100);
strokeWeight(2);
line(2*width/3, 105, 2*width/3, 90);

//body
noStroke();
fill(0);
triangle(2*width/3, 205, 2*width/3-60, 350, 2*width/3+60, 350);

//spots
fill(100, mouseX, mouseY);
ellipse(2*width/3, 230, 5, 5);
fill(mouseX, 100, mouseY);
ellipse(2*width/3, 245, 5, 5);
fill(mouseY, mouseX, 100);
ellipse(2*width/3, 260, 5, 5);
}


