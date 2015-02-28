


int numBlimps = 5;
Blimp [] blimps = new Blimp[numBlimps];

void setup() {
 
  size(700, 500);
  background (255,240,200);
  for(int i = 0; i < blimps.length; i++)
  {
     blimps[i] = new Blimp(); 
  }
  
}

void draw() {
  
  float interp = sin(frameCount / 30.); // frameCount is used to "drive" the animation
 
  for(int i = 0; i < blimps.length; i++)
  {
     blimps[i].display(interp); 
  }
  
}


class Blimp {
   
  float xpos, ypos; 
  float xoffset, yoffset;  
  PImage im;
  
  Blimp () {
    
      im = loadImage("blimp.png");
      xpos = random(width);
      ypos = random(height);
      xoffset = random(width);
      yoffset = random(height);
    
  }
  
  void display(float interp) // interp is some number between -1.0 and 1.0
  {
      float xtemp, ytemp;
    
      xtemp = xpos - interp * xoffset;  // we add or subtact some offset from the base position
      if(xtemp > width) xtemp = width + (xtemp / width); // if too high, bounce back
      if(xtemp < 0) xtemp = xtemp * +1;  // if too low, bouce back
      
      ytemp = ypos + interp * yoffset;  // we add or subtact some offset from the base position
      if(xtemp > height) xtemp = height - (xtemp * height); // if too high, bounce back
      if(ytemp < 0) ytemp = ytemp * -2;  // if too low, bouce back
      
      image(im, xtemp, ytemp);
  }
  
}

