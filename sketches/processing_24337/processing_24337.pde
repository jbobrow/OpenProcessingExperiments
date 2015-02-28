



int patternSeperationX = 68;
int patternSeperationY = 80;

 
 
void setup(){
  size(400,600);

  smooth();
 
   
  fill(45,45,45);
  rect(0,0,400,600);

   
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


stroke(255);
strokeWeight(1);
//fill(139,95,101);
quad(20, 31, 86, 20, 69, 63, 30, 76);
stroke(255,110);
quad(48, 41, 96, 31, 79, 73, 40, 86);
stroke(205,140,149);
quad(58, 51, 106, 41, 89, 83, 50, 96);
stroke(#993366);
quad(68, 61, 116, 51, 99, 93, 60, 106);


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

