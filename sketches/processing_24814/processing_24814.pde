



  

int patternSeperationX = 50;
int patternSeperationY = 50;
 
  
  
void setup(){
  size(200,400);
  smooth();
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
  background(0,255,0);
    
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
{}
  
  
void yourFunction(){


scale(0.5);
stroke(255);
beginShape();
vertex(25,0);
vertex(50,0);
vertex(40,10);
vertex(35,10);
vertex(25,20);
vertex(0,20);
vertex(10,10);
vertex(15,10);
endShape(CLOSE);

ellipse(50,50,20,20);

line(50,0,50,50);



}
  
void keyPressed()
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
        
                
