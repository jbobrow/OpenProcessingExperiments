
/* Lewitt Instructions 305
Based off the code by Jan Vantomme (OpenProcessing)
This code explores the computational drawing mehtods of
Sol Lewitt, with the purpose of having a computer
reveal patterns.
26 Feb 2015
Elio Icaza, RISD 2015
*/

int numPoints = 50; 
PVector[] points = new PVector[numPoints];

PFont f;
int fontSize;

int mouseClicks;


void setup()
{
    size( 600, 600 );
     
    for (int i = 0; i < numPoints; i++) {
        points[i] = new PVector( random(width), random(height-200) );
    }
    
fill(0);
 fontSize = 12;
  f = createFont ("Rockwell", fontSize);
   textFont (f, fontSize);

}

void draw(){

    smooth();
    background(255);
    noFill();
    
    for (int i = 0; i < numPoints; i++) {
        for (int j = 0; j < numPoints; j++) {
            strokeWeight(1);
            if(j!=i){
                    line( points[i].x, points[i].y, points[j].x, points[j].y );
                }               
            }
        stroke( 0 );
        strokeWeight(4);
        point( points[i].x, points[i].y );
 
    text("Lewitt_Instructions",400,460);
    text("Processing_Workshop_ID",400,476);
    text("Iteration 1.   ",400,492);
    text("source_code:Jan Vantomme",400,508);
    text("13 Feb 2015",400,524);
    text(mouseClicks+"", 462,492);
   
  }
}

void mouseClicked(){
  for (int i = 0; i < numPoints; i++) {
        points[i] = new PVector( random(width), random(height-200) );
  }
  
  //This adds a number each time you click on the screen
  // Expressed as "Iteration 1.(x, x+1, x+2, ... x+a)"
         if (mouseButton == LEFT) { 
         mouseClicks++; 
       } else { 
       mouseClicks = 0; 
       }
}


