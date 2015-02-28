
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "patterns/line_01).pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
noStroke();strokeWeight(1);
stroke(10, 100);


for (int i=3; i<=width;  i+=7)
{
  //  point (i, 15);
  for (int j=20; j<=height; j+=5)
  {


    line(i, j/2, i*12, j+4);
    line(i, j, i, j);
   // line(i, j/2, i, j);

  }
}



// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

