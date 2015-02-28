
//import processing.pdf.*;

void setup(){
  size (200,400);
  background (255);
  strokeCap (ROUND);
  smooth ();
  
  //noLoop();
  //beginRecord(PDF, "designtwo.pdf");
}

void draw(){
stroke (0);

strokeCap(SQUARE);
strokeWeight(8);
line (65, 310, 174, 310);
line (65, 290, 177, 290);
line (65, 90, 175, 90);
line (65, 110, 177, 110);


strokeWeight(3);
stroke (0, 0, 0, 150);
line (20, 0, 20, 400);
line (41, 0, 41, 400);


fill (225, 0, 0, 150);
ellipse (0, 200, 80, 80);
ellipse (20, 60, 80, 80);
ellipse (20, 340, 80, 80);


strokeWeight (3);
stroke (0);
fill (255, 0, 0, 200);
ellipse (100, 120, 70, 70);
ellipse (100, 280, 70, 70);
ellipse (200, 0, 70, 70);
ellipse (200, 400, 70, 70);


fill (252, 92, 92, 200);
ellipse (175, 185, 30, 30); //top left
ellipse (200, 167, 30, 30); //top middle
ellipse (175, 215, 30, 30); //bottom left
ellipse (200, 233, 30, 30); //bottom middle

strokeWeight(4);
strokeCap(ROUND);
line (165, 0, 184, 167);  
line (165, 400, 184, 233);
line (126, 96, 185, 174);
line (126, 304, 185, 226);
line (89, 154, 170, 200);
line (89, 246, 170, 200);
line (65, 0, 65, 400);

strokeWeight(8);
strokeCap(SQUARE);
line (65, 10, 165, 10);
line (65, 30, 167, 30);
line (65, 50, 170, 50);
line (65, 70, 173, 70);

line (65, 390, 167, 390);
line (65, 370, 169, 370);
line (65, 350, 171, 350);
line (65, 330, 173, 330);

line (152, 130, 181, 130);
line (167, 150, 184, 150);
line (152, 270, 180, 270);
line (167, 250, 183, 250);

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

