
void setup () {
  
  size (500, 500);
  smooth ();
  }
  
  void draw () {
  background (255);
  
  float X = constrain (mouseX, 150, 350);
  float Y = constrain (mouseY, 50, 250);
  
  
 //Arms
 line (X + 120, Y + 80, X - 5, Y + 20); 
 line (X - 120, Y + 80, X - 5, Y + 20); 
 
 // Body 
 fill (196, 35, 231);
ellipse( X, Y + 80, 50, 200);

//head
  fill (196, 35, 231);
  ellipse (X, Y, 80, 80);
  
  //eye
  fill (0);
  ellipse (X - 15, Y , 10, 10);
  ellipse (X + 15 , Y, 10, 10);
 
 // Ears
 fill (196, 35, 231);
   ellipse (X - 30, Y - 30 , 20, 20);
  ellipse (X + 30 , Y - 30, 20, 20);
  
  // Legs
  strokeWeight (5);
 line(X  ,Y + 180 , X + 10, Y + 220);
  line(X  ,Y + 180 , X - 10, Y + 220);
  
  //Mounth
 line ( X + 15, Y + 20, X - 15, Y + 20);
 


  }             
