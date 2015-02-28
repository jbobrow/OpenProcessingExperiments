
void setup() {
 size(640, 480);
 smooth();
 strokeWeight(2);
 background(200);
 ellipseMode(RADIUS);
}

void draw() {
 // Head
 fill(0); // Set fill to black
 ellipse(276, 155, 45, 45); // Head
 // Mouth
 stroke(102); // Set stroke to gray
 line(266, 198, 266, 164); // Left
 line(276, 200, 276, 160); // Middle
 line(286, 198, 286, 164); // Right  
 line(266, 178, 286, 178); // Horizontal, T
 line(266, 182, 286, 182); // Horizontal, C
 line(266, 186, 286, 186); // Horizontal, L

 // neck
 fill(160); // Set fill to gray
 ellipse(264, 340, 15, 15);
 ellipse(275, 309, 15, 15);
 ellipse(280, 276, 15, 15);
 ellipse(265, 247, 15, 15);
 ellipse(276, 217, 15, 15);

 // Body
 noStroke(); // Disable stroke
 fill(102); // Set fill to gray
 fill(0); // Set fill to black
 rect(219, 340, 90, 120); // Main body
 fill(102); // Set fill to gray
 rect(219, 440, 90, 6); // Gray stripe

 if (mousePressed) {
   fill(0);
   // Flares
   fill(64);   
   quad(180, 140, 140, 160, 190, 170, 215, 150); // LL
   quad(218, 85, 170, 80, 200, 110, 230, 110); // LL
   quad(276, 90, 266, 70, 280, 30, 290, 75); // Center
   quad(350, 80, 410, 90, 350, 115, 325, 110); // UR
   quad(380, 140, 420, 160, 370, 170, 340, 150); //LR
 }
 else {
   // Eyes
   fill(255);
   ellipse(290, 150, 14, 14); // Large eye Right
   fill(0); // Set fill to black
   ellipse(290, 150, 3, 3); // Pupil Right
   fill(255); // Set fill to white
   ellipse(262, 150, 14, 14); // Large eye left
   fill(0); // Set fill to black
   ellipse(262, 150, 3, 3); // Pupil left  
   fill(240);
   // Flares
   quad(180, 140, 140, 160, 190, 170, 215, 150); // LL
   quad(218, 85, 170, 80, 200, 110, 230, 110); // LL
   quad(276, 90, 266, 70, 280, 30, 290, 75); // Center
   quad(350, 80, 410, 90, 350, 115, 325, 110);  // UR
   quad(380, 140, 420, 160, 370, 170, 340, 150); // LR
 }  
}



