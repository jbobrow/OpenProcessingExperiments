
import processing.pdf.*;

size(500, 500);
beginRecord(PDF, "points_01.pdf"); //Keep it up here

//    Past your program here
// / / / / / / / / / / / / / / / /
smooth();

fill(255);
noStroke();
rect (0, 0, 500, 500);

stroke(1);
for (int i = 27; i <= 500; i = i+7)

{
   for (int j = 0; j < 500; j = j+5) {
      point(2*i, j*j);
      point(.5*i, .5*j);
       point(i*i, j);
       point(4*i*i, j);
       point(i*i, 5*j);
       point(12*i, 5*j);
       point(.8*i, .8*j);
       point(.5*i, .1*j);
      
    }
}


// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

