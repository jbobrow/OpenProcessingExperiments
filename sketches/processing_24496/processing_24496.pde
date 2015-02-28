
//import processing.pdf.*;

void setup (){
  size (200,400);
  smooth();
  
  
 
 // noLoop();
  //beginRecord(PDF, "designone.pdf"); 

}
void draw(){
 background (0);
strokeWeight (3);
stroke (255);
line (3, 0, 3, 400);
line (8, 0, 8, 400);
line (13, 0, 13, 400);
line (19, 0, 19, 400);
line (26, 0, 26, 400);
line (34, 0, 34, 400);
line (43, 0, 43, 400);
line (53, 0, 53, 400);
line (64, 0, 64, 400);
line (77, 0, 77, 400);
line (91, 0, 91, 400);
line (106, 0, 106, 400);
line (122, 0, 122, 400);
line (139, 0, 139, 400);
line (157, 0, 157, 400);
line (176, 0, 176, 400);
line (196, 0, 196, 400);


stroke (255, 116, 116, 150);
fill (255, 116, 116, 150);
ellipse (10, 200, 10, 10);

stroke (252, 92, 92, 150);
fill (252, 92, 92, 150);
ellipse (30, 180, 15, 15);

stroke (252, 92, 92, 150);
fill (252, 92, 92, 150);
ellipse (30, 220, 15, 15);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (60, 200, 20, 20);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (70, 150, 30, 30);

stroke (255, 64, 64, 150);
fill (255, 64, 64, 150);
ellipse (70, 250, 30, 30);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (120, 200, 45, 45);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (140, 120, 50, 50);

stroke (255, 39, 39, 150);
fill (255, 39, 39, 150);
ellipse (140, 280, 50, 50);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (200, 200, 80, 80);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (220, 60, 80, 80);

stroke (225, 0, 0, 150);
fill (225, 0, 0, 150);
ellipse (220, 340, 80, 80);

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

