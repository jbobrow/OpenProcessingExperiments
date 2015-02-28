


int numWords = 100;
Word [] words = new Word[numWords];

void setup() {
 
  size(800, 800);
  for(int i = 0; i < words.length; i++)
  {
     words[i] = new Word(); 
  }
  
  // Create the font
  textFont(createFont("Helvetica", 24));
  
  background(200);

  
}

void draw() {
  
  // mouse to right makes image DARKER
  fill(0, 0, 0, mouseX / (float)width * 20.);
  
  float interp = frameCount / 60.; // frameCount is used to "drive" the animation 

    for(int i = 0; i < words.length; i++)
    {
       words[i].display(interp); 
    } 
}

void mousePressed()
{
   background(200); 
}


class Word {
   
  float xpos, ypos; // the base position
  float xoffset, yoffset;  // some vaue to add or subtact from the base position
  float interpOffset;
  String mytext;
  float myfontsize;
  
  Word () {
    
      mytext = "poke";
      xpos = random(width);
      ypos = random(height);
      xoffset = random(width);
      yoffset = random(height);
      interpOffset = random(PI * 2.);
      myfontsize = 8 + random(32);
    
  }
  
  void display(float _interp) // interp is some number between -1.0 and 1.0
  {
      float xtemp, ytemp, interp;
      
      interp = sin(_interp + interpOffset);
    
      xtemp = xpos + interp * xoffset;  // we add or subtact some offset from the base position
      if(xtemp > width) xtemp = width - (xtemp - width); // if too high, bounce back
      if(xtemp < 0) xtemp = xtemp * -1;  // if too low, bouce back
      
      ytemp = ypos + interp * yoffset;  // we add or subtact some offset from the base position
      if(ytemp > height) ytemp = height - (ytemp - height); // if too high, bounce back
      if(ytemp < 0) ytemp = ytemp * -1;  // if too low, bouce back
      
      textSize(myfontsize);
      text(mytext, xtemp, ytemp);
  }
  
}


