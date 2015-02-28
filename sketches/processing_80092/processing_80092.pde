
import processing.pdf.*;

size (800, 600);
beginRecord (PDF,"CIRCULOSHIPNO.pdf");
background (0);

stroke (255, 100);
strokeWeight (5);
smooth();


stroke (255, 0, 0, 255);
noFill();
ellipseMode (CENTER);
ellipse (400, 300, 30, 30);
ellipse (400, 300, 100, 100);
stroke (255, 0, 0, 200);
ellipse (400, 300, 200, 200);
stroke (255, 0, 0, 150);
ellipse (400, 300, 300, 300);
stroke (255, 0, 0, 100);
ellipse (400, 300, 400, 400);
stroke (255, 0, 0, 50);
ellipse (400, 300, 500, 500);
stroke (255, 0, 0, 30);
ellipse (400, 300, 600, 600);
stroke (255, 0, 0, 20);
ellipse (400, 300, 700, 700);
stroke (255, 0, 0, 10);
ellipse (400, 300, 800, 800);
endShape();

endRecord();

