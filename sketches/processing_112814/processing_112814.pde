
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;

int mapper = 0;
 
void setup() {
    size(500, 500);
     
    
  colorMode(HSB, 360, 100, 100, 100);
     
    // Run at 60fps.
    frameRate(60);
     
    background(0);
     
    center = width / 2.0;
    prevX = center;
    prevY = center;
}
  
void draw() {

     
    float x = 0;
    float y = 0;
    float spiralOffset = 10.0;
    if(mapper == 0)
    {
         x = radius * tan(timer * spiralOffset);
         y = radius * cos(timer * spiralOffset);
    }
    else if(mapper == 1)
    {
        x = radius * cos(timer * spiralOffset);
        y = radius * sin(timer * spiralOffset);
    }
    else if(mapper == 2)
    {
        x = radius * sin(timer * spiralOffset);
        y = radius * tan(timer * spiralOffset);
    }
    x += center;
    y += center;
     
  
      strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 100);
    line(x, y, x, y); //prevX and prevY for line, -x and -y
    //for side lines
   
   
       
    if (timer == 15.0){  //timer reset
        timer = 0.0;
        radius = 0.0;
        prevX = x;
        prevY = y;
        mapper++;
        if(mapper > 2)
        {
            mapper = 0;
        }
       background(0);
      
       
         
        // Increase stroke thickness.
        thickness++;
    }
  
    timer += 0.0167; // (1 / frameRate);
    radius += 0.2;
 
}
