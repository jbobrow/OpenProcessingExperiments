
/*
ACCD Summer 2012
ID02
2a Patterns
Charlene Chen
06/01/2012
*/

//import processing.pdf.*;

size(700, 700);
//beginRecord(PDF, "myFile.pdf");

///////////////////////////////////////////////////////////////////////////

background(255);
smooth();

/*
beginShape();
   vertex(width/2, height/2);
   vertex(0, 200);
   vertex(0,0);
   vertex(width,height/2);
   vertex(0, height);
   vertex(0, height-200);
endShape(); 
*/
   
noFill();   
//fill(252,219,127,5);
stroke(237,92,7);
for (int x=0; x<=width; x=x+5)
{
  for (int y=0;y<=height; y=y+20)
  {
   beginShape();
   vertex(width/4, height/4);
   vertex(x, 200);
   vertex(x,y);
   vertex(width/2,height);
   vertex(x, height);
   vertex(x, height-200);
   endShape(); 
  }
}

/*
stroke(255,20);
for (int x=100; x<=width-100; x=x+5)
{
  for (int y=100;y<=height-100; y=y+20)
  {
   beginShape();
   vertex(width/4, height/4);
   vertex(x, 200);
   vertex(x,y);
   vertex(width/2,height);
   vertex(x, height);
   vertex(x, height-200);
   endShape(); 
  }
}
*/

///////////////////////////////////////////////////////////////////////////

//endRecord();

