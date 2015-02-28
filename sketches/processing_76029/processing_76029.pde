


int numSuperman = 30;
Superman [] Supermans = new Superman[numSuperman];

void setup() {
 
  size(500, 500);
  for(int i = 0; i < Supermans.length; i++)
  {
     Supermans[i] = new Superman(); 
  }
  
}

void draw() {
  
  float interp = sin(frameCount / 60.); // frameCount is used to "drive" the animation
 
  for(int i = 0; i < Supermans.length; i++)
  {
     Supermans[i].display(interp); 
  }
  
}


class Superman {
   
  float xpos, ypos; // the base position
  float xoffset, yoffset;  // some vaue to add or subtact from the base position
  PImage im;
  
  Superman () {
    
      im = loadImage("Superman.png");
      xpos = random(width);
      ypos = random(height);
      xoffset = random(width);
      yoffset = random(height);
    
  }
  
  void display(float interp) // interp is some number between -1.0 and 1.0
  {
      float xtemp, ytemp;
    
      xtemp = xpos + interp * xoffset;  // we add or subtact some offset from the base position
      if(xtemp > width) xtemp = width - (xtemp - width); // if too high, bounce back
      if(xtemp < 0) xtemp = xtemp * -1;  // if too low, bouce back
      
      ytemp = ypos + interp * yoffset;  // we add or subtact some offset from the base position
      if(ytemp > height) ytemp = height - (ytemp - height); // if too high, bounce back
      if(ytemp < 0) ytemp = ytemp * -1;  // if too low, bouce back
      
      image(im, xtemp, ytemp);
  }
  
}


