
/* drawing function. when mouse pressed leaves a black outline
 press command s and to same image.
 Colette Laliberte
 email: cblaliberte@gmail.com
 website: www.colette.laliberte.com*/

void setup () {
  size (600, 600);
 background (0,145, 34,190); //refresh once
  smooth ();
}


void draw () {
 stroke (25);
  fill (85,103,63,10); //transp through shapes
  //fill (85,103,63,100);// transp opaque in the shapes
  
 quad (mouseX, mouseY,  300,50, 375,450, 250,520);
  quad (50, 100,300,50,375, 450,110,200); //tranparent dark green quad
 
 fill (243,247,42, 30);// yellow
 quad (150,150,300,50, 375, 450, 250,520);
 fill (100,147,42,130);// light green trans
  quad (300, 50,450,100,595, 200,375,450);
} 
   void keyPressed() {
  if(key =='s') save("filename.png");// when presses it replace the last saved picture version
  
} 


