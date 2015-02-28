
//hippo

void setup () {
size (500,500);
}
void draw () {
background (63.75,127.5,63.75);
ellipseMode (CENTER);
strokeWeight (25);
fill (127.5);
stroke (63.75);
ellipse (125,50,50,50);
ellipse (375,50,50,50);
rectMode (CENTER);
strokeWeight (1);
fill (51);
stroke (51);
quad (50,500,100,300,400,300,450,500);
fill (63.75);
stroke (63.75);
rect (250,150,300,200);
fill (255);
stroke (0);
ellipse (150,100,75,75);
ellipse (350,100,75,75);
strokeWeight (10);
stroke (87,46,9);
fill (0);
ellipse ((mouseX+100),100,25,25);
ellipse ((mouseX-100),100,25,25);
fill (63.75);
stroke (63.75);
ellipse (150,-mouseY+450,75,75);
ellipse (350,-mouseY+450,75,75);
strokeWeight (1);
fill (63.75);
stroke (63.75);
ellipse (150,162.5,75,75);
ellipse (350,162.5,75,75);
fill (57,21,21);
stroke (85);
strokeWeight (25);
rect (250,300,300,mouseY-50);
fill (0);
stroke (0);
ellipse (250,325,150,mouseY-300);
fill (144,13,13);
stroke (144,13,13);
ellipse (250,350,200,mouseY-300);
fill (127.5);
stroke (127.5);
ellipse (200,mouseY+50,50,50);
ellipse (300,mouseY+50,50,50);
fill (85);
stroke (85);
rect (250,mouseY+100,300,100);
fill (170);
stroke (170);
ellipse (150,-mouseY+550,50,50);
ellipse (350,-mouseY+550,50,50);
fill (85);
stroke (85);
rect (250,-mouseY+500,300,100);
fill (15);
stroke (15);
strokeWeight (1);
ellipse (175,-mouseY+500,20,10);
ellipse (325,-mouseY+500,20,10);
}


