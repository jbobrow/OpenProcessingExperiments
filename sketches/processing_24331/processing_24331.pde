
int patternSeperationX = 100;
int patternSeperationY = 100;
   
   
void setup(){
  size(400,800);
   
   
noFill();
background(0);
    
 
  smooth();
noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
    
   fill(254,152,39,20);
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
     

   
  //stroke(235,169,137);
 
  //centre of the circles (darkest)
  ellipse(50,50,60,20);
  ellipse(50,50,55,20);
  ellipse(50,50,50,20);
  ellipse(50,50,40,20);
  ellipse(50,50,30,20);
  ellipse(50,50,20,20);
  ellipse(50,50,10,20);
  ellipse(50,50,5,15);
  ellipse(50,50,3,10);
  ellipse(50,50,2,2);
 
  ellipse(35,0,20,40);
  ellipse(35,0,10,30);
    ellipse(35,100,20,40);
  ellipse(35,100,10,30);
   
  ellipse(65,0,20,40);
  ellipse(65,0,15,35);
    ellipse(65,100,20,40);
  ellipse(65,100,15,35);
   
  ellipse(50,0,50,80);
  ellipse(50,0,45,75);
   ellipse(50,100,50,80);
  ellipse(50,100,45,75);
   
  ellipse(0,50,100,100);
  ellipse(0,50,80,100);
  ellipse(0,50,90,100);
   
  ellipse(100,50,100,100);
  ellipse(100,50,80,100);
  ellipse(100,50,90,100);
   
  ellipse(0,50,60,60);
  ellipse(0,50,50,80);
  ellipse(0,50,30,50);
  ellipse(0,50,10,60);
   
  ellipse(100,50,60,60);
  ellipse(100,50,50,80);
  ellipse(100,50,30,50);
  ellipse(100,50,10,60);
   
  ellipse(0,50,60,60);
  ellipse(0,50,50,80);
  ellipse(0,50,30,50);
  ellipse(0,50,10,60);
   
 
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
