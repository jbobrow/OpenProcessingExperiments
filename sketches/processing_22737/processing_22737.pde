
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 500;
int patternSeperationY = 500;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  
stroke(205,8,250);
noFill();
strokeWeight(1.5);


arc(500, 0, 20, 20, 0, PI );
  arc(500, 0, 45, 45, 0, PI );
  arc(500, 0, 75, 75, 0, PI );
  arc(500, 0, 100, 100, 0, PI );
  arc(500, 0, 125, 125, 0, PI );
  arc(500, 0, 150, 150, 0, PI );
 arc(500, 0, 175, 175, 0, PI );
 arc(500, 0, 200, 200, 0, PI );
  arc(500, 0, 225, 225, 0, PI );
   arc(500, 0, 250, 250, 0, PI );
 arc(500, 0, 275, 275, 0, PI );
  arc(500, 0, 300, 300, 0, PI );
 arc(500, 0, 325, 325, 0, PI );
  arc(500, 0, 350, 350, 0, PI );
 arc(500, 0, 375, 375, 0, PI );
 arc(500, 0, 400, 400, 0, PI );
 arc(500, 0, 425, 425, 0, PI );
 arc(500, 0, 450, 450, 0, PI );
 arc(500, 0, 475, 475, 0, PI );
 arc(500, 0, 500, 500, 0, PI );
  arc(500, 0, 525, 525, 0, PI );
   arc(500, 0, 550, 550, 0, PI );
    arc(500, 0, 575, 575, 0, PI );
     arc(500, 0, 600, 600, 0, PI );
    arc(500, 0, 625, 625, 0, PI );
   arc(500, 0, 650, 650, 0, PI );
   arc(500, 0, 675, 675, 0, PI );
   arc(500, 0, 700, 700, 0, PI );
   arc(500, 0, 725, 725, 0, PI );
  arc(500, 0, 750, 750, 0, PI );      
  arc(500, 0, 775, 775, 0, PI );
  arc(500, 0, 800, 800, 0, PI );
  arc(500, 0, 825, 825, 0, PI );
  arc(500, 0, 850, 850, 0, PI );
    arc(500, 0, 875, 875, 0, PI );
     arc(500, 0, 900, 900, 0, PI );
      arc(500, 0, 925, 925, 0, PI );
  arc(500, 0, 950, 950, 0, PI );
    arc(500, 0, 975, 975, 0, PI );
    arc(500, 0, 1000, 1000, 0, PI );
     arc(500, 0, 1025, 1025, 0, PI );
      arc(500, 0, 1050, 1050, 0, PI );
       arc(500, 0, 1075, 1075, 0, PI );
       arc(500, 0, 1100, 1100, 0, PI );
        arc(500, 0, 1125, 1125, 0, PI );
         arc(500, 0, 1150, 1150, 0, PI );
          arc(500, 0, 1175, 1175, 0, PI );
           arc(500, 0, 1200, 1200, 0, PI );
             arc(500, 0, 1225, 1225, 0, PI );
               arc(500, 0, 1250, 1250, 0, PI );
                 arc(500, 0, 1275, 1275, 0, PI );
                   arc(500, 0, 1300, 1300, 0, PI );
                     arc(500, 0, 1325, 1325, 0, PI );
                       arc(500, 0, 1350, 1350, 0, PI );
                        arc(500, 0, 1375, 1375, 0, PI );
                        arc(500, 0, 1400, 1400, 0, PI );
stroke(205,8,250);
noFill();
strokeWeight(1.5);
line (100, 0, 500, 100);
line (25, 0, 500, 200);
line (0, 10, 500, 300);
line (0, 30, 500, 375);
line (0, 42, 500, 440);
line (0, 55, 500,500);
line (0, 75, 425, 500);
line (0, 96, 370,500);
line (0, 120, 325, 500);
line (0, 142, 280, 500);
line (0, 165, 240, 500);
line (0, 190, 210, 500);
line (0, 210, 175, 500);
line (0, 240, 145, 500);
line (0, 275, 120, 500);
line (0, 310, 100, 500);
line (0, 350, 87, 500);
line (0, 390, 75, 500);
line (0, 420, 60, 500);
line (0, 450, 45, 500);
line (0, 500, 25, 500);

stroke(205,8,250);
noFill();
strokeWeight(1.5);

line (0, 75, 400, 0);
line (0, 140, 490, 0);
line (0, 210, 500, 15);
line (0, 290, 500, 35);
line (0, 380, 500, 50);
line (0, 500, 500, 65);
line (90, 500, 500, 80);
line (170, 500, 500, 92);
line (220, 500, 500, 115);
line (280, 500, 500, 130);
line (340, 500, 500, 144);
line (390, 500, 500, 167); 
line (430, 500, 500, 185);
line (480, 500, 500, 200);



  
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

