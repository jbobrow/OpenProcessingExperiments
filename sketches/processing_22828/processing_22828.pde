

int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  smooth();
  background(255, 255, 255);
  
  
  fill(255,200);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
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

    
  fill(102,200);
  smooth();
strokeWeight(6.0);
strokeCap(ROUND);
line(10, 20, 70, 20);
strokeCap(SQUARE);
line(20, 50, 80, 50);
strokeCap(PROJECT);
line(20, 70, 80, 70);
rectMode(CENTER);
rect(5, 5, 20, 20);
rectMode(CORNER);
rect(5, 5, 20, 20);
fill(84,187,237,180);
ellipse(16, 16, 25, 25);



   
    

   
    
   
    
     
       
    

 
  

 


  
  
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

