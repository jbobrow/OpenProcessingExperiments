
void setup(){

size(800,800);
background(94,0,200);
}


void draw(){
noStroke ();
fill(0,mouseX,mouseY);
ellipse(mouseX,mouseY,mouseX,mouseY);

noStroke ();
fill(0,0,mouseX);
ellipse (mouseX,mouseY,mouseX,mouseX);

noStroke ();
fill(100,0,mouseX);
ellipse(mouseY,mouseX,mouseY,mouseX);

stroke(100,0,200);
fill(0,mouseY,100,75);
ellipse(mouseY,mouseY,mouseX,mouseX);

noStroke ();
fill(mouseX,0,mouseY,50);
ellipse(mouseX,mouseX,mouseY,mouseY);
}
                                
