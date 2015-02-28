
//import processing.pdf.*;

PFont myFont;
PFont myFont2;
PFont myFont3;

void setup()
{
  size (400, 800);
//beginRecord(PDF, "filename.pdf");

  //textMode(SHAPE);
  

  background(255);

  }
  
  void draw()
  {
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
      
      myFont3 = createFont("Untitled-Regular.ttf", 125);
  textFont(myFont3);
  fill(256,256,256,random(33,200));
text("C",random(width),random(height));
text("F",random(width),random(height));
text("F",random(width),random(height));
text("Y",random(width),random(height));
text("Y",random(width),random(height));
text("D",random(width),random(height));
text("D",random(width),random(height));
fill(0,190,250, random(20,120));      
text("F",random(width),random(height));
text("F",random(width),random(height));
text("Y",random(width),random(height));
text("Y",random(width),random(height));
text("D",random(width),random(height));
text("D",random(width),random(height));      
      
      myFont = createFont("Untitled-Regular.ttf", (width*0.7));
  textFont(myFont);
  fill(3,128,185,160);
  text("FYD", 4, 500);

myFont2 = createFont("Untitled-Regular.ttf", 705);
  textFont(myFont2);
  fill(0,150,200,100);
  text("CD", 10, 600);
  
  
  
  
      
       //endRecord();
    }

