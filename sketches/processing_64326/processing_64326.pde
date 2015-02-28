
void setup (){
  
size (400,400);
background (255);
smooth ();
noStroke ();
fill (255,95);


}

void draw () {

line (mouseX,mouseY,200,200);
noCursor ();
if (mousePressed) {fill (0,50); ellipse (mouseX,mouseY,50,50);} else
{stroke (255); fill (255);}


    
}
