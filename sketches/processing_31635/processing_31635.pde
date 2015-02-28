
int patternSeperationX =100;
int patternSeperationY =100;

void setup() {
  size(300,600);
  smooth();
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  noStroke();
  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
  }
}

void draw()
{
  //This is here so the program keeps running and the screengrab will work
}

void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  //big one? 
  fill(240,240,240);

  arc(25,50,50,50,0,PI);
  arc(75,50,50,50,PI,2*PI);
  
  //small one?
  fill(193,164,165);
  arc(50,75,50,50,radians(270),radians(450));
  arc(50,25,50,50,radians(90),radians(270));
  
  //here is rect.
  
  int w=40;
  int h=40;
  noStroke();
  for(int i=0; i<width; i+=40) {
  for(int j=0; j<height; j+=40) {
  fill(random(255),random(100));
  rect(i,j,w,h);
    }
  }
}
void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

                
                                                                
