
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

background(0);
smooth();

stroke(255);
strokeWeight(1);
for (int i=10; i<=width; i=i+10)
{
 line(i, 0, i+i/2, 100);
 line(i + i/2,100, i*1.2,height/2);
 line(i*1.2,height/2, i+i/2,height);
}

stroke(203,144,180);
strokeWeight(1);
for (int i=10; i<=width; i=i+5)
{
 line(i*1.2,height/2, 0,height);
}

stroke(183,4,112);
for (int i=10; i<=width; i=i+10)
{
 line(i + i/2,100, width,height); 
 line(i*1.2,height/2, width,0);  
}

stroke(67,56,198);
for (int i=10; i<=width; i=i+10)
{
 line(0,i, width,height); 
}

stroke(67,56,198);
for (int i=10; i<=width; i=i+10)
{
 line(0,0, width,i); 
}

///////////////////////////////////////////////////////////////////////////

//endRecord();

