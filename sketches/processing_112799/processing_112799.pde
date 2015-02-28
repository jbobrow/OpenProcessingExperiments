
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 
void setup() 
{
    size(500, 500);
     
    
  colorMode(HSB, 360, 100, 100, 100);
     
    // Run at 60fps.
    frameRate(60);
     
    background(0);
     
    center = width / 2.0;
    prevX = center;
    prevY = center;
}

void draw() 
{
    float spiralOffset = 10.0;
    float x = radius * tan(timer * spiralOffset); //tan, sin, cos
    //flipping this value changes hori/vert axis
    float y = radius * cos(timer * spiralOffset);
    x += center;
    y += center;
     
  
      strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 100);
    line(x, y, x, y); //prevX and prevY for line, -x and -y
    //for side lines
   
   
       
    if (timer >= 15.0){  //timer reset
        timer = 0.0;
        radius = 0.0;
        prevX = x;
        prevY = y;
       
      
       
         
        // Increase stroke thickness.
        thickness++;
    } 
  
    timer += 0.0167; // (1 / frameRate);
    radius += 0.2;
 
}
