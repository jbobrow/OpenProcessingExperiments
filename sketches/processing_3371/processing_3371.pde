
void setup(){size(600,600);}void draw(){smooth();float x=width/2;float y=height/2;stroke(mouseX,mouseY,mouseY);fill(mouseX,mouseY,mouseX);ellipse(x,y,mouseY,mouseX*2);ellipse(x,y,mouseX*2,mouseY);}

