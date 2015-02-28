
//import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
   
  
  
//noLoop();
 //beginRecord(PDF, "thirddesign.pdf");
  
}

void draw(){
  background(0);
 stroke(255);
  strokeWeight(6);
  line(300,0,300,600);
  line(260,0,260,600);
  line(220,0,220,600);
  line(180,0,180,600);
  line(140,0,140,600);
  line(100,0,100,600);
  line(60,0,60,600);
  line(20,0,20,600);
  fill(255);
  rect(247,0,25,25);
  rect(247,35,25,25);
  rect(247,70,25,25);
  rect(247,150,25,25);
  rect(207,150,25,25);
  rect(167,150,25,25);
  rect(207,230,25,25);
  rect(207,265,25,25);
  rect(207,300,25,25);
  rect(247,380,25,25);
  rect(207,380,25,25);
  rect(167,380,25,25);
  rect(247,460,25,25);
  rect(247,495,25,25);
  rect(247,530,25,25);
  strokeWeight(10);
  stroke(255);
  fill(0);
  ellipse(0,300,400,400);
  stroke(255);
  fill(255);
  ellipse(0,300,300,300);
  
  
   //endRecord();
 
  
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

