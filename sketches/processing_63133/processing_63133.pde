
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "patterns/ellipse_03.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
smooth();
smooth();


strokeWeight(2);
stroke(10, 100);

for (int i=3; i<=width;  i+=7)
{
 //  point (i, 15);
  for (int j=20; j<=height; j+=5)
  {

    fill(124, 169, 218);
    ellipse(i*12, j/2,  i, j);
 fill(255, 186, 0);
    ellipse(i, j + i, i, j);
    // ellipse(i, j,  2*i+6, j+6);
    // ellipse(i+6, 2*j + i, i, j+6);
    
    // line(i, j,  i+6, j+6);
    // line(i+6, j + i/5, i, j+6);
  }
}
// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

