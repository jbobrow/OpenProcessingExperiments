
void setup()
{
  background(255);
  size(600,400);
  strokeWeight(5);
}

void draw()
{
// make each letter a different color

// draw the letter "L" in red
stroke(3,255,93);
line(10,10,10,100); 
line(10,100,100,100); 

// draw the letter "O"
stroke(3,206,255);
ellipse(140,57,80,90);

// using the ellipse command

// draw the letter "V" and the letter "E"
// using the line command
stroke(250,255,3);
line(190,10,240,100);
line(285,10,240,100);

stroke(255,0,255);
line(310,10,310,100);
line(310,10,370,10);
line(310,55,370,55);
line(310,100,370,100);
// create another word using drawing commands
// for example "PIZZA"

stroke(255,142,3);
line(10,200,10,280);
line(10,240,50,240);
line(50,200,50,280);


stroke(255,15,3);
line(80,200,60,280);
line(70,245,92,245);
line(80,200,110,280);

stroke(0);
line(130,200,130,280);

stroke(0);
rect(130,200,50,40);

stroke(64, 224, 208);
line(200,200,200,280);

stroke(64, 224, 208);
rect(200,200,50,40);

stroke(94,2,245);
line(280,200,300,250);

stroke(94,2,245);
line(320,200,300,250);

}


