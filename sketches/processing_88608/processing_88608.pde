
void setup () {
  size(1000,1000);//window size
  background(0);//Black Background
 
}
void draw () {  //enable movement

//circle1
fill(19,247,0);
stroke(mouseX-0,mouseY+130,30);
strokeWeight(10);
ellipse(mouseY,mouseX,150,150);

//circle2
fill(169,0,222);
stroke(mouseX-70,130,30);
strokeWeight(10);
ellipse(mouseX,mouseX,300,300);

//circle3
fill(3,0,196);
stroke(mouseX-20,0,150);
strokeWeight(10);
ellipse(mouseY,mouseY,200,200);

//circle4
fill(250,255,3);
stroke(mouseX-70,20,210);
strokeWeight(10);
ellipse(mouseX,mouseY,250,250);
}


