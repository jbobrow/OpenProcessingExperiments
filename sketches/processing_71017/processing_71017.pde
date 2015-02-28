
PImage psyche ;

//variable to scan the picture vertically
int y = 0 ;

void setup () {
  psyche = loadImage ("psyche.jpg") ;
 // size(2*psyche.width,2*psyche.height) ; // to have that extra black background in the image
  size(600,600);
  smooth () ;
  noCursor () ;
  background (0) ;
  
}

void draw () {
  
   for (int b = 0; b < width ; b++) {
     
     color renk = psyche.get (b, y) ;
     stroke (renk) ; 
     triangle (mouseX,mouseY,b,b,mouseX,mouseY) ; //to be able to create images made of different sized and colored triangles
   }
   
   // update variable "y"
   y++ ; // y=y+1
   if (y >= height) {y=0 ;}
  
}

void keyPressed () {
   if (key=='s') {
     saveFrame("exports/img-####.tiff") ; // to save the frames you want
     
   }
}

