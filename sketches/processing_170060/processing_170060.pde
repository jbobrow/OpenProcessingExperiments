
class block
{

    float x, y;
    
    float w=20;
    float h=20;
    int idx =0;
    int idy=0;
    
    public block(float ix, float iy, int iidx, int iidy, float bsize)
    {
        x = ix;
        y = iy;
        idx = iidx;
        idy = iidy;
        h = bsize;
        w = bsize;
    }

    void tick(t)
    {
    
        float rw=0;
        float rh=0;
    
        float to = t + y/20;
    
        if(idx % 2 == 0)
        {
            if(idy %2 == 0)
            {
                rw = sin(to )*w;
                rh = cos(to )*h;        
            }
            else
            {
                rw = cos(to )*w;
                rh = sin(to )*h;        
            }

        }
        else
        {
            if(idy %2 == 0)
            {
                rw = cos(to )*w;
                rh = sin(to )*h;        
            }
            else
            {
                rw = sin(to )*w;
                rh = cos(to )*h;        
            }      
        }

    
        fill(0);
        rect(
            x-(rw/2), 
            y-(rh/2),
            rw, 
            rh
         );
    }
}

int timer = 0;

int blocksize = 64;

var blocks = Array();

void setup() {  //setup function called initially, only once

  size(512, 512);
  background(255);  //set background white
  smooth();
  for(int xp = 0; xp < width/blocksize; xp++)
  {
      for(int yp = 0; yp < height/blocksize; yp++)
      {
          blocks.push(new block(xp*blocksize, yp*blocksize, xp, yp, blocksize));
      }
  }
}

void draw() {  //draw function loops 
  timer+=0.026;
  background(255);
  pushMatrix();
  translate(blocksize/2, blocksize/2);
  for(var b : blocks)
  {
      b.tick(timer);
  }
  popMatrix();
}
