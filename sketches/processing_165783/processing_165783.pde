
import processing.pdf.*;

// This code displays the visualisation of data for the Energy drink.
void setup() {
  size(800, 400);
  background(0);
  noLoop();
  beginRecord(PDF, "energydrinkfinal.pdf"); 
  
  
  

//Caffeine content in Energy drink = ca. 132 mg average (blue coloured)
  for (int i = 0; i < 132; i++){
  strokeWeight (i/15);
  stroke (67, 0, 255+ random(50), 150);
  line (400, 200, random (800), random (400)); 
 }


//Calorie content in Energy drink = ca. 115 kcal average (purple coloured)
  for (int i = 0; i < 115; i++){
  strokeWeight (i/10);
  stroke (150, 0, 220+ random(50), 150);
  line (400, 200, random (800), random (400)); 
 }


// Sugar content in Energy drink = ca. 27 g average (yellow coloured)
  for (int i = 0; i < 27; i++){
  strokeWeight (5);
  stroke (255+ random(50), 253, 45, 150);
  line (400, 200, random (800), random (400)); 
 }
  }
  
 void draw() {
  
 
 endRecord();

  }


