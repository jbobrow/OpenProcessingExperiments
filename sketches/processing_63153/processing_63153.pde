
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "line_04.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
smooth();
background(250);

for(int i = 5; i<=500; i=i+10)
{
  line(500,  500, i, -500 );
  line(0,  500, i, -500 );
  line(i, 0, i*50, 500 ); 
  line(500, 0, i*-50, 500 );
}


// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

