
//Jade Tindal
void setup () {
  // size of the window
size(200,200);
}

void draw () {
  //lime green backgorund
background(21,250,73);
//set CENTER mode
ellipseMode (CENTER);

//Draw White, circle head
fill(255);
ellipse(mouseX, mouseY,100,100);

//draw black circle eyes
fill(0);
ellipse (80,90,20,20);
ellipse (120,90,20,20);

//straight line mouth
line(80,120,120,120);
}

