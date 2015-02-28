
void setup() 

{size(600, 400);
  smooth();
  rectMode(CENTER);
  background(0);}
 

void draw() 

{if(mousePressed)

{stroke(#19FC0A,15);
noFill();
  ellipse(width/2, height/2, mouseX, mouseY);}
  
 else
 
 {stroke(#FFFFFF,15);
    noFill();
    ellipse(width/2, height/2,mouseX,mouseY);}}

