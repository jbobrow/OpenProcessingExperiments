
//Color of sheep's fur will and position of legs change according to mouse position. 

void setup() {
  size(200,200);
  println("Party!");
  ellipseMode(CENTER);
}
void draw() {
  background(135,206,235);
  //Ground
  rectMode(CORNER);
  fill(141,182,0);
  noStroke();
  rect(0,130,200,70);
  
  //Head
  stroke(0);
  strokeWeight(2);
  fill(251,206,177);
  ellipse(35,75,25,40);
  
  //Hair
  fill(255);
  ellipse(35,59,35,20);
  
  //Eyes
  stroke(0);
  strokeWeight(6);
  fill(0);
  point(30,75);
  strokeWeight(2);
  point(40,75);
  
  //Ears
  strokeWeight(2);
  fill(251,206,177);
  ellipse(18,70,7,15);
  ellipse(52,70,7,15);
  
  //Body
  frameRate(30);//colour changes with mouse speed and position
  fill(mouseX,0,mouseY);
  ellipse(75,50,35,35);
  fill(mouseX,mouseY,0);
  ellipse(60,60,15,15);
  fill(mouseY,0,mouseX);
  ellipse(70,75,20,20);
  fill(0,mouseX,mouseY);
  ellipse(58,87,22,22);
  fill(mouseY,mouseX,0);
  ellipse(84,98,35,35);
  fill(0,mouseY,mouseX);
  ellipse(60,100,10,10);
  fill(0,mouseY,mouseX);
  ellipse(90,80,25,25);
  fill(mouseX,mouseY,0);
  ellipse(100,60,17,17);
  fill(mouseY,mouseX,0);
  ellipse(89,50,22,22);
  fill(mouseX,0,mouseY);
  ellipse(120,70,39,39);
  fill(0,mouseX,mouseY);
  ellipse(110,45,20,20);
  fill(mouseY,0,mouseX);
  ellipse(100,100,15,15);
  fill(0,mouseX,mouseY);
  ellipse(110,90,25,25);
  fill(mouseX,0,mouseY);
  ellipse(125,80,20,20);
  fill(mouseY,mouseX,0);
  ellipse(120,100,27,27);
  fill(mouseY,0,mouseX);
  ellipse(140,89,24,24);
  fill(0,mouseX,mouseY);
  ellipse(140,70,15,15);
  fill(mouseX,0,mouseY);
  ellipse(125,45,15,15);
  fill(mouseY,0,mouseX);
  ellipse(130,55,19,19);
  fill(mouseX,mouseY,0);
  ellipse(85,65,13,13);
  fill(0,mouseY,mouseX);
  ellipse(60,70,10,10);
 
 //Tail
 fill(255);
 ellipse(150,60,20,10);
}
void keyPressed() {
 //Legs 
 frameRate(1);
 //legs changes position according to mouse position, by pressing key
 line(80,115,mouseX,130);
 line(80,115,70,130);
 line(120,115,mouseX-20,130);
 line(120,115,130,130);
 }
  

