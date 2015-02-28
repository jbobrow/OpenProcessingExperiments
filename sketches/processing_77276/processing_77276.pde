








float[] x;
float[] y;
float tempx, tempy;
float vx, vy;
float freq;



void setup()

{

  size(900, 600);
  segment_count = 0;

  x = new float[5];
  y = new float[5];

 
  for (int i = 0; i < x.length;i++)
  {
    x[i] = width/1.01;
    y[i] = height/2;
  }
  tempx = width/1.01;
  tempy = height/2;



  vx = random(-1, 1);
  vy = random(-1, 1);




  noiseSeed(   int(random(500))   );
    
    int number=int(random(0,1000));
  
  

  
  freq = .01;
  background(255);

}
void draw()
{
  

  


  //right--------
  if (tempx>width) 
  {
    tempx=width;
    vx*=-1;
  }

  //left---------
  if (tempx<0)
  {
    vx*=-1;
    tempx=0;
  }

  //bottom-----------
  if (tempy>height)
  {

    tempy=height;
    vy*=-1;
  }
  //top------------
  if (tempy<0)
  {
    vy*=-1;
    tempy=0;
  }








    
    



  tempx+=vx;
  tempy+=vy;
  x[4] = tempx;
  y[4] = tempy;

  for (int i = 0 ;i < x.length-1;i++)
  {
    x[i] = x[i+1];
    y[i] = y[i+1] ;

  }
 
  vx=noise(tempx*freq, tempy*freq, frameCount*freq)*2-1.1;
  vy=noise(tempy*freq, tempx*freq, frameCount*freq)*2-1;

  stroke(250, 100);

 
pushMatrix();
translate(1,250);
  float i = frameCount*.8;
  stroke(noise(i*.03)*50,noise(i*0.9)*80);
  strokeWeight(noise(i*.3));



  ellipse(x[0],y[0],random(100,101) ,random(100,101) );


popMatrix();
 





}




