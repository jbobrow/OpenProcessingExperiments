
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
 
      for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
 
}


void draw()
{
  
}


void yourFunction(){
 
  line(0,0,50,0);
  line(50,0,50,75);
  line(50,75,100,75);
  line(100,75,100,100);

}
 
void keyPressed()
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name"); 
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

