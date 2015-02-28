
void setup (){
  
size (400,400);
background (60,60,60);
smooth ();
noStroke ();
fill (255,95);

//Kreise groß Ecke
ellipse (0,0,250,250);
ellipse (400,0,250,250);
ellipse (0,400,250,250);
ellipse (400,400,250,250);
//Kreise Mitte
ellipse (width/2,height/2,350,350);
ellipse (width/2,height/2,200,200);
//abdunkeln
noStroke ();
fill (0,70);
rect (0,0,400,400);
//Kreise klein Ecke
fill (255);
ellipse (0,0,50,50);
ellipse (400,0,50,50);
ellipse (0,400,50,50);
ellipse (400,400,50,50);
}

void draw () {

ellipse (mouseX,mouseY,50,50);
noCursor ();
if (mousePressed) {fill (0,80); stroke (0); ellipse (mouseX,mouseY,100,100);} else
{fill (255,30); noStroke ();}

    
}
