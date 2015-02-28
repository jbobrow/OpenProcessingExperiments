
//import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
  
    //noLoop();
 // beginRecord(PDF, "seconddesign.pdf");
  
}

void draw(){
  background(255);
  strokeWeight(6);
  line(3,0,3,600);
  line(40,0,40,600);
  line(80,0,80,600);
  line(120,0,120,600);
  line(160,0,160,600);
  line(200,0,200,600);
  line(240,0,240,600);
  line(280,0,280,600);
  fill(0);
  rect(27,0,25,25);
  rect(27,35,25,25);
  rect(27,70,25,25);
  rect(67,150,25,25);
  rect(27,150,25,25);
  rect(107,150,25,25);
  rect(67,230,25,25);
  rect(67,265,25,25);
  rect(67,300,25,25);
  rect(27,380,25,25);
  rect(67,380,25,25);
  rect(107,380,25,25);
  rect(27,460,25,25);
  rect(27,495,25,25);
  rect(27,530,25,25);
  strokeWeight(10);
  fill(255);
  ellipse(300,300,400,400);
  stroke(0);
  fill(0);
  ellipse(300,300,300,300);
  
   //endRecord();
 
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("second design");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

