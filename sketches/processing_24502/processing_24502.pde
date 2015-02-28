
//import processing.pdf.*;

void setup(){
  size (200,400);
  strokeCap (ROUND);
  smooth ();

//noLoop();
  //beginRecord(PDF, "designthree.pdf");
}

void draw (){
stroke(255);
background (0);
strokeWeight(8);
strokeCap(SQUARE);
line (25, 310, 135, 310);
line (22, 290, 135, 290);
line (25, 90, 135, 90);
line (22, 110, 135, 110); 
  
strokeWeight (3);
stroke (255, 255, 255, 150);
line (180, 0, 180, 400);
line (159, 0, 159, 400);

fill (225, 0, 0, 150);
ellipse (200, 200, 80, 80);
ellipse (180, 60, 80, 80);
ellipse (180, 340, 80, 80);


strokeWeight (3);
stroke (255);
fill (255, 0, 0, 200);
ellipse (100, 120, 70, 70);
ellipse (100, 280, 70, 70);
ellipse (0, 0, 70, 70);
ellipse (0, 400, 70, 70);

fill (252, 92, 92, 200);
ellipse (25, 185, 30, 30); //top right
ellipse (0, 167, 30, 30); //top middle
ellipse (25, 215, 30, 30); //bottom right
ellipse (0, 233, 30, 30); //bottom middle

strokeCap(ROUND);
strokeWeight(4);
line (35, 0, 15, 167);
line (35, 400, 15, 233);
line (14, 227, 74, 303);
line (112, 153, 30, 200);
line (14, 173, 71, 101);
line (112, 247, 30, 200);
line (135, 0, 135, 400);

strokeWeight(8);
strokeCap(SQUARE);

line (35, 10, 135, 10);
line (32, 30, 135, 30);
line (29, 50, 135, 50);
line (27, 70, 135, 70);

line (35, 390, 135, 390);
line (32, 370, 135, 370);
line (29, 350, 135, 350);
line (27, 330, 135, 330);

line (20, 270, 48, 270);
line (16, 250, 33, 250);
line (19, 130, 48, 130);
line (17, 150, 33, 150);

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

