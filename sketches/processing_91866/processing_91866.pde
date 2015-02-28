

void setup(){
  size(500,300);
  background(0);
  strokeWeight(0.01);
  smooth();
  
   color c = color(50,50,0);
   DrawCocoon(15, 50, c, 0.0001, false);
   
   c = color(200,200,200);
   DrawCocoon(40, 100, c, 0.00003, false);
   

}

void DrawCocoon(float inputRad, float inputLen, color baseColor, float angleStep, boolean monoColor)
{
  color c;
  float radius = 0;
  int centX = width/4;
  int centY = height/2;


  
  float x, y;
  float lastx = -999;
  float lasty = -999;
  
  float radiusNoise = random(10);
  float ang = 0;
  int initialX = 0;
  
  
  for(float ang2 = 0; ang2<=PI; ang2 +=angleStep){
    
    if(monoColor == false){
      int newred = (int)(red(baseColor)+random(1)*150);
      int newgreen = (int)(green(baseColor)+ random(1)*150);
      int newblue = (int)(blue(baseColor)+random(1)*70);
  
      c = color(newred, newgreen, newblue);
    }
    else{
     c= baseColor; 
    }
    
    
  stroke(c, 100);
    
   ang += 10;
   radius = sin(ang2)*inputRad;
   radiusNoise +=0.4;
    float thisRadius = radius + (noise(radiusNoise)*20)-10;
   float rad = radians(ang);
   x = centX + cos(ang2) * inputLen + centX + (thisRadius * cos(rad));
   y = centY + (thisRadius * 1.5 * sin(rad));
  
   if(lastx > -999){
    line(x, y, lastx, lasty); 
   }
   lastx = x;
   lasty = y;
   point (x,y); 

  } 
  
}



