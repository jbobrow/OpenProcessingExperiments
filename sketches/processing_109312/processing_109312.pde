
 // George Nee's "Schotter" (1968) 
 // http://www.medienkunstnetz.de/works/schotter/
 // Adam Ben-Dror, 09/09/2013


void setup() {
  size (500, 750);
  smooth();
  noFill();
//  rectMode(CENTER);
  noLoop(); 
}


void draw() {
 
  background (180); 
  
  float schotterSquareSize = width/24.0;
  int   nAcross = 12; 
  int   nDown   = 22;

  float xStart = 6*schotterSquareSize; 
  float xEnd = xStart + (nAcross-1)* schotterSquareSize; 

  float yStart = width/18*3;
  float yEnd = yStart + (nDown-1)* schotterSquareSize; 


  for (int i=0; i<nAcross; i++) {
    for (int j=0; j<nDown; j++) {

      float x = map(i, 0, nAcross-1, xStart, xEnd); 
      float y = map(j, 0, nDown-1,   yStart, yEnd); 

      pushMatrix();                        
      translate (x,y);
     
      // float myAngle = radians(45);
      float myAngle = DEG_TO_RAD * j* random(-2.5, 2.5);
      rotate (myAngle); //rotate(j*random(-.001, .001) );
      
      rect(0,0, schotterSquareSize, schotterSquareSize);
      popMatrix();
      println(j);
    }
  }

}







