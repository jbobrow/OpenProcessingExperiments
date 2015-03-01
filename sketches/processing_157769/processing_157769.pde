
 color a, b, c, d;
// Starting angle
float theta = 0.0;

 
void setup() {
  size(800,600);
  smooth();
   frameRate(300);
}
 
void draw() {
  background(200);
   line(pmouseX, pmouseY, mouseX, mouseY);
   color (0);
   
  // Increment theta (try different values for " angular velocity " here)
  theta += 0.02;
  noStroke();
  fill(10);
  float x = theta;
 
   
   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 100; i++) {
    // Calculate y value based off of sine function
    float y = sin(x)*height/3;
    // Draw an ellipse
    ellipse(i*8,y + height/2,5,5);
    // Move along x-axis
    x += 200;
  }
   // Increment theta (try different values for " angular velocity " here)
  theta += 0.00;
  noStroke();
  fill(0);
  float y = theta;
   
   // A for loop is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  for (int i = 0; i <= 100; i++)
  for (int e = 0; e <= 100; e++)
   {
    // Calculate y value based off of sine function
 // Draw an ellipse

 

  float h = random (0, 360);
 fill(h, 50, 20);
  ellipse(10, 300, 10, 10);
 
  fill(0);
  ellipse(60, 300, 20, 20);

 
  fill(h, 230, 150);
  ellipse(110, 300, 10, 10);
   
  fill(h, 255, 220);
  ellipse(160, 300, 35, 35);

 
  fill(h, 125, 80);
  ellipse(210, 300, 10, 10);
   
  fill(160, h, 220);
  ellipse(260, 300, 35, 35);

 
  fill(0);
  ellipse(310, 300, 10, 10);
   
  fill(h, 205, 101);
  ellipse(360, 300, 25, 25);

 
  fill(h, h, 220);
  ellipse(410, 300, 10, 10);
  
   
  fill(0);
  ellipse(460, 300, 40, 40);

 
  fill(h, 110, h);
  ellipse(510, 300, 15, 15);
  
    fill(h, 156, 220);
  ellipse(560, 300, 10, 10);
  
   
  fill(h, 70, 150);
  ellipse(610, 300, 42, 42);

 
  fill(0);
  ellipse(660, 300, 8, 8);
  
    fill(0);
  ellipse(710, 300, 10, 10);
  
   
  fill(h, 70, 150);
  ellipse(760, 300, 25, 25);

 
  fill(255, 189, h);
  ellipse(810, 300, 10, 10);

  }
}

