
int patternSeperationX = 100;
int patternSeperationY = 100;
   
   
void setup(){
  size(400,800);
 
 
 
  smooth();
 noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
    
 
   background(0);
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
     

   
 
  fill(150,129,211,30);
    
  ellipse(50,50,70,10);
  ellipse(50,50,60,20);
  ellipse(50,50,50,30);
  ellipse(50,50,40,40);
  ellipse(50,50,30,50);
  ellipse(50,50,20,60);
  ellipse(50,50,10,70);
 
  ellipse(0,0,5,20); //<--smallest diamonds
  ellipse(0,0,10,15);
  ellipse(0,0,15,10);
  ellipse(0,0,20,5);
   
    ellipse(0,100,5,20);
  ellipse(0,100,10,15);
  ellipse(0,100,15,10);
  ellipse(0,100,20,5);
   
    ellipse(100,100,5,20);
  ellipse(100,100,10,15);
  ellipse(100,100,15,10);
  ellipse(100,100,20,5);
   
  ellipse(100,0,5,20);
  ellipse(100,0,10,15);
  ellipse(100,0,15,10);
  ellipse(100,0,20,5); //<--smallest diamonds end
   
 
  ellipse(50,0,120,120);
  ellipse(50,0,80,80);
   
  ellipse(0,100,120,120);
  ellipse(0,100,80,80);
   
  ellipse(100,50,120,120);
  ellipse(100,50,80,80);
   
  ellipse(100,0,120,120);
  ellipse(100,0,80,80);
   
    ellipse(50,100,120,120);
  ellipse(50,100,80,80);
   
    ellipse(0,50,120,120);
  ellipse(0,50,80,80);
   
    ellipse(100,100,120,120);
  ellipse(100,100,80,80);
   
    ellipse(0,0,120,120);
  ellipse(0,0,80,80);
   
  ellipse(0,100,50,50);
  ellipse(100,100,50,50);
 
 
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
                
