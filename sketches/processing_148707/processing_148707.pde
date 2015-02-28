
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
stroke(255,0,0);
line(10,10,10,100); 
line(10,100,100,100); 

// draw the letter "O"
// using the ellipse command
stroke(245,245,6);
ellipse(180,50,100,100);

// draw the letter "V" and the letter "E"
// using the line command
stroke(0,90,79);
line(320,10,290,100);
line(260,10,290,100);
stroke(200,200,90);
line(380,10,380,100);
line(450,100,380,100);
line(450,10,380,10);
line(450,50,380,50);

// create another word using drawing commands
// for example "PIZZA"
stroke(0,0,0);
line(20,300,20,200);
line(20,200,100,200);
line(20,250,100,250);
stroke(78,98,200);
ellipse(180,250,100,100);
stroke(0,99,0);
ellipse(280,250,100,100);
stroke(99,9,99);
line(445,300,445,150);
ellipse(390,250,100,100);
}
