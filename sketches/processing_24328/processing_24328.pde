
int patternSeperationX = 100;
int patternSeperationY = 100;
   
   
void setup(){
  size(400,800);
 
    
  
 noFill();
  smooth();
noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
    
  background(0);
  fill(13,134,255,20);
 
    
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
     

   
  ellipse(0,0,20,20);
  ellipse(0,0,15,15);
  ellipse(100,100,20,20);
  ellipse(100,100,15,15);
  ellipse(100,0,20,20);
  ellipse(100,0,15,15);
   
  
  //centre of the circles (darkest)
  ellipse(50,50,4,4);
  ellipse(50,50,6,6);
  ellipse(50,50,10,10);
  ellipse(50,50,28,28);
  ellipse(50,50,32,32);
  ellipse(50,50,36,36);
  ellipse(50,50,74,74);
  ellipse(50,50,80,80);
    
  ellipse(0,0,150,150);
  ellipse(100,100,150,150);
  ellipse(0,100,150,150);
  ellipse(100,0,150,150);
 
   
  ellipse(0,0,125,125);
  ellipse(100,100,125,125);
  ellipse(0,100,125,125);
  ellipse(100,0,125,125);
   
  ellipse(50,0,100,100);
  ellipse(50,0,100,100);
  ellipse(50,100,100,100);
  ellipse(50,100,100,100);
  ellipse(100,50,100,100);
  ellipse(100,50,100,100);
  ellipse(0,50,100,100);
  ellipse(0,50,100,100);
 
   
     
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
                
                
