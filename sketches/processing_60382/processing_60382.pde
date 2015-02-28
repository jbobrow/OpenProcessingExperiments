
/* 
 slice a circle into several discrete arcs, that can be imported
 into vector drawing app (Inkscape, Adobe Frustrator, etc).
 
 in case you're wondering, this isn't for datavis, just graphic design.
 "polar grid" extension in Inkscape was only getting me so far, without
 extra work to make each "slice" it's own "fillable" path.
 
 lines that refer to the pdf export library are commented out, so that
 this will run in web browsers. just uncomment those if you use this 
 in the Processing IDE, and a *.pdf file will be created/overwritten,
 every time you run the sketch.
 */

// un-comment line below for pdf export
// import processing.pdf.*;

size(400, 400);

int arcCount = 12;

float x = width/2;
float y = height/2;
float w = width/3;
float h = height/3;

background(255);

// un-comment line below for pdf export
// beginRecord(PDF, "slicedPie.pdf"); 

smooth();
noStroke();

float thisStart = 0f;
float thisEnd = 0f;


for (int i=0; i< arcCount; i++) 
{
  fill(i*(255/arcCount));

  thisEnd = thisStart+TWO_PI/arcCount;

  arc(x, y, w, h, thisStart, thisEnd);

  thisStart += TWO_PI/arcCount;
}

// un-comment line below for pdf export
// endRecord();

