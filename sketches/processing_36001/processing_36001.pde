
int amountlines = 150;

//array list//
float[] pointsX = new float[1000];
float[] pointsY = new float[1000];
float[] x = new float[1000];
float[] y = new float[1000];
/////////////

void setup()
{
 size(700,400);
  smooth();

  for (int a = 0; a < amountlines; a++) {
    pointsX[a] = random(0, 700);         
    pointsY[a] = random(0, 400);         
    x[a] = pointsX[a];                    
    y[a] = pointsY[a]; 
  }
}

void draw()
{
  float pull = 1;
  background(0);
  
  for (int a = 0; a < 1000-1; a++)
  {
    fill(255,80);
    ellipse(x[a],y[a],5,5);
 ////// 
   if (mouseButton == LEFT)
    {
      if(x[a] < mouseX){
      x[a] += pull;
    }
    else if(x[a] > mouseX){
    x[a] -= pull;
  }
 if (y[a] < mouseY){
 y[a] += pull;
 }
else if (y[a] > mouseY){
 y[a] -= pull;
} 
  }
    
    if (mouseButton == RIGHT)
    {
     if(x[a] > mouseX){
      x[a] += pull;
    }
    else if(x[a] < mouseX){
    x[a] -= pull;
  }
 if (y[a] > mouseY){
 y[a] += pull;
 }
else if (y[a] < mouseY){
 y[a] -= pull;
} 
    }
  
 //   if(x[a] > width) {
   //   x[a] = 0;
   // }
  //
  stroke(255,50);
   for (int b = a; b < amountlines; b++) {
      if (dist(x[b], y[b], x[a], y[a]) < 80) {
        line(x[b], y[b], x[a], y[a]);
      }
    }
  
  }  
  

}

