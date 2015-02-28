
import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
  
  noLoop();
 beginRecord(PDF, "fourthdesign.pdf");
  
}
void draw(){
  background(255);
 stroke(0);
 strokeWeight(6);
 line(300,500,0,500);
 line(300,100,0,100);
 line(300,300,0,300);
 strokeWeight(0);
 stroke(3);
 fill(0);
rect(90,240,120,120);
rect(90,40,120,120);
rect(90,440,120,120);
fill(255);
rect(100,250,100,100);
rect(100,50,100,100);
rect(100,450,100,100);
fill(0);
ellipse(150,300,100,100);
ellipse(150,100,100,100);
ellipse(150,500,100,100);
ellipse(270,70,30,30);
ellipse(270,0,30,30);
ellipse(30,270,30,30);
ellipse(30,200,30,30);
ellipse(30,130,30,30);
ellipse(270,330,30,30);
ellipse(270,400,30,30);
ellipse(270,470,30,30);
ellipse(30,530,30,30);
ellipse(30,600,30,30);




  
   endRecord();
 
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("third design");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

