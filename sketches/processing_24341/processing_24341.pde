

 
int patternSeperationX = 80;
int patternSeperationY = 50;

 
 
void setup(){
   smooth();
  size(400,600);
  

   
fill(45,45,45);
  noStroke();
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
     

   for(float z=19; z<70; z+=15){
    noFill();
    arc(39, 29, z, z, 0, PI/2);
      stroke(255,90);
    arc(39, 50, z, z, PI, TWO_PI-PI/2);
    stroke(#993366);
    arc(39, 0, z, z, PI/2, PI);
      stroke(205,140,149);
    arc(39, 25, z, z, TWO_PI-PI/2, TWO_PI);
    //stroke(#FF3366);
    stroke(255);
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

