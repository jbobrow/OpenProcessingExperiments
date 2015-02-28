
float x, y, d;

void setup(){

size (450, 450);
smooth ();
noStroke();
x = 250;
y = 250;
d = 30;
}


void draw (){
background (240, 160, 99);
drawTarget (mouseX, mouseY, (mouseX+mouseY)*0.4);

}

void drawTarget (float x, float y, float d)
{
fill (252, 110, 250, 80);
ellipse (x, y, d, d);
fill (193, 123, 47, 50);
ellipse (x, y*1.03, d*0.3, d*0.3);
fill (0);
ellipse (x-10, y-50, d*0.05, d*0.05);
fill (0);
ellipse (x+30, y-50,d*0.05, d*0.05);
fill (252, 110, 250, 80);
ellipse (x-50,y-90,d*0.2,d*0.2);
fill (252, 110, 250, 80);
ellipse (x+50, y-90, d*0.2, d*0.2);

fill (252, 194, 196);
bezier (350, 355, 330, 320, 370, 320, 350, 355);
bezier (350, 355, 330, 390, 370, 390, 350, 355);
bezier (350, 355, 315, 335, 315, 375, 350, 355);
bezier (350, 355, 385, 335, 385, 375, 350, 355);

}

void mouseDragged ()
{
 drawTarget (mouseX, mouseY, (mouseX+mouseY)*0.4);
}




