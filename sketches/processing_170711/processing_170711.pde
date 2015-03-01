
//Processing Final Project by Debora Tzunun & Maria Nieves

color start=color(0,0,0);
color finish;
float amt = 0.0;
float  r= 1.0;
PFont f;//variable to display our text



void setup() {
size(400,400);
background(start); 
finish = color(random(255),random(255),random(255));
}

void draw() {
amt+=.03;
 if (amt >= 3) {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }

background(lerpColor(start,finish,amt)); // creates colorful background 
// shape follows the mouse
ellipse(mouseX,mouseY,50,50);
rect(mouseX,mouseY,50,40);
rect(mouseX,mouseY,50,30);
rect(mouseX,mouseY,10,10);
ellipse(mouseX,mouseY,10,10);
// Creates different sized circles
ellipse(random(1,400),random(1,400), random(1,60), random(1,60));
ellipse(random(1,400),random(1,400), random(1,60), random(1,60));
fill(random(255),random(255),random(255));// Makes shapes colorful
}


void mousePressed() {
  background(0); // turns background black

//Extra Credit- Dislplaying a Text 
f = createFont("Chalkduster",70,true);// the style of the text
text ("BOOM",10,100); //our text that will display when the mouse is clicked
text ("POW!!",10,200); 
text ("POW!!",10,300); 
textFont(f,70);// variable and size
}

