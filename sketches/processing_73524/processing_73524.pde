
float xpos=0;
float ypos=0;
int ew=8; //elipse width
int eh=8; //elipse height

void setup () {
size(600, 600);
smooth();
frameRate(12);
colorMode(RGB);
}


void draw() {

fill(0, 0, 0, 20);
rect(0, 0, width, height); //creates a trail 

stroke(211,0,123);
strokeWeight(20);
fill(2,105,227);

if (ypos>height/2){
  ew= (ew+2);
}else{
  ew = (ew-2);
}
//creates the circles

ellipse(50, ypos, ew, eh);
//ellipse(100, ypos, ew, eh);
ellipse(150, ypos, ew, eh);
//ellipse(200, ypos, ew, eh);
ellipse(250, ypos, ew, eh);
//ellipse(300, ypos, ew, eh);
ellipse(350, ypos, ew, eh);
//ellipse(400, ypos, ew, eh);
ellipse(450, ypos, ew, eh);
ellipse(550, ypos, ew, eh);


ypos++; //moves circles down


if(ypos<height) //when the circles reach bottom
{
ypos+=25;
}else{
ypos=0;
}

stroke(2,105,227);
strokeWeight(20);
fill(211,0,123);

ellipse(100, ypos, ew-5, eh-5);
ellipse(200, ypos, ew-5, eh-5);
ellipse(300, ypos, ew-5, eh-5);
ellipse(400, ypos, ew-5, eh-5);
ellipse(500, ypos, ew-5, eh-5);


if(ypos<height) //when the circles reach bottom
{
ypos+=25;
}else{
ypos=0;

}
}


