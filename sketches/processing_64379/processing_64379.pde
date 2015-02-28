
int counter=0;
int x = random(600);
int y = random(600);
int radius = 35;
int thetaUp = true;
    
void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

  
  if ((counter % 10) == 0) {  
      fill(100,random(200,255),100,50);
  
      int theta = counter + random(7); //random(1,360);
      int nextx = radius * cos((theta/360) * TWO_PI) + x;
      int nexty = radius * sin((theta/360) * TWO_PI) + y;
  
      if ((nextx <= width) && 
          (nextx >= 0) && 
          (nexty <= width) && 
          (nexty >= 0)) {
          line(x, y, nextx,nexty);
          x = nextx;
          y = nexty;
          ellipse(x, y, radius, radius);
      }
  }
  
  if (counter > 300)
      thetaUp = false;
      
  if (counter < 0)
      thetaUp = true;
  
  if (thetaUp)
      counter++;  
  else
      counter--;
  
}
