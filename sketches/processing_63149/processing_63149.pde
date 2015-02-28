
import processing.pdf.*;

size(400,400);
beginRecord(PDF, "lines_02.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
size(500, 500);
smooth();
background(250);

for(int i = 10; i<=480; i=i+4)
{
  line(0,  20, i*1.3, 480 );
  line(i,  0, i*3, 480 ); 
  line(500,  0, i*3, 480 ); 
  line(250,  0, i*3, 480 ); 
}



// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

