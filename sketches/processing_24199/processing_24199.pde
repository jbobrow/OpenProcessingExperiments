
//import processing.pdf.*;

int patternSeperationX = 100;
int patternSeperationY = 100;
  

  PFont myFont;


void setup()
{

      
  size (400, 800);
  //textMode(SHAPE);
  
  //beginRecord(PDF, "fileame.pdf"); 
  
  background(255);
   
   color from = color(0, 192, 238);
color to = color(255, 255, 255);
    
    float sharks=0;
    int volcano=0;
    while(volcano<(height+1))
    {
      strokeWeight(2);
      stroke(lerpColor(from, to, sharks));
     sharks=sharks+(1.001/height) ;
      line(0,volcano,width,volcano);
      volcano=volcano+1;
      }
  
  
      noLoop();


smooth();

  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
      
      
  }
  //endRecord();
}
  


  



  
  
  void draw()
  { 
   //beginRecord(PDF, "filename.pdf"); 
      
  }
  void yourFunction(){
   //textMode(SHAPE);    
    
      
    
   
          
      
      myFont = createFont("Untitled-Regular.ttf", 100);
  textFont(myFont);
  fill(0,random(120,130),random(180,190),random(0,256));
text("FYD", 10, 10);


  
  
  noLoop();
  
      
    
    }

