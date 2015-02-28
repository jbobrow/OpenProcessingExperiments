
//Just wanted to check what paths these circles do.


void setup(){
size(400,400);

background(0);
smooth();

}

float theta = 0;

void draw(){
float radius=150;
//background(0);
translate(width/2,height/2);
ellipseMode(CENTER);

fill(frameCount % 255,
     (2 * frameCount) % 255,
     (3 * frameCount) % 255
     );
//fill(255);
noStroke();
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
