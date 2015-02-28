
//lucinda threlfo processing
//Lesson one project
//Spring is Here!

//WHAT HAPPENS?
//1. petals change colour with mouse movement
//2. centre changes colour with mouse movement
//3. "Spring is here!"displayed in window with mouse click
//4. fly follows with mouse movement

void setup(){
  size(500,500);
  background(255);
  
}

void draw(){
  background(225);
  
  //stem// doesn't change
  fill(24,134,36);
rectMode(CORNER);
rect(120,90,10,130);

//petals// change colour with mouse movement
fill(mouseX,70,mouseY);
ellipse(80,60,40,40);
ellipse(80,90,40,40);
ellipse(100,110,40,40);
ellipse(125,120,40,40);
ellipse(155,112,40,40);
ellipse(170,90,40,40);
ellipse(170,60,40,40);
ellipse(157,35,40,40);
ellipse(125,27,40,40);
ellipse(97,34,40,40);


//centre// changes colour with mouse movement
fill(0,mouseX,mouseY);
ellipse(125,70,75,75);

//leaf// doesn't move
rotate(0.3);
fill(24,134,36);
ellipse(185,120,25,50);

//fly// moves with mouse
fill(0);
ellipse(mouseX,mouseY,10,20);
}

//window display
void mousePressed(){
  println("Spring is here!"); //Window reads "Spring is here!"
}



