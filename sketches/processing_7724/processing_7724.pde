
int c;// on the wall set a variable
void setup(){ // this runs once, at the beginning
  size(400,400); //size -must go first in set up
background(255);
noStroke();
c=-50; // set c=0
}
void draw(){ //this runs repeatedly untilll we press stop
background(255,100,12); // to erase de trace of the circle
ellipse(200,c%500 - 50,100,100);
fill(230,mouseY,mouseX);
c = c+1; // add 1 to c bigger number faster movement
}

