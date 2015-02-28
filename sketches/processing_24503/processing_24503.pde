
//import processing.pdf.*;

void setup (){
  size (200,400);
  background (255);
 smooth ();
 
  //noLoop();
  //beginRecord(PDF, "designfour.pdf"); 
 
}
void draw(){

strokeWeight (3);
stroke (0);
line (197, 0, 197, 400);
line (192, 0, 192, 400);
line (187, 0, 187, 400);
line (181, 0, 181, 400);
line (174, 0, 174, 400);
line (166, 0, 166, 400);
line (157, 0, 157, 400);
line (147, 0, 147, 400);
line (136, 0, 136, 400);
line (123, 0, 123, 400);
line (108, 0, 108, 400);
line (94, 0, 94, 400);
line (78, 0, 78, 400);
line (61, 0, 61, 400);
line (43, 0, 43, 400);
line (24, 0, 24, 400);
line (4, 0, 4, 400);


stroke (255, 116, 116, 150);
fill (255, 116, 116, 150);
ellipse (190, 200, 10, 10);

stroke (252, 92, 92, 150);
fill (252, 92, 92, 150);
ellipse (170, 180, 15, 15);

stroke (252, 92, 92, 150);
fill (252, 92, 92, 150);
ellipse (170, 220, 15, 15);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (140, 200, 20, 20);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (130, 150, 30, 30);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (130, 250, 30, 30);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (80, 200, 45, 45);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (60, 120, 50, 50);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (60, 280, 50, 50);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (0, 200, 80, 80);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (-20, 60, 80, 80);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (-20, 340, 80, 80);

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

