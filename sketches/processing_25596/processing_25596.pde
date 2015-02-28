
//Clarisse Djaja First Sketch
//01.02.2011

void setup(){
size(200,200);
smooth();
}


void draw(){
background(155,153,160);

///left hand
line(40,50,75,75);

///right hand
line(160,70,80,75);

///body
fill(255);
ellipseMode(CENTER);
ellipse(100,150,100,100);

///body
fill(255);
ellipseMode(CENTER);
ellipse(100,90,70,70);

///head
fill(255);
ellipseMode(CENTER);
ellipse(100,50,50,50);

///hat
fill(0);
stroke(0);
rect(mouseX,mouseY,60,5);

///top hat
fill(0);
stroke(0);
rect(mouseX+5,mouseY-25,50,30);

///left eye
fill(0);
ellipseMode(CORNER);
ellipse(80,40,10,10);

///right eye
fill(0);
ellipseMode(CORNER);
ellipse(100,40,10,10);

///nose;
fill(245,163,10);
triangle(95,60,70,65,88,53);
}

