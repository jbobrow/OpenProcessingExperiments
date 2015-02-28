
//import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
  
  //  noLoop();
  //beginRecord(PDF, "firstdesign.pdf"); 
}

void draw(){
  background(0);
  stroke(255);
 strokeWeight(6);
 line(300,500,0,500);
 line(300,100,0,100);
 line(300,300,0,300);
 strokeWeight(0);
 stroke(3);
 fill(255);
rect(90,240,120,120);
rect(90,40,120,120);
rect(90,440,120,120);
fill(0);
rect(100,250,100,100);
rect(100,50,100,100);
rect(100,450,100,100);
fill(255);
ellipse(150,300,100,100);
ellipse(150,100,100,100);
ellipse(150,500,100,100);
ellipse(30,70,30,30);
ellipse(30,0,30,30);
ellipse(270,270,30,30);
ellipse(270,200,30,30);
ellipse(270,130,30,30);
ellipse(30,330,30,30);
ellipse(30,400,30,30);
ellipse(30,470,30,30);
ellipse(270,530,30,30);
ellipse(270,600,30,30);

 
 
     endRecord();

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


