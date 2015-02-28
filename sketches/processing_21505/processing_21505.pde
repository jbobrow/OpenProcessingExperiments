
void setup(){
  smooth();
  size(200,200);
}
void draw(){
  //draw background
background (18,80,105);
smooth();
ellipseMode(CENTER);
rectMode(CENTER); 
// Body
stroke(0);
fill(219,141,22);
ellipse(100,107,28,105);
// Armall
stroke(0);
line(100,50,100,25);
// Armaall
stroke(0);
line(70,100,130,100);
// Ball
fill(219,141,22);
ellipse(100,20,16,16); 
// Head
fill(145,247,30);
ellipse(100,70,60,60); 
// Eyes
fill(mouseY-50,mouseX-5,mouseY+266);
//original fill color 255,10,243
//fill(mouseY-50,mouseX-10,mouseY+20);
ellipse(81,70,16,32); 
ellipse(119,70,16,32);
// Legs
stroke(0);
line(90,150,mouseX,mouseY);
line(110,150,mouseX,mouseY);
}

