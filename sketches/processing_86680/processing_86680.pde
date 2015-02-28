
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;

float[] prevX = new float[10];
float[] prevY = new float[10];
float[] offsetX = { 5, -10, 30, 40, 50, 10, 10, 10, 30, 100 };
float[] offsetY = { -30, 100, 200, -200, 30, -20, 3, 1, 200 };
 
void setup() {
    size(500, 500);
        
    // Change the colormode to HSB so we can cycle it easier.
    // Set Hue to 0->360, set Saturation, Brightness and Alpha to 0->100.
    colorMode(HSB, 360, 100, 100, 100);
     
    // Run at 60fps.
    frameRate(60);
     
    background(0);
     
    center = width / 2.0;
    
    for (int i = 0; i < 10; i++) {
      prevX[i] = center + offsetX[i];
      prevY[i] = center + offsetY[i];
    }
}
  
void draw() {
    // When the timer has reached 18 seconds reset.
    if (timer >= 18.0){
        timer = 0.0;
        radius = 0.0;
        
        for (int i = 0; i < 10; i++) {
            prevX[i] = center + offsetX[i];
            prevY[i] = center + offsetY[i];
        }

         
        // Increase stroke thickness.
        thickness++;
    }
     
    for (int i = 0; i < 10; i++) {
      spiral(center + offsetX[i], center + offsetY[i], i);
    }
    
    radius += 0.2;

    // Increment timer and radius of the circle.
    // 0.0167 should be 1 / frameRate. We are running at 60fps so this makes the timer scaled to seconds.
    // The frameRate variable is the ACTUAL frameRate so it may not always be 60, especially if the code is slow.  
    timer += 0.0167; // (1 / frameRate);

 
}

void spiral(float centerX, float centerY, int i) {
      // Set the x and y position to equation of a circle.
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += centerX;
    y += centerY;
     
    // Draw line from previous position to current using thickness.
    // Use the timer to cycle the color from 0->360.
    // Alpha of 25% creates the "dotted" effect on the lines from the overlap of prev and x.
    strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 40);
    line(prevX[i], prevY[i], x, y);
        // Set the previous x and y to the current for next time. 
    prevX[i] = x;
    prevY[i] = y;         
}
