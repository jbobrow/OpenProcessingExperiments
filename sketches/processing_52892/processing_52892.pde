
// Luke Diamantopoulos, Problem set 1, Question 3
 void setup() {
  size(300, 600);
  background (0, 220, 20);
  smooth();
  noStroke();
  
    fill(#E31ED6);
ellipse(150, 400, 200, 220); // body

fill(#E31ED6);
ellipse(150, 220, 150, 150); // head  
   
 fill(#E31ED6);
rect(145, 115, 10, 35);  

fill(#E31ED6);
ellipse(150, 85, 60, 60);
}
  



void mouseClicked() {
  if (mouseX > 95 && mouseX < 205 && mouseY > 395 && mouseY < 455) {
  fill(#000000);
ellipse(125, 209, 40, 40); // left eye

   fill(#000000);
ellipse(175, 209, 40, 40); //right eye

 
   fill(#FAF9F7);
ellipse(125, 200, 25, 25); // left eye ball
 

fill(#FAF9F7);
ellipse(175, 200, 25, 25); //right eye ball
  
  fill(#E9FF10);
ellipse(150, 400, 200, 220); // body

fill(#E9F100);
ellipse(150, 220, 150, 150); // head  
   
 fill(#E9F200);
rect(145, 115, 10, 35);  

fill(#E9F100);
ellipse(150, 85, 60, 60);
}
}
  //---------------------------------------
  void draw() {
 noStroke();

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

fill(0, 220, 20);
ellipse(150, 85, 45, 45);




 


if (mouseX > 95 && mouseX < 205 && mouseY > 395 && mouseY < 455) {
fill(#000000);
ellipse(125, 209, 40, 40); // left eye

   fill(#000000);
ellipse(175, 209, 40, 40); //right eye

 
   fill(#FAF9F7);
ellipse(125, 200, 25, 25); // left eye ball
 
 

fill(#FAF9F7);
ellipse(175, 200, 25, 25); //right eye ball
 }


 }


/* I really wanted to make the eyes pop out so i made it so if you hover over his pouch, his eyes get bigger.
Aswell, if you cllick inside his pouch, he changes colour to yellow!

*/

