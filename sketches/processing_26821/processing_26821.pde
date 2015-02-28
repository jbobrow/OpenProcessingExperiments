
void setup () {
size (400,400);
smooth();
frameRate (30);
}

void draw (){
background (5,252,230);


ellipseMode(CENTER);
rectMode (CENTER);

stroke(0);
fill(134,32,133);
rect(mouseX,mouseY,20,100);

fill (63,209,74);
ellipse(mouseX,mouseY-30,100,100);

fill (mouseX,0,mouseY);
ellipse(mouseX-19,mouseY -30,16,32);
ellipse(mouseX +19,mouseY-30,16,32);

stroke(0);
line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
line (mouseX+10, mouseY+50,pmouseX+10, pmouseY+60);
}

void mousePressed () {
  fill(155);
  println ("I HATE PROCESSING");
}

