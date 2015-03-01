
import processing.pdf.*;

// This code displays the visualisation of data for coffee. I took the data from an average Cappuchino and Latte, to compare it with the data of an Energydrink.
void setup() {
  size(800, 400);
  background(247,224,117);
  noLoop();
  beginRecord(PDF, "coffee.pdf"); 
  
  
  

//Caffeine content in Coffee (Cappuchino or Latte) = ca. 154 mg average (brown coloured)
  for (int i = 0; i < 154; i++){
  strokeWeight (i/15);
  stroke (127, 96, 12+ random(50), 200);
  line (400, 200, random (800), random (400)); 
 }


//Calorie content in Coffee (Cappuchino or Latte) = ca. 260 kcal average (orange coloured)
  for (int i = 0; i < 260; i++){
  strokeWeight (i/30);
  stroke (255, 148, 34+ random(50), 150);
  line (400, 200, random (800), random (400)); 
 }


// Sugar content in Coffee (Cappuchino or Latte) = ca. 16 g average (yellow coloured)
  for (int i = 0; i < 16; i++){
  strokeWeight (5);
  stroke (255+ random(50), 253, 45, 150);
  line (400, 200, random (800), random (400)); 
 }
  }
  
 void draw() {
  
 
 endRecord();

  }


