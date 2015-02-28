
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
for (int i = 0; i <= 500; i = i+5)

{
   for (int j = 0; j < 80; j = j+5) {
      point(i, j);
      
    }
}


// / / / / / / / / / / / / / / / /
endRecord(); //Keep this at the end.


//To find your PDF, hit apple-K to open the sketch folder.
//You may get red text below, but it will still work.

