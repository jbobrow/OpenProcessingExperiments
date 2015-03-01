
float noiseScale=0.02;
float x = 0;
float y = 0;

PVector[] blobs   = new PVector[7];
PVector[] blobsxy = new PVector[7];
float[]   m = new float[7];
float[]   h = new float[7];
float step1 = 0;
float step2 = 0;

void setup()
{
  rectMode(CENTER);
  size(854, 480);
  background(0);
  smooth();
  fill(0);
  noStroke();
  strokeJoin(ROUND);
  frameRate(30);
  for (int idx=0; idx < blobs.length; idx++)
  {
    blobs[idx]   = new PVector(random(180), random(180));
    blobsxy[idx] = new PVector(0, 0);
  }
}

void draw()
{
  step1 = step1 + .01;
  step2 = step2 + .005;
  noStroke();
  background(0);
  translate(width/2, height/2);

  for (int x=-width/2; x<width/2; x+=6)
  {
    for (int y=-height/2; y<height/2; y+=6)
    {
      float result = 0;
      float posx = 0;
      float posy = 0;
      for (int idx=0; idx < blobs.length; idx++)
      {     
        float st = 0;
        if (idx%2 == 0)
        {
          st = step1;
        }
        else
        {
          st = step2;
        }
        float cx = blobs[idx].x + st;
        float cy = blobs[idx].y + st;
        posx = -600 + noise(cx) * 1200;
        posy = -300 + noise(cy) * 600;
        blobsxy[idx].x = posx;
        blobsxy[idx].y = posy;
        m[idx] = mag(x - posx, y - posy);
        h[idx] = 0;

        float ra = 110;
        if (m[idx] < ra)
        {
          h[idx] = pow(m[idx]-ra, 2);
        }
        result += h[idx];
      }

      result /=30;

      if (result > 255)
      {
        result = 255;
      }

      fill (0, result/2, result, result);

      if ((result > 0) && (mousePressed))
      {
        //pushMatrix();
        //translate(x,y);
        //rotate(result*PI/120);
        //translate(-x,-y);
        rect(x, y, 6, 6);
        //popMatrix();
      }

      if (result > 254)
      {
        fill(255, 100);
        rect(x, y, 4, 4);
      }
    }
  }
  if (!mousePressed) 
  {
    fill(255);
    for (int idx1=0; idx1 < blobsxy.length; idx1++)
    {
      rect(blobsxy[idx1].x, blobsxy[idx1].y,12,2);
      rect(blobsxy[idx1].x, blobsxy[idx1].y,2,12);
    }
  }
  //for (int idx1=0; idx1 < blobsxy.length; idx1++)
  //{
    //rect(blobsxy[idx1].x, blobsxy[idx1].y,12,2);
    //rect(blobsxy[idx1].x, blobsxy[idx1].y,2,12);
    //for (int idx2=idx1; idx2 < blobsxy.length; idx2++)
    //{   
      //line (blobsxy[idx1].x, blobsxy[idx1].y, 
      //      blobsxy[idx2].x, blobsxy[idx2].y);
    //}
  //}
}


