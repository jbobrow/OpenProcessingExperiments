
int c;// on the wall set a variable
void setup(){ // this runs once, at the beginning
  size(800,400); //size -must go first in set up
background(12,250,0); 
smooth();
frameRate(10);
c=0; // set c=0
}
void draw(){ //this runs repeatedly untilll we press stop
//background(255); // to erase de trace of the circle
//noFill();
fill(255,mouseX,mouseY,120);//last value transparence

noStroke();

float cx = 200+random(-50,50);//random(width);
float cy = random(height);
float csize = random(5, 100);
//float = a floating point number - 3.5324, 2.1, 0.000005
//random(400)  - a random number between 0 and 400
ellipse(cx,cy,csize,csize);
//c = c+1; // add 1 to c bigger number faster movement

 cx = 400+random(-50,50);//random(width);
 cy = random(height);
 csize = random(5, 100);
//float = a floating point number - 3.5324, 2.1, 0.000005
//random(400)  - a random number between 0 and 400
ellipse(cx,cy,csize,csize);
//c = c+1; // add 1 to c bigger number faster movement
}

void mousePressed () { // whenever the mouse is pressed, this hapens
background (225,mouseX,mouseY);

}

