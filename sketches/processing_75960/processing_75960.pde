


int numEyes = 50;
Eye [] eyes = new Eye[numEyes];
int numApples = 10;
Apple [] apples = new Apple[numEyes];

void setup() {
  size(500,500);
  background(205,239,202);
  for(int i = 0; i < eyes.length; i++)
  {
     eyes[i] = new Eye(); 
  }
  
  for(int i = 0; i < apples.length; i++)
  {
     apples[i] = new Apple(); 
  }
  
  
  
}

void draw() {
  
  float interp = sin(frameCount / 40.); // frameCount is used to "drive" the animation
 
  for(int i = 0; i < eyes.length; i++)
  {
     eyes[i].display(interp); 
  }
  
    for(int i = 0; i < apples.length; i++)
  {
     apples[i].display(interp); 
  }
  
  
  
  
}


class Eye {
   
  float xpos, ypos; // the base position
  float xoffset, yoffset;  // some vaue to add or subtact from the base position
  PImage im;
  
  Eye () {
    
      im = loadImage("eye.png");
      xpos = random(width);
      ypos = height/2;
      xoffset = random(width)/50;
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



class Apple {
   
  float xpos2, ypos2; // the base position
  float xoffset2, yoffset2;  // some vaue to add or subtact from the base position
  PImage im2;
  
  Apple () {
    
      im2 = loadImage("apple.png");
      xpos2 = random(width);
      ypos2 = height;
      xoffset2 = random(width);
      yoffset2 = random(height);
    
  }
  
  void display(float interp) // interp is some number between -1.0 and 1.0
  {
      float xtemp2, ytemp2;
    
      xtemp2 = xpos2 + interp * xoffset2/20;  // we add or subtact some offset from the base position
      if(xtemp2 > width) xtemp2 = width - (xtemp2 - width); // if too high, bounce back
      if(xtemp2 < 0) xtemp2 = xtemp2 * -1;  // if too low, bouce back
      
      ytemp2 = ypos2 + interp * yoffset2/3;  // we add or subtact some offset from the base position
      if(ytemp2 > height) ytemp2 = height - (ytemp2 - height); // if too high, bounce back
      if(ytemp2 < 0) ytemp2 = ytemp2 * -1;  // if too low, bouce back
      
      image(im2, xtemp2, ytemp2);
  }
  
}

