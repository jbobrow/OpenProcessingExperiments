
import processing.pdf.*;
//beginRecord (PDF, "Dibujofijo II ver1.PDF");
size (600,600);
background (0);

smooth();

fill(random(255));
rectMode(CENTER);
rect(height/2,width/2,height/4,height/4);
fill(random(100,255));
rect(height/4,width/4,height/4,height/4);
fill(random(100,255));
rect(height/4,width-width/4,height/4,height/4);
fill(random(100,255));
rect(height-height/4,width/4,height/4,height/4);
fill(random(100,255));
rect(height-height/4,width-width/4,height/4,height/4);

fill(random(100,255));


fill(random(100,255));
ellipse(height/2,width/4,height/4,height/4);
fill(random(100,255));
ellipse(height/2,width-width/4,height/4,height/4);
fill(random(100,255));
ellipse(height-height/4,width/2,height/4,height/4);
fill(random(100,255));
ellipse(height/4,width/2,height/4,height/4);
noStroke();
ellipse(height/2,width/2,height/4,height/4);
//endRecord();
