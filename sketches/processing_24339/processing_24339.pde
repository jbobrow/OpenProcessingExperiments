


int patternSeperationX = 65;
int patternSeperationY = 59;
 
 
void setup(){
 size(400,600);
 
  smooth();
 
  fill(205,140,149);
  noStroke();
  rect(0,0,400,600);
  stroke(45,45,45,190);
  strokeWeight(1);
   
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
   
    ellipse(35, 32, 60, 60);
    stroke(255);
    ellipse(25, 36, 25, 25);
    stroke(45,45,45);
    ellipse(20, 20, 30, 30);
    stroke(#993366);
    ellipse(50, 50, 30, 30);
    stroke(45,45,45);
    ellipse(50, 50, 15, 15);
    stroke(45,45,45,190);
    
    
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


