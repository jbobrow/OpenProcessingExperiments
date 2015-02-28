
void setup(){
  size(400,800);
  background(255,250,160);

    
  
 
}
  
  
void draw()
 

 {
   
           //designs
        
 smooth(); stroke (0, 1); fill (255, 2); triangle (0,0,0,800,200,400);
  smooth(); stroke (0, 1); fill (255, 2); triangle (400,0,400,800,200,400);
  
        smooth(); stroke (0, 1); noFill(); ellipse (200,400,150,150);
                smooth(); stroke (0, 1); noFill(); ellipse (200,400,350,350);
                            smooth(); stroke (0, 1); noFill(); ellipse (200,400,550,550);
                smooth(); stroke (0, 1); noFill(); ellipse (200,400,750,750);
                
 smooth(); stroke(0,1); fill (255, 2); triangle (200,300,250,400,150,400);
 smooth(); stroke(0,1); fill (255, 2); triangle (150,400,250,400, 200, 500);
 
                smooth(); stroke (0, 1); noFill(); ellipse (0,0,400,800);
smooth(); stroke (0, 1); noFill(); ellipse (400,0,400,800);
                smooth(); stroke (0, 1); noFill(); ellipse (400,800,400,800);
smooth(); stroke (0, 1); noFill(); ellipse (0,800,400,800);
  
  
   //frame
 smooth(); stroke (0,10); fill (255,250,100); rect (10,650,380,10);
 smooth(); stroke (0,10); fill (255,250,100); rect (10,700,380,10);
 
 //panels
 
  smooth(); stroke (0,10); fill (255, 0, 0); rect (25,630,30,100);
    smooth(); stroke (0,10); fill (255, 100, 0); rect (60,632,30,96);
        smooth(); stroke (0,10); fill (255, 240, 0); rect (95,634,30,90);
          smooth(); stroke (0,10); fill (45, 224, 36); rect (130,636,30,85);
    smooth(); stroke (0,10); fill (10, 255, 160); rect (165,638,30,82);
        smooth(); stroke (0,10); fill (0, 0, 255); rect (200,640,30,79);
          smooth(); stroke (0,10); fill (255); rect (235,642,30,76);
    smooth(); stroke (0,10); fill (255, 0, 255); rect (270,643,30,74);
        smooth(); stroke (0,10); fill (255, 90, 240); rect (305,644,30,72);
            smooth(); stroke (0,10); fill (255, 0, 0); rect (340,645,30,70);
            
            //frame ellipses
    smooth(); stroke (0, 150); fill (255,250,100); ellipse (40,705,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (75,705,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (110,705,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (145,705,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (180,705,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (215,705,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (250,705,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (285,705,10,10);
            smooth(); stroke (0, 150); fill (255,250,100); ellipse (320,705,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (355,705,10,10);
        
            smooth(); stroke (0, 150); fill (255,250,100); ellipse (40,655,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (75,655,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (110,655,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (145,655,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (180,655,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (215,655,10,10);
           smooth(); stroke (0, 150); fill (255,250,100); ellipse (250,655,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (285,655,10,10);
            smooth(); stroke (0, 150); fill (255,250,100); ellipse (320,655,10,10);
        smooth(); stroke (0, 150); fill (255,250,100); ellipse (355,655,10,10);
        

    
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

