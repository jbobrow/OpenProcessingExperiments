
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
stroke(#811111);
line(10,10,10,100); 
line(10,100,100,100); 

// draw the letter "O"
// using the ellipse command
stroke(#AA1616);
ellipse(150, 55,100,100);

// draw the letter "V" and the letter "E"
// using the line command
stroke(#E82121);
line(250, 100, 200, 10);
line(250, 100, 300, 10);

stroke(#FA6565);
line(310, 10, 310, 100);
line(310, 10, 375, 10);
line(310, 45, 375, 45);
line(310, 100, 375, 100);

// create another word using drawing commands
// for example "PEACE"

stroke(0,0,255);
line(10, 200, 10, 300);
ellipse(42, 210, 65, 65);

stroke(0,255,0);
line(90, 200, 90, 300);
line(90, 200, 140, 200);
line(90, 235, 140, 235);
line(90, 300, 140, 300);

stroke(#EFFA65);
line(150, 300, 200, 200);
line(200, 200, 250, 300);
line(175, 250, 225, 250);

stroke(#F76F20);
line(265, 200, 265, 300);
line(265, 200, 320, 200);
line(265, 300, 320, 300);

stroke(255, 0, 0);
line(345, 200, 345, 300);
line(345, 200, 395, 200);
line(345, 235, 395, 235);
line(345, 300, 395, 300);

}
