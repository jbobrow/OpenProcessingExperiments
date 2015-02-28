
//import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
  
  //  noLoop();
  //beginRecord(PDF, "firstdesign.pdf"); 
}

void draw(){
  background(0);
 strokeWeight(3);
 stroke(0);
 fill(255);
 rect(210,5,85,85);
 rect(125,125,85,85);
 rect(75,260,85,85);
 rect(125,390,85,85);
 rect(210,510,85,85);
 rect(280,120,50,50);
 rect(245,200,50,50);
 rect(200,280,50,50);
 rect(245,355,50,50);
 rect(280,435,50,50);

 //endRecord();

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


