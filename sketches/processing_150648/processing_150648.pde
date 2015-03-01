
// PIE CHART ON ENDANGARED SPECIES INFORMATION
void setup() //// EXECUTED AT INITIALIZATION

{
  size(800, 400); //SIZE OF SCREEN IN PIXELS
  noStroke(); // NO DRAW LINES
  noLoop();  // Run once and stop
  


}

void draw() // EXECUTED ALL THE TIME TO REFRESH WINDOW

{
  background(255); // SETS BACKGROUND COLOR WHITE
  pieChart(300, angles); // SETS SIZE OF PIE CHART
  
   
}

int[] angles = // SETS ANGLES SIZES
{ 220, 61, 79 };


color[] Colors = // SETS COLOR FOR PIE CHART
{
  color(4, 153, 0), color (4, 102, 153), color(220, 33, 20),

}
;




void pieChart(float diameter, int[] data) // CREATES PIE CHART
{
  float lastAngle = 0;// SET ANGLE TO 0
  
  //STANDARD ARRAY LOOP
  for (int i = 0; i < data.length; i++)
  {
    fill(Colors [i]); // SETS COLOR BASED ON COLOR []
    
    // USES ARC() FUNCTION TO CREATE PIE CHART FROM ARRAY
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }

  //LEGEND SETS POSITION AND COLOR
  textSize(24); // SET FONT SIZE
  text("Verterbrates ", 10, 30); // SET POSITION AND WORD
  fill(0, 102, 153); // SET COLOR
  text("Inverterbrates", 10, 60); // SET POSITION AND WORD
  fill(4, 153, 0); //SET COLOR
  text("Plants", 10, 90); // SET POSITION AND WORD
  fill( 102, 153, 51); //SET COLOR
}





