
void setup(){
size(400,400);

}

float theta = 0;

void draw(){
float radius=150;
background(0);
translate(width/2,height/2);
ellipseMode(CENTER);

stroke(255);
noFill();
//ellipse(0,0,radius,radius);
rotate(theta);

float xval = radius * cos(theta);
float yval = radius * sin(theta);
ellipse(xval,0,10,10);
ellipse(0,yval,10,10);
ellipse(yval,0,10,10);
ellipse(0,xval,10,10);

ellipse(-xval,0,10,10);
ellipse(0,-yval,10,10);
ellipse(-yval,0,10,10);
ellipse(0,-xval,10,10);

rotate(theta+PI/4);
ellipse(xval,0,10,10);
ellipse(0,yval,10,10);
ellipse(yval,0,10,10);
ellipse(0,xval,10,10);

ellipse(-xval,0,10,10);
ellipse(0,-yval,10,10);
ellipse(-yval,0,10,10);
ellipse(0,-xval,10,10);
theta+=.01;
}
