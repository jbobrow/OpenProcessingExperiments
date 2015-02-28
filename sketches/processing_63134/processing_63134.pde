
import processing.pdf.*;
beginRecord(PDF, "patterns/ellipse_04.pdf"); //Keep it up here
size(500, 500);
smooth();


strokeWeight(2);
stroke(10, 100);

for (int i=3; i<=width;  i+=7)
{
 //  point (i, 15);
  for (int j=20; j<=height; j+=5)
  {

    
    ellipse(i-1, j/2,  i, j);
 
    ellipse(i, j+20, i, j);
    ellipse(i-12, j/20, i, j);
    // ellipse(i, j,  2*i+6, j+6);
    // ellipse(i+6, 2*j + i, i, j+6);
    
    // line(i, j,  i+6, j+6);
    // line(i+6, j + i/5, i, j+6);
  }
}
endRecord(); //Keep this at the end.



