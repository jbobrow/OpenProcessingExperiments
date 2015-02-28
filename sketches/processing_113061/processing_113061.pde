
                                             
float radius = 0.0;
float timer = 0;
int thickness = 2;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
float a = 0.0;
float s = 0.0;


int mapper = 0;
 
void setup() {
    size(500, 500);
     
    
  colorMode(HSB, 360, 100, 100, 100);
     
     
    
    frameRate(80);
     
    background(0);
     
    center = width / 2.0;
    prevX = center;
    prevY = center;
}
  
void draw() {

     
    float x = 0;
    float y = 0;
    float spiralOffset = 50.0;
    
    if (mapper == 0)
    {
      
  a = a + 0.2;
  s = cos(a)*2;
  
  translate(random(500), random(500));
  scale(s); 
  
  ellipse(0, 0, 1, 1); 
      
    }
      
      
    else if(mapper == 1)
    {
         x = radius * tan(timer * spiralOffset);
         y = radius * cos(timer * spiralOffset);
    }
    else if(mapper == 2)
    {
        x = radius * sin(timer * spiralOffset);
        y = radius * cos(timer * spiralOffset);
      
    }
    else if(mapper == 3)
    {
        x = radius * sin(timer * spiralOffset);
        y = radius * tan(timer * spiralOffset);
    }
    
    else if (mapper == 4)
    {
        x = radius * cos(timer * spiralOffset);
        y = radius * tan(timer * spiralOffset);
    }

    else if (mapper == 5)
    {
       x = radius * tan(timer * spiralOffset);
       y = radius * sin(timer * spiralOffset); 
    }
    
    x += center;
    y += center;
    
 
     
  
      strokeWeight(thickness); 
    float timerScalar = 20.0;   
    stroke(timer * timerScalar, 100, 100, 100);
    line(x, y, x, y); 
   
       
    if (timer >= 18.0){  //timer reset
        timer = 0.0;
        radius = 0.0;
        prevX = x;
        prevY = y;
        if(++mapper > 5)
        {
            mapper = 0;
        }
       background(0);
      
       
         
     
    }
  
    timer += 0.0167; // (1 / frameRate);
    radius += 0.2;
 
}

void mouseDragged(){
  
 
  ellipse(mouseX, mouseY, 0.1, 0.1);
  

  
}



