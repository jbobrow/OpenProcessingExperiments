
/*****************************************
 * Assignment 02
 * Name:         Henry Bradford
 * E-mail:       hbradfor@haverford.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/18/12
 * 
 * A program in which papers appear on a desk
 * and may be graded with an A or an F depending
 * on their position. Pressing any key collects
 * new papers.
***********************************************/
//variable
int numberOfPapers = 1;

//general qualities
void setup ()
{
  size(500,500);
  fill(255);
  stroke(0);
  strokeWeight(1);
  background(148,64,19);
  rectMode(CENTER);
  drawBackground();
  smooth();
}

//empty void draw
void draw()
{  
}

//grading
 void mouseClicked() 
 {
   if (mouseX < 250) {                         //bad papers
     noStroke();
     fill(255,0,0);
     rect(mouseX, mouseY, 5,25);
     rect(mouseX+5, mouseY-10, 10,5);
     rect(mouseX+5, mouseY-2.5, 10,5);
     fill(255);
     stroke(0);
   }else{                                      //good papers
     noStroke();
     fill(0,255,0);
     triangle(mouseX-10,mouseY+12.5, mouseX+10,mouseY+12.5, mouseX,mouseY-12.5);
     fill(255);
     triangle(mouseX-2,mouseY+6.25, mouseX+2,mouseY+6.25, mouseX,mouseY-4);
     rect(mouseX,mouseY+11, 8,4);
     fill(255);
     stroke(0);
     }
   }
   
//collect new papers   
void keyPressed()
{
  background(148,64,19); //generate desk
  numberOfPapers = 1;
    
    while ( numberOfPapers < 50 ) //generate papers
    {
      rect(random(0,500),random(0,500), 80, 110);
      numberOfPapers = numberOfPapers + 1;
    }
}
  
void drawBackground() 
{
    while ( numberOfPapers < 50 )
    {
    rect(random(0,500),random(0,500), 80, 110);
    numberOfPapers = numberOfPapers + 1;
  }
}
