
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "patterns/ellipse_02.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
smooth();


strokeWeight(3);
stroke(10, 100);

for (int i=10; i<=width;  i+=10)
{
  point (i, 10);
  for (int j=10; j<=height; j+=10)
  {
  
stroke(25, 32, 29);
    ellipse(i, j,  i+6, j+6);
stroke(255, 32, 132);
    ellipse(i, j + i/5, i, j);
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

