

int numWords = 100;
Word [] words = new Word[numWords];
float gravity=0.1;

void setup() {
  
  size(500, 500);
 background(255);

 }
 
void draw() {
   
   
 textFont(createFont("Helvetica",20));
 fill(255);
 textAlign(CENTER);
 text("What is your", mouseX, mouseY-25);
 textFont(createFont("Helvetica",50));
 text("dream?", mouseX+10, mouseY +25);
    for (int i = 0; i < words.length; i ++ ) { // Whatever the length of that array, update and display all of the objects.
    words[i] = new Word();
    //words[i].gravity();
    //words[i].move();
    //words[i].display();
  }
  // Create the font
  textFont(createFont("Impact", 8));
  
  // mouse to right makes image DARKER
  fill(0, 0, 0, mouseX / (float)width * 30.);
   
  float interp = frameCount / 15.; // frameCount is used to "drive" the animation
 
    for(int i = 0; i < words.length; i++)
    {
       words[i].display(interp);
    }
}
 
void mousePressed()
{
   background(255);

}
 
 
class Word {
    
  float xpos, ypos; // the base position
  float xoffset, yoffset;  // some vaue to add or subtact from the base position
  float interpOffset;
  String mytext;
  float myfontsize;
   
  Word () {
     
      mytext = "dreamer";
      xpos = random(width);
      ypos = random(height);
      xoffset = random(width);
      yoffset = random(height);
      interpOffset = random(PI * 2.);
      myfontsize = 8 + random(50);
     
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


