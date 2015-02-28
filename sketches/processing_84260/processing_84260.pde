
thing []thingsArray;
int nbeVThings;
int nbeHThings;
float ecartX,ecartY;
PImage myImage;
// Toxi's flood fill code, updated to modern Java and Processing and to my taste... :-P
// Also generalized to work on any PImage
// http://processing.org/discourse/yabb2/YaBB.pl?num=1138719727
FloodFill myFloodFill ;
// 

void setup(){
  size(640,640);  
  smooth();
  frameRate(100);
  strokeWeight(3);
  
  createGrid();
  
}

void createGrid(){
  background(255);
  nbeVThings=3+int(random(30));
  nbeHThings=3+int(random(30));
  ecartX=float(width+100)/(nbeVThings+1);
  ecartY=float(height+100)/(nbeHThings+1);
  myImage=createImage(width,height,RGB);
  myImage.loadPixels();
  thingsArray=new thing[nbeVThings+nbeHThings];
  for(int i=0;i<nbeVThings;i++){
    thingsArray[i]=new thing(-50+ecartX*(i),-50f,true);
    thingsArray[i].display();
  }
  for(int i=0;i<nbeHThings;i++){
    thingsArray[i+nbeVThings]=new thing(-50f,-50+ecartY*i,false);
    thingsArray[i+nbeVThings].display();
  }
  loadPixels();
  myImage.pixels=pixels;
  myFloodFill = new FloodFill();
  for(int i=0;i<width;i+=ecartX/4){
    for(int j=0;j<height;j+=ecartY/4){
    //if((-50+thingsArray[i].x1+ecartX/2>0) && (-50+thingsArray[i].x1+ecartX/2<width) && (-50+thingsArray[i].y1+ecartY/2>0) && (-50+thingsArray[i].y1+ecartY/2<height)){
    myFloodFill.DoFill(i,j, color(int(random(255)), int(random(255)),int(random(255))));    
}
  updatePixels();  
  }
}
void draw () {
  //
  // background (117);
  //
    myFloodFill.DoFill(int(random(width)),int(random(height)), color(int(random(255)), int(random(255)),int(random(255)),10));
    updatePixels();
}
void mousePressed(){
  myFloodFill.DoFill(mouseX,mouseY, color(int(random(255)), int(random(255)),int(random(255)),10));
    updatePixels();
  //createGrid();
}
void keyPressed(){
  createGrid();
}
// =====================================================================
// I create a class to share variables between the functions...
public class FloodFill
{
  protected int iw; // Image width
  protected int ih; // Image height
  protected color[] imagePixels;
  protected color backColor; // Color found at given position
  protected color fillColor; // Color to apply
  // Stack is almost deprecated and slow (synchronized).
  // I would use Deque but that's Java 1.6, excluding current (mid-2009) Macs...
  protected ArrayList stack = new ArrayList();
  //
  public FloodFill()
  {
    iw = width;
    ih = height;
    imagePixels = pixels; // Assume loadPixels have been done before
  }
  //
  public FloodFill(PImage imageToProcess)
  {
    iw = imageToProcess.width;
    ih = imageToProcess.height;
    imagePixels = imageToProcess.pixels; // Assume loadPixels have been done before if sketch image
  }
  //
  public void DoFill(int startX, int startY, color fc)
  {
    // start filling 
    fillColor = fc;
    backColor = imagePixels[startX + startY * iw];
    // don't run if fill color is the same as background one
    if (fillColor == backColor)
      return;
    stack.add(new PVector(startX, startY));
    while (stack.size () > 0)
    {
      PVector p = (PVector) stack.remove(stack.size() - 1);
      // Go left
      FillScanLine((int) p.x, (int) p.y, -1);
      // Go right
      FillScanLine((int) p.x , (int) p.y, 1);
    }
  }
  //
  protected void FillScanLine(int x, int y, int dir)
  {
    // compute current index in pixel buffer array
    int idx = x + y * iw;
    boolean inColorRunAbove = false;
    boolean inColorRunBelow = false;
    // fill until boundary in current scanline...
    // checking neighbouring pixel rows
    while (x >= 0 && x < iw && brightness(imagePixels[idx])>5)
    {
      imagePixels[idx] = fillColor;
      if (y > 0) // Not on top line
      {
         //if (imagePixels[idx - iw] ==backColor)
       if (brightness(imagePixels[idx - iw]) >5&&imagePixels[idx - iw]!=fillColor)        
        {
          if (!inColorRunAbove)
          {
            // The above pixel needs to be flooded too, we memorize the fact.
            // Only once per run of pixels of back color (hence the inColorRunAbove test)
            stack.add(new PVector(x, y-1));
            inColorRunAbove = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunAbove = false;
        }
      }
      if (y < ih - 1) // Not on bottom line
      {
        //if (imagePixels[idx + iw] == backColor)
         if (brightness(imagePixels[idx + iw]) >5&&imagePixels[idx + iw]!=fillColor)
        {
          if (!inColorRunBelow)
          {
            // Idem with pixel below, remember to process there
            stack.add(new PVector(x, y + 1));
            inColorRunBelow = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunBelow = false;
        }
      }
      // Continue in given direction
      x += dir;
      idx += dir;
    } //
  } // func
} // class
// ----------------------------------------------------------

class thing{
  float x,y,x1,y1;
  float step=20;
  float deriv=6;
  boolean isVertical;
  thing(float X,float Y,Boolean IsVertical){
    x=X;
    y=Y;
    isVertical=IsVertical;
  }
  void display(){
    if(!isVertical){
   for(int i=0;i<(width+100)/step;i++){
      x1=step+x;
      float r=random(deriv);
      y1=y+deriv-2*r;
      //strokeWeight(r);
      line(x,y,x1,y1);
      x=x1;
      y=y1;
   }
    }
    else{
      for(int i=0;i<(height+100)/step;i++){
        float r=random(deriv);
      x1=x+deriv-2*r;
      y1=step+y;
      //strokeWeight(r);
      line(x,y,x1,y1);
      x=x1;
      y=y1;
   }
    }
  }
}

