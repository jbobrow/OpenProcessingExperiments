
import processing.pdf.*;

// This code displays the visualisation of data for green tea. I wanted to compare the Energy drink with a beverage that is associated with health benefits (unlike Energy drinks, etc.)
void setup() {
  size(800, 400);
  background(201,249,116);
  noLoop();
  beginRecord(PDF, "greentea.pdf"); 
  
  
  

//Caffeine content in Green Tea = ca. 25 mg average (dark green coloured)
  for (int i = 0; i < 25; i++){
  strokeWeight (i/5);
  stroke (9, 115, 19+ random(50), 200);
  line (400, 200, random (800), random (400)); 
 }


//Calorie content in Green Tea = ca. 2 kcal average (brown coloured)
  for (int i = 0; i < 2; i++){
  strokeWeight (5);
  stroke (138, 106, 50+ random(50), 200);
  line (400, 200, random (800), random (400)); 
 }


// Sugar content in Green tea = ca. 0 g average (yellow coloured)
  for (int i = 0; i < 0; i++){
  strokeWeight (10);
  stroke (255+ random(50), 253, 45, 150);
  line (400, 200, random (800), random (400)); 
 }
  }
  
 void draw() {
  
 
 endRecord();

  }


