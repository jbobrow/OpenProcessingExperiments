
color[] rainbow = {#FEFECD, #CC5C54, #F69162, #85A562, #7AB5DB};
int n = 300;
int x;
float y = .05;
float noiseY;


void setup()
  {
    size (800,800);
    background (rainbow[0]);
    stroke (100);
    frameRate(1);
   
        
}


void draw()
  {
     for (int i = 1; i < n; i++) 
        {
         y += .02;
         x = i * (width/n);
         fill(rainbow[int(random(1,5))]);
         noiseY = noise(y)* height;
         ellipse (random(width), height, x, noiseY);
        }
    
   
    
  }
