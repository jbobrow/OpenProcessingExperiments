
void setup ()
{
  size(400, 400);
  background(255);
  midW = width/2.0;
  midH = height/2.0;
  i=0;
  j=0;
  k=0;
  shapeCount=1;
}
float midW;
float midH;
float i,j,k;
int shapeCount;
void draw ()
{
  fill(255);
  strokeWeight(5);
  if (shapeCount ==1) {
    if (i>1) shapeCount++;
    rect(0, 0, width, height);
    frameRate(20);
    line(midW-25, 0, midW-25, height*i); //1
    line(0, midH-25, width*i, midH-25);  //2
    i = i+ 0.01;
    
  }
  if (shapeCount==2) {
  fill(#DD0000);
  rect(0,0,midW-25,midH-25); //red
  shapeCount++;
  }
  if (shapeCount==3)
  {
    if (j >1) shapeCount++;
  line(0,midH+65,width*j,midH+65); //3
  line(midW-150,midH+65+4, midW-150,midH+65+135*j); //4
  j = j+ 0.01;
  
  }
  if (shapeCount==4)
  {
  fill(#EDFF03);
  rect(0,midH+65,50,133); //yellow
  shapeCount++;
  }
  if (shapeCount==5)
  {
    if (k>1) shapeCount++;
  line(midW +100,midH+65+2,midW+100,midH+65 +135*k); //5
  line(midW-25+1,midH+171,midW-1+100*k,midH+171); //6
  k = k+ 0.01;
  
  }
  if (shapeCount==6)
  {
  fill(#000099);
  rect(midW-25,midH+65,125,110); //blue
  shapeCount++;
  }
  if (shapeCount==7) {
    noLoop();
    println ("done");
  }
  
}

