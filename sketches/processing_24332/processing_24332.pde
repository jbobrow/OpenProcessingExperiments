
int patternSeperationX = 100;
int patternSeperationY = 100;
   
   
void setup(){
  size(400,800);
 
  //the white box simply shows you the space your pattern gets drawn in
 
  smooth();
 noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
    
background(0);
fill(252,160,218,25);
    
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
  //This is here so the program keeps running and the screengrab will work
 
}
   
   
void yourFunction(){
     
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
   
   
  //fill(241,201,238,30);
  strokeWeight(1);
  //stroke(0,random(0,10));
  //stroke(236,183,232);
    
    ellipse(0,50,100,100); //<--outer circles
    ellipse(0,50,90,100);
     
    ellipse(100,50,100,100);
    ellipse(100,50,90,100); //<--outer circles end
     
    rect(-5,45,10,10); //<--inner pattern
    ellipse(0,50,20,20);
    rect(-15,35,30,30);
    ellipse(0,50,40,40);
    rect(-25,25,50,50);
    ellipse(0,50,70,70);
     
        rect(95,45,10,10);
    ellipse(100,50,20,20);
    rect(85,35,30,30);
    ellipse(100,50,40,40);
    rect(75,25,50,50);
    ellipse(100,50,70,70); //<--inner pattern
     
    ellipse(50,50,10,10); //<--smallest circles
    ellipse(50,50,15,15);
    ellipse(50,50,20,20);
    ellipse(50,50,35,35);
 
    ellipse(0,0,100,100);
    ellipse(100,100,100,100);
     
    ellipse(50,0,70,70);
    ellipse(50,100,70,70);
    ellipse(50,100,50,50);
    ellipse(50,100,50,50);
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
