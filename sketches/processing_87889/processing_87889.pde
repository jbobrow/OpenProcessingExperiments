
float radius = 0.0;
float timer = 0.0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 
void setup() {
  
    size ( 800, 800);
fill ( 0,0,0);
  rect ( 0, 0, 800, 800);   
 
    colorMode (HSB, 360, 100, 100, 100);
    frameRate(60);
   center = width / 1.0;
    prevX = center;
    prevY = center;
    
      
}
  
void draw() {
    if (timer >= 28.0){
        timer = 0.0;
        radius = 0.0;
        prevX = center;
        prevY = center;
       
       
    }
     
    float spiralOffset = 32.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
     
 
    strokeWeight(thickness); 
    float timerScalar = 43.0;   
    stroke(timer * timerScalar, 100, 100, 40);
    line(prevX, prevY, x, y);
      
    timer += 0.0167; 
    radius += 1.0;
 
}



