
// Luke Diamantopoulos, Problem set 1, Question 2
 void setup() {
  size(300, 600);
  background (0, 220, 20);
  smooth();
  
  noStroke();




fill(#E31ED6);
ellipse(150, 400, 200, 220); // body

fill(#E31ED6);
ellipse(150, 220, 150, 150); // head

fill(#F0D1B3);
ellipse (150, 220, 130, 130); // face

fill (#E31ED6);
ellipse(150, 235, 70, 70); //mouth

fill(#F0D1B3);
rect(115,200, 75, 35); // cover mouth

fill(#000000);
ellipse(125, 209, 30, 30); // left eye

fill(#000000);
ellipse(175, 209, 30, 30); //right eye


fill(#FAF9F7);
ellipse(125, 200, 15, 15); // left eye ball

fill(#FAF9F7);
ellipse(175, 200, 15, 15); //right eye ball

fill(#7E7A75);
rect(95, 395, 110, 60); //patch

fill(#E31ED6);
rect(145, 115, 10, 30);  

fill(#E31ED6);
ellipse(150, 85, 60, 60);

fill(0, 220, 20);
ellipse(150, 85, 45, 45);
 }

/* I decided to make a teletubby looking thing that 
I thought looked cute. I attempted to make the eyes 
look a bit chinese anime to give it that extra cute
look I again used the semi circle trick I used last 
problem.
*/

