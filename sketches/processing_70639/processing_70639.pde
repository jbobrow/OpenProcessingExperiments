
void setup() {
size(512, 512);          // size of the background
smooth();
frameRate(30);
}
void draw() {            //draw a black background
background (128);
rectMode (CENTER);       // center mode...
ellipseMode (CENTER);    // ...for both

//draw head
stroke (0);
fill (230, 15, 0);
rect (mouseX+45, mouseY+35, 50, 50);
fill (mouseX+35,0,mouseY+25);
ellipse (mouseX+35, mouseY+25, 10, 10);
ellipse (mouseX+55, mouseY+25, 10, 10);
fill (255);
rect (mouseX+45, mouseY+45, 30, 10);
line (mouseX+30, mouseY+40, mouseX+40, mouseY+50);
line (mouseX+40, mouseY+40, mouseX+40, mouseY+50);
line (mouseX+50, mouseY+40, mouseX+50, mouseY+50);
line (mouseX+60, mouseY+40, mouseX+50, mouseY+50);

//draw body
ellipse (mouseX+45, mouseY+90, 50, 40);
fill (80, 80, 200);
ellipse (mouseX+45, mouseY+90, 30, 10);

//draw legs and feet
fill (80, 160, 20);
rect (mouseX+20, pmouseY+135, 20, 10);
rect (mouseX+70, pmouseY+135, 20, 10);
fill (0);
line (mouseX+30, mouseY+105, pmouseX+30, pmouseY+130);
line (mouseX+60, mouseY+105, pmouseX+60, pmouseY+130);

//draw hand
fill (170);
ellipse (mouseX+90, pmouseY+80, 15, 15);
ellipse (mouseX+12, pmouseY+90, 15, 15);
}
void mousePressed() {
  stroke (0);
  println("Welcmoen to macdonadls");
}
