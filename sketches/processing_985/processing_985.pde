
// This generates a set of "flowers" with a marilyn monroe on top
color SelectedColor = color(16,93,193);
PImage b; 
int i;
int Counter;
void setup() {
  size(500,500);
  b = loadImage("marilyn-monroe002.jpg"); 
  background(SelectedColor);
  
  smooth();
  Counter = 0;
  randomSeed(7);
  i =0;
}
void mousePressed()
{
    color cp = get(mouseX, mouseY);
    SelectedColor = cp;
    randomSeed(7);
    background(cp);
    Counter = 0;
    i = 0;
}
void draw() {
  if(Counter <100)
  {
   color c = color(red(SelectedColor)-5,
                  green(SelectedColor)-5,
                  blue(SelectedColor)-5);
  
  fill(SelectedColor); 
  noStroke();
  smooth();
  beginShape();
  int x = (int)random(-20,width+20);
  int y = (int)random(-20,height+20);
  int nRotate = (int)random(0,360);
  rotate(nRotate);
  vertex(x, y); 
      bezierVertex(x-30, y-30, x+30, y-30, x+1, y); 
      bezierVertex(x+30, y-30, x+30, y+30, x+1, y+1);
      bezierVertex(x+30, y+30, x-30, y+30, x  , y+1);
      bezierVertex(x-30, y+30, x-30, y-30, x  , y);
      
  endShape();
  rotate(-1*nRotate);
  c = color(red(SelectedColor)+30,
                  green(SelectedColor)+30,
                  blue(SelectedColor)+30);
  fill(c); 
  nRotate = (int)random(0,360);
  rotate(nRotate);
  x = (int)random(-20,width+20);
  y = (int)random(-20,height+20);
  beginShape();
  vertex(x, y); 
      bezierVertex(x-30, y-30, x+30, y-30, x+1, y); 
      bezierVertex(x+30, y-30, x+30, y+30, x+1, y+1);
      bezierVertex(x+30, y+30, x-30, y+30, x  , y+1);
      bezierVertex(x-30, y+30, x-30, y-30, x  , y);
  endShape();
  rotate(-1*nRotate);
  c = color(red(SelectedColor)-30,
                  green(SelectedColor)-30,
                  blue(SelectedColor)-30);
  fill(c); 
  beginShape();
  vertex(x, y); 
      bezierVertex(x-30, y-30, x+30, y-30, x+1, y); 
      bezierVertex(x+30, y-30, x+30, y+30, x+1, y+1);
      bezierVertex(x+30, y+30, x-30, y+30, x  , y+1);
      bezierVertex(x-30, y+30, x-30, y-30, x  , y);
  endShape();
  c = color(red(SelectedColor)-10,
                  green(SelectedColor)-10,
                  blue(SelectedColor)-10);
  fill(c); 
  x = (int)random(-20,400);
  y = (int)random(-20,800);
  beginShape();
  vertex(x, y); 
      bezierVertex(x-30, y-30, x+30, y-30, x+1, y); 
      bezierVertex(x+30, y-30, x+30, y+30, x+1, y+1);
      bezierVertex(x+30, y+30, x-30, y+30, x  , y+1);
      bezierVertex(x-30, y+30, x-30, y-30, x  , y);
  endShape();
  c = color(red(SelectedColor)+10,
                  green(SelectedColor)+10,
                  blue(SelectedColor)+10);
  fill(c); 
  x = (int)random(-20,400);
  y = (int)random(-20,800);
  beginShape();
  vertex(x, y); 
      bezierVertex(x-30, y-30, x+30, y-30, x+1, y); 
      bezierVertex(x+30, y-30, x+30, y+30, x+1, y+1);
      bezierVertex(x+30, y+30, x-30, y+30, x  , y+1);
      bezierVertex(x-30, y+30, x-30, y-30, x  , y);
  endShape();
  Counter++;
  }
 
 rotate(0); 
 
  if(Counter == 100)
  {
    i = 0;  // This should redraw picture
   
  }
   while((i<width && i < Counter*6))
   {
      int j = 0;
      while(j<height)
      {
        color c = b.get(i, j); 
        float value = red(c);  
        if(value < 100)
        {
           stroke(0);
           point(i,j);
        } 
        
        j++;
      }
    
    i++;
   }
 
 noStroke();
 fill(255,0,0);
 rect(width-10, height-10,10 , 10);
 fill(0,255,0);
 rect(width-10, height-20,10 , 10);
 fill(0,0,255);
 rect(width-10, height-30,10 , 10);
 fill(0,255,255);
 rect(width-10, height-40,10 , 10);
 fill(255,255,0);
 rect(width-10, height-50,10 , 10);
 fill(255,0,255);
 rect(width-10, height-60,10 , 10);

 
}


