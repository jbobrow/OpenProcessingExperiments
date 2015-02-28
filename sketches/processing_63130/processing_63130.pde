
import processing.pdf.*;
beginRecord(PDF, "output/ellipse_01.pdf"); //Keep it up here
size(500, 500);
smooth();


strokeWeight(3);
stroke(10, 100);

for (int i=10; i<=width;  i+=10)
{
  point (i, 10);
  for (int j=10; j<=height; j+=10)
  {
  
    ellipse(i, j,  i+6, j+6);
    ellipse(i+6, j + i/5, i, j+6);
    
    ellipse(i, j,  2*i+6, j+6);
    ellipse(i+6, 2*j + i/5, i, j+6);
    
    // line(i, j,  i+6, j+6);
    // line(i+6, j + i/5, i, j+6);
  }
}
endRecord(); //Keep this at the end.



