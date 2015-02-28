
void setup() {
size(250, 250);
background(0,128,128);
smooth();
}

void draw(){
//orange
fill(242,143,0);
if (mousePressed);

stroke(0);
strokeWeight(2);
ellipse(mouseX, mouseY, 60, 60);

if (keyPressed)
//goes green
stroke (20,100,20);
strokeWeight(6);
// of dots on top
ellipse(mouseX,20, 20,20);

//clear the canvas
if(mousePressed)
background(0,128,128);
}


