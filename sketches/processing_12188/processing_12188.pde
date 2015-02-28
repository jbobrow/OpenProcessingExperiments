
void setup(){
  //the canvas size
  size(200,300);
   //background color
  background(200,200,255);
}
void draw(){
//tail
ellipseMode(CENTER);
ellipse(180,150,25,25);
//body
rectMode(CORNER);
rect(55,150,125,75);
//face
ellipseMode(CENTER);
ellipse(70,150,75,75);
//ears
fill(255,200,200);
ellipseMode(CORNERS);
ellipse(45,35, 75,120);
ellipseMode(CORNERS);
ellipse(70,35,100,120);
//eyes
strokeWeight(2);
line(45,150,55,155);
line(55,150,45,155);
line(75,150,85,155);
line(85,150,75,155);
//lines
strokeWeight(1);
line(85,200,85,225);
line(145,200,145,225);
}


