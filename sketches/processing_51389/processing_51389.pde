
void setup (){
  size(600, 600); 
  background( 250, 250, 210);
  
// Background thick lines- NEED TO FIGURE OUT HOW TO GET LINES THROUGH CIRCLE 
  stroke(95, 158, 160);
  strokeWeight(100);
  line(100, 0, 600, 400);
  
  stroke(255, 255, 0);
  strokeWeight(100);  
  line(575, 0, 0, 550); 

// Largest dark green circle
  fill( 250, 250, 210);
  stroke( 90, 100, 80);
  strokeWeight(17); 
  ellipse(height/2, width/2, 500, 500);
  
// Interior cirlces
  strokeWeight(1); 
  
  stroke(160, 82, 45);
  fill(160, 82, 45);
  ellipse(200, 170, 140, 140);
  
  stroke(32, 178, 170);
  fill(32, 178, 170);
  ellipse(200, 220, 80, 80);
  
  stroke(178, 34, 34);
  fill(178, 34, 34); 
  ellipse(300, 200, 120, 120);
  
  stroke(10, 100, 30, 200);
  fill(10, 100, 30, 200); 
  ellipse( 400, 280, 140, 140); 
  
  stroke(85, 187, 77, 100); 
  fill(0, 100, 100); 
  ellipse(280, 320, 200, 200); 
  
  stroke(255, 255, 0, 100);
  fill(255, 255, 0, 100);
  ellipse(380, 400, 120, 120);
  
  strokeWeight(5);
  stroke(0, 0, 0); 
  fill(255, 0, 0, 200); 
  ellipse(280, 275, 95, 95); 
  strokeWeight(20); 
  point( 280, 275); 
  
  stroke(0, 0, 0);
  strokeWeight(3); 
  fill(255, 0, 0, 200);
  ellipse(200, 410, 80, 80);
  
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(233, 150, 122, 200);
  ellipse(350, 490, 50, 50); 
  
  strokeWeight(2); 
  stroke(0, 0, 0); 
  fill(255, 0, 0, 200); 
  ellipse(280, 75, 15, 15); 
  
  stroke(105, 105, 105);
  fill(105, 105, 105);
  ellipse(410, 180, 100, 100); 
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  ellipse(350, 200, 40, 40); 
  
  
// Interior lines
  stroke(0, 0, 0);
  strokeWeight(2); 
  
  line( 120, 200, 520, 230); 
  line( 400, 100, 300, 450); 
  line( 105, 340, 520, 360); 
  line(400, 300, 350, 460); 
  
  stroke(.3); 
  line( 130, 150, 520, 400); 
  line(300, 200, 120, 350); 
  
  line(470, 200, 490, 400); 
  line(460, 220, 480, 420); 
  


  
  
  
  
  
} 

