
int sideLength = 50 ;
int numSides = 7;
float x, y, theta, deltaTheta ;
float foo = 1 ;
PFont font;


  size(numSides*150, 500);
  frameRate(30);
  smooth();
  
  
  // Initialize all values
  theta = 0 ;
  stroke(255) ;

// The font must be located in the sketch's 
// "data" directory to load successfully
   font = createFont("Verdana-Bold",12);
   textFont(font); 

  background(100);
  translate(50, height / 2);

for(int j = 1; j < numSides; j++){
    theta = 0 ;
    deltaTheta = ( PI * 2) / numSides ;
    

    
    x = sideLength * cos(theta) ;
    y = sideLength * sin(theta) ;
    line(0, 0, x, y) ;
    
    theta = theta + (j * deltaTheta) ;

      for ( int i = 0; i < (numSides-1); i=i+1)
      {
      // Translate the origin point to the end of last line
      translate(x, y);
      
      // Convert polar to cartesian
      x = sideLength * cos(theta) ;
      y = sideLength * sin(theta) ;
         
      line(0, 0, x, y);
          
      theta = theta + (j * deltaTheta) ;

      }
      
    //text(deltaTheta / (  PI  ), x, y);
    translate(150, 0);

}


