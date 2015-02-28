
Eye one; // first Eye
Eye two; //second Eye
void setup() {
  size (500,400);
  smooth();
 background(245,205,190);


one = new Eye (122,243, 42); // first Eye size
two = new Eye (374,245, 55); // second Eye size
}



void draw(){
 one.move();
 one.display();
  two.move();
  two.display();
}
  
class Eye {
  float x;
  float y;
  int diameter;
  float speed = .5;
  Eye(float tempX, float tempY, int tempDiameter) {
x = tempX;
y = tempY;
diameter = tempDiameter;
}
void move() {
x += random(-speed,+speed);
y += random(-speed,speed);
}
void display() {
ellipse(x,y,diameter,diameter);
fill(0,150,300);
}

//eyes
{
fill(0);
ellipse(132,245,257,257);  //left lens
fill(255);
ellipse(132,245,210,209); //left eye

fill(0);
ellipse(368,250,258,256); //right lens
fill(255);
ellipse(368,250,210,209); //right eye

fill(245,205,205); //cute nose
ellipse(251,318,42,34);

fill(0); //right eye brow
rect(280,60,193,36);

fill(0);  //left eye brow
beginShape();
vertex(23,84);
vertex(209,34);
vertex(218,68);
vertex(32,118);
vertex(23,84);
endShape();
}
}


