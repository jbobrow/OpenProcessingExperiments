
              



float x,y,angle;
int numLoops;


void setup(){

size(800,700);


x=0;

y=0;

angle=0;

smooth();
fill(255);

noStroke();

}

void draw(){


x=sin(radians(angle))*300+width/2;

y=tan(radians(angle))*300+height/2;

stroke(random(255),random(90),random(80));

line(angle,x,mouseX,mouseY);
fill(255,0);

ellipse(mouseX,mouseY,10,10);

angle++;

rect (mouseX,mouseY,10,10);   


  fill(mouseY,mouseX);
  ellipse(x,y,mouseX,mouseY);
 
  } 



void mouseReleased(){

background(random(255),random(90),random(80));

}

