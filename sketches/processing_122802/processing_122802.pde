
void setup() {
size (300,300);

}

void draw () {

background (255,255,255);
  
noStroke ();
fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX-50,mouseY+75,50,50);


fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX+50,mouseY+75,50,50);


fill (100,0,100);
ellipseMode (CENTER);
ellipse (mouseX,mouseY,180,150);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX-25,mouseY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX-25,mouseY-25,20,20);


stroke (0,0,0);
fill (250,250,250);
ellipseMode (CENTER);
ellipse (mouseX+25,mouseY-25,50,50);


fill (0,0,0);
ellipseMode (CENTER);
ellipse (mouseX+25,mouseY-25,20,20);


}













