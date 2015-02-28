
void setup ()  

{size (800,800);

noCursor();
noStroke();
smooth();}


void draw () 

{background(#FFFFFF);

fill(0);
rect(mouseX,mouseY,20,20);
  
if(mousePressed) 

{background(0);

fill(#FFFFFF);
ellipse(mouseX,mouseY,200,200);}}

