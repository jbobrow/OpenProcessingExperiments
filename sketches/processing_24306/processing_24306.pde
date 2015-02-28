
void setup(){
  size(400,800);
  background(59,124,252);
    
 
 
}
  
  
void draw()
 
 
   {
 //Lines:
 smooth(); stroke(0,2); line (400,-400,400,800);
  smooth(); stroke(0,2); line (350,-350,400,800);
 smooth(); stroke(0,2); line (300,-300,400,800);
   smooth(); stroke(0,2); line (250,-250,400,800);
 smooth(); stroke(0,2); line (200,-200,400,800);
  smooth(); stroke(0,2); line (150,-150,400,800);
 smooth(); stroke(0,2); line (100,-100,400,800);
smooth(); stroke(0,2); line (50,-50,400,800);
smooth(); stroke(0,2); line (0,00,400,800);
smooth(); stroke(0,2); line (0,100,400,800);
smooth(); stroke(0,2); line (0,200,400,800);
smooth(); stroke(0,2); line (0,300,400,800);
smooth(); stroke(0,2); line (0,350,400,800);
smooth(); stroke(0,2); line (0,400,400,800);
smooth(); stroke(0,2); line (0,450,400,800);
smooth(); stroke(0,2); line (0,500,400,800);
smooth(); stroke(0,2); line (0,550,400,800);
smooth(); stroke(0,2); line (0,600,400,800);
smooth(); stroke(0,2); line (0,650,400,800);
smooth(); stroke(0,2); line (0,700,400,800);
smooth(); stroke(0,2); line (0,750,400,800);
smooth(); stroke(0,2); line (0,800,400,800);

//Staff
smooth(); fill(255, 4); stroke(0); rect (0,650,399,25);
smooth(); fill(255, 4); stroke(0); rect (0,675,399,25);
smooth(); fill(255, 4); stroke(0); rect (0,700,399,25);
smooth(); fill(255, 4); stroke(0); rect (0,725,399,25);
smooth(); line (250, 650, 250,750);
smooth(); line (260, 650, 260,750);

//Notes
smooth(); fill(0); stroke(0); ellipse (50,700,15,15);
smooth(); fill(0); stroke(0); rect (55,630,3,70);
smooth(); fill(0); stroke(0); rect (55,630,50,3);
smooth(); fill(0); stroke(0); ellipse (100,675,15,15);
smooth(); fill(0); stroke(0); rect (105,630,3,45);

smooth(); fill(0); stroke(0); ellipse (150,687,15,15);
smooth(); fill(0); stroke(0); rect (155,630,3,60);
smooth(); fill(0); stroke(0); ellipse (220,713,3,3);

smooth(); stroke(0); line (156,630,170,640);
smooth(); stroke(0); line (156,632,170,642);



smooth(); fill(0); stroke(0); rect (205,630,3,85);
smooth(); fill(0); stroke(0); ellipse (200,713,15,15);

smooth(); noFill(); stroke(0,2); ellipse (0,0,100,100);
smooth(); noFill(); stroke(0,2); ellipse (0,0,300,300);
smooth(); noFill(); stroke(0,2); ellipse (0,0,500,500);
smooth(); noFill(); stroke(0,2); ellipse (0,0,700,700);
smooth(); noFill(); stroke(0,2); ellipse (0,0,900,900);
smooth(); noFill(); stroke(0,2); ellipse (0,0,1100,1100);
smooth(); noFill(); stroke(0,2); ellipse (0,0,1300,1300);
smooth(); noFill(); stroke(0,2); ellipse (0,0,1500,1500);

//Centre note
smooth(); noFill(); stroke(0,2); ellipse (100,200,100,100);
smooth(); stroke(0,2); line (150,200,200,50);
smooth(); stroke(0,2); line (130,160,180,10);
smooth(); stroke(0,2); line (180,10,350,60);
smooth(); stroke(0,2); line (200,50,305,80);
smooth(); stroke(0,2); line (305,80,270,210);
smooth(); stroke(0,2); line (350,60,290,250);
smooth(); noFill(); stroke(0,2); ellipse (240,250,100,100);
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

