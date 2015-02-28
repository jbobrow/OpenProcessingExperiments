
/*
Three terms that I will be using:

ANCHOR POINT: This is where the line actually attaches.
CONTROL POINT: This pulls the line towards itself, but the line doesn't actually attach here. It is also invisible.
In Illustrator for example, you won't see the CONTROL POINTS until you select an ANCHOR POINT

Comment out each section in turn to see the program work

NUMBER 1 is setting some initial points.
NUMBER 2 is using the same coordinates as NUMBER 1, but also including curvy lines. 
NUMBER 3 is doing exactly the same thing as NUMBER 1 but using bezier vertexes. 
         Try moving a CONTROL POINT or two to see what happens. Remember that CONTROL POINTS are 
         the first two x, y coordinates in the bezierVertex(); function. 
         
*/

size(300, 300);
background(25, 130, 210);

//begin shape and end shape
noFill();

// NUMBER 1 ----------------------------------This shape draws 3/4ths of a diamond.

beginShape();
  vertex(100, 100);
  vertex(150, 150);
  vertex(100, 200);
  vertex(50, 150);
endShape();


// NUMBER 2 ----------------------------------This shape draws half of a circle
beginShape();
  vertex(100, 100); //starting vertex
  
//  There are 3 bezierVertex coordinates
//  100, 100 is control vertext for the ANCHOR POINT directly beofore it, so the line "vertex(100, 100);" above
//  because it is drawn right on top of the point, it doesn't pull the line at all
//  150, 100 is the CONTROL POINT for the ANCHOR POINT right after it, 150, 150
//  150, 150 is the ANCHOR POINT where the line connects. 
  
  bezierVertex(100, 100, 150, 100, 150, 150);
  
//  Again, 150, 200 is the CONTROL POINT for the ANCHOR POINT directly preceeding it. 150, 150 in this case
//  the second numbers, 100, 200, corespond to the ANCHOR POINT directly after it
//  Try typing in different values for thesse to see how the shape changes.
  
  bezierVertex(150, 200, 100, 200, 100, 200);
  
  //just a normal vertex here
  vertex(50, 150);
endShape(); //remmeber, you can type CLOSED here to close the shape automatically

///Draw the control vectors
ellipse(150, 100, 5, 5);
line(150, 100, 150, 150);
ellipse(150, 200, 5, 5);
line( 150, 200, 150, 150 );



/*
// NUMBER 3 ----------------------------------This also draws a diamond
//The CONTROL POINTS are drawn on top of the ANCHOR POINTS so they don't pull on the line to curve it
//This is like using the "Convert Anchor Point" tool in Illustrator (select Pen Tool then hold down option, then click on an ANCHOR POINT)
beginShape();
  vertex(100, 100);
  bezierVertex(100, 100, 150, 150, 150, 150);
  bezierVertex(150, 150, 100, 200, 100, 200);
  vertex(50, 150);
endShape();
*/


