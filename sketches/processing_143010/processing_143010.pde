
// HW #8
// eunki chung
 
final int count = 100;
float [ ] xVals = new float [count];
float [ ] yVals = new float [count];
float [ ] dim = new float [count];
color [ ] figColor = new color [count];
float [ ] deltaX = new float [count];
float [ ] deltaY = new float [count];
float [ ] figDirection = new float [count];
float [ ] deltaDir = new float [count];
float fade;


void setup ()
{
  size (600, 400);
  fade = 255;
  
  for (int i = 0; i<xVals.length; i++) {
    xVals[i] = width/50;
    yVals[i] = height/50;
 
    figColor[i] = color(random(180, 255), random(100, 200), random(100, 200));
 
    deltaX[i] = random(1, 2);
    deltaY[i] = random(1, 2);
 
    dim[i] = random (0.8, 4);
    figDirection[i] = 0;
    deltaDir[i] = random(10, 30);
  }
   
}
void draw()
{
  background (28, 108, 147);
  
  fill (0,0,0,fade);
  rectMode(CORNER);
  rect(0,0,width,height);  
  
  if(fade <= 255 && fade > 0){
    fade -= 1;
  } else {
    fade = 0;
  }
  
  drawStar();
  moveStar();
}

void drawStar()
{
  for ( int i=0; i<xVals.length; i++ )
  {
    star(i);
  }
}

void star(int index)
{
  float x= xVals [index];
  float y= yVals [index];
  float d= dim [index];
 
  stroke(figColor [index], 50);
  fill(figColor [index], 100);
  beginShape();
  vertex(x, y-10*d);
  vertex(x+3*d, y-4*d);
  vertex(x+9*d, y-3*d);
  vertex(x+4*d, y+d);
  vertex(x+6*d, y+8*d);
  vertex(x, y+5*d);
  vertex(x-6*d, y+8*d);
  vertex(x-5*d, y+d);
  vertex(x-10*d, y-3*d);
  vertex(x-3*d, y-4*d);
  endShape(CLOSE);
  
}
 
void moveStar()
{
  for ( int i=0; i<xVals.length; i++ )
  {
    xVals [i] = xVals [i] + deltaX [i];
    yVals [i] = yVals [i] + deltaY [i];
 
    if ( xVals [i] < 0 || xVals [i] > width - dim [i]  )
    {
      deltaX [i] = - deltaX [i];
      deltaY [i] =  deltaY [i];
       
    }
    if ( yVals [i] < 0 || yVals [i] > height - dim [i] )
    {
      deltaY [i] = - deltaY [i];
      deltaX [i] =  deltaX [i];
    }
  }
}
 

void keyPressed(){
  if(key == ' '){
    setup();
  }else{
    exit();
  }
}


