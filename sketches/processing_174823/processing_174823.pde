
int screenW = 800;
int screenH = 800;
float[] realx = {200.0,400.0,600.0};
float[] prevrealx = {200,400,600};
float[] realy = {300.0,300.0,300.0};
float[] prevrealy = {300,300,300};
int[] x = {200,400,600};
int[] y = {300,300,300};
int[] prevx = {200,400,600};
int[] prevy = {300,300,300};
color[] col = {0,0,0};
float[] dirx = {2.0,-2.0,1.0};
float[] diry = {2.0,-2.0,1.0};
float[] accx = {1.0,0.0,-1.0};
float[] accy = {1.0,0.0,-1.0};
int[] dur = {4,3,2};
int t = 0;
color back = 255;
int trans =50;
 
void setup(){
  size(800,600);
  smooth();
  background(255); }
 
void draw(){
  if(t % 15 == 0)
  {
    fill(back,10);
    rect(0,0,screenW,screenH);
  }
   
  if(mousePressed)
  {
      for(int n = 0; n < 3; n++)
      {
        realx[n] = mouseX+trans;
        realy[n] = mouseY+trans;
      }
      return;
  }
  if(keyPressed && key == 'x')
  {
      if(back == 0)
      {
        back = 255;
      }
      else
      {
        back = 0;
      }
  }
   
  t = 100 + ((t + 1 + 255) % 255);
   
  for(int n = 0; n < 3; n++)
  {
   
    {
      dirx[n] += accx[n];
      diry[n] += accy[n];
    }

    {
      dirx[n] *= 0.9;
      diry[n] *= 0.9;
    }
    realx[n] = (screenW + realx[n] + dirx[n]) % screenW;
    realy[n] = (screenH + realy[n] + diry[n]) % screenH;
    x[n] = (int)realx[n];
    y[n] = (int)realy[n];
    dur[n] -= 1;
     
     
    println("accx[0]= " + accx[n] + "accx[1] = " + accx[1] + "accx[2] = " + accx[2]);
     
    switch(n) 
 
    { 
    }
    fill(col[n],255);
    int distance = (int)(sqrt(pow((x[n] - x[(n+1)%3]),2) + pow((y[n] - y[(n+1)%3]),2)));
    if(distance < 318)
    {
   
      {
        int alph = 255 - (int)(distance*0.8);
     
          fill(0,0,0,alph);

          fill(255,255,255,alph);
        quad(x[n]-trans,y[n]-trans,x[(n+1)%3]-trans,y[(n+1)%3]-trans,prevx[(n+1)%3]-trans,prevy[(n+1)%3]-trans,prevx[n]-trans,prevy[n]-trans);
      }
    }
  
  }
}

