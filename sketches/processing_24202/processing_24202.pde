
//import processing.pdf.*;

PFont myFont;
PFont myFont2;



void setup()
{
  size (400, 800);
//beginRecord(PDF, "filename.pdf");

  //textMode(SHAPE);
  

  background(255);

  }
  
  void draw()
  {
    color to = color(0, 192, 238);
color from = color(255, 255, 255);
    
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
      
    
      
      myFont = createFont("Untitled-Regular.ttf", (width*0.7));
 textFont(myFont);
  fill(255,255,255,230);
  text("FYD", 4, 500);
  
  
  textFont(myFont, 1000);
  fill(0,150,200,100);
  text("D", 10, 600);
  text("F", -10, 1000);
  
  
     textFont(myFont);
  fill(255,255,255,180);
  text("  YD", 4, 500);
  
  
     
    }

