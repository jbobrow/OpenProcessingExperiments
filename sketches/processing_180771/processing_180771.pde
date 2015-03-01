
float xPos  = 200;
float yPos  = 250;
float perxPos = 200;
float peryPos = 250;

float movey  =  1;

void setup ()
{
size (400,450);
strokeWeight  (2);
}

void draw ()
{
// sky
 background (#4525D8);
 
 //sun
 fill (#E5E52A);
  ellipse (50,50,50,50);
  
  //ground
  fill (#E8B91C);
 rect (0,250,400,250);

//trampolinefeet 
stroke (0);
strokeWeight (5);
line (xPos, yPos, xPos - 100, yPos +75);
line (xPos,yPos,xPos, yPos + 75);
line (xPos, yPos, xPos+ 100, yPos + 75);

line ( xPos - 110, yPos +75, xPos -90, yPos +75);
line (xPos, yPos +75, xPos +10 , yPos + 75);
line (xPos +110, yPos +75, xPos + 90 , yPos +75);

//trampoline
noStroke ();
fill (#4BA53F);
ellipse (xPos, yPos, 280,160);
fill (#92E81C);
ellipse (xPos, yPos,260,140);

//bouncer
//llegs
stroke (0);
strokeWeight (2);
line (perxPos,peryPos,perxPos -16, peryPos +50);
line (perxPos,peryPos,perxPos+14, peryPos +50);
//arms
line (perxPos,peryPos, perxPos - 45,peryPos -50);
line (perxPos, peryPos, perxPos +45,peryPos -50);
line (perxPos,peryPos,perxPos + 45, peryPos);
line (perxPos,peryPos,perxPos - 45,peryPos);
noStroke ();
//body
fill(#A5493F);
ellipse (perxPos,peryPos,40,70);

//eyes
fill (255);
ellipse (perxPos -5, peryPos -30, 5,5);
ellipse (perxPos +5, peryPos -30, 5,5);

peryPos = peryPos - 0.3;

 // textbox
 fill (255);
  rect(0,400,400,50);
  
  stroke (0);
  strokeWeight (2);
  fill (0);
    text ("boing,boing, goes the  flea on a trampoline",10,420);
    
if (peryPos  < 150)
{peryPos = 250;

}

peryPos = peryPos - 0.75;

}
