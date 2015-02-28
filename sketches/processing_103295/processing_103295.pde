
void setup()
  {
    size(300,300);
  }
int bluered = 1;
  
void draw()
  {
    background(0);
     ellipse (pmouseX,pmouseY,30,30);
     size(250, 250);
smooth();
stroke(0);
strokeWeight(5);
ellipseMode(CENTER);
 
ellipse(125, 125, 200, 200);
ellipse(100, 90, 10, 10);
ellipse(165, 90, 10, 10);
arc(125, 125, 100, 120, 0.2, PI - 0.2);
   
    if( bluered == 1 && mousePressed == true)
     
  {fill (0,0,255);
  }
   if( bluered == 0 && mousePressed == true)
    
   {fill (255,0,0);
   }
 
  }

    
  
  
  void mouseReleased()
  {
     println(bluered);
    if ( bluered == 1){
      bluered = 0;}
    else  { 
    println("does nit get here?");
    bluered = 1;}
  }
  //It works on my other one.
