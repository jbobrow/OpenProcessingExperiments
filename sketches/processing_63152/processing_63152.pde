
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "lines_03.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /

smooth();
background(250);

for(int i = 10; i<=480; i=i+4)
{
  line(250,  20, i, 480 );
  line(i,  0, i, 480 );  
}



// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

