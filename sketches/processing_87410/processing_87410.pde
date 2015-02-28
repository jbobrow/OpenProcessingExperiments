
//remix of devon scott-turkin's spiral

float radius = 0.0;
float timer = 0.0;
float thickness = 5.0;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 
void setup() {
    size(800, 800);
     
    // Change the colormode to HSB so we can cycle it easier.
    // Set Hue to 0->360, set Saturation, Brightness and Alpha to 0->100.
    colorMode(HSB, 360, 100, 100, 100);
     
    // Run at 60fps.
    frameRate(60);
     
    background(250 , 0 , 250);
     
    center = width / 2.0;
    prevX = center;
    prevY = center;
}
  
void draw() {
    // When the timer has reached 18 seconds reset.
    if (timer >= 30.0){
        timer = 0.0;
        radius = 0.0;
        prevX = center;
        prevY = center;   
        // Increase stroke thickness.
        thickness++;
    }
     
    // Set the x and y position to equation of a circle.
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
    // Draw line from previous position to current using thickness.
    // Use the timer to cycle the color from 0->360.
    // Alpha of 25% creates the "dotted" effect on the lines from the overlap of prev and x.
    strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 40);
    line(prevX, prevY, x, y);
     
    // Set the previous x and y to the current for next time. 
    prevX = x;
    prevY = y;
         
    // Increment timer and radius of the circle.
    // 0.0167 should be 1 / frameRate. We are running at 60fps so this makes the timer scaled to seconds.
    // The frameRate variable is the ACTUAL frameRate so it may not always be 60, especially if the code is slow.  
    timer += 0.167; // (1 / frameRate);
    radius += 2.5;
 
}




