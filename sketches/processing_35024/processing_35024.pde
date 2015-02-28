
class Bifur
{
  float[][] conc; //2d array of concentration 
  float[][] delt; //2d array of delta concentration


  Bifur()
  {
    this.conc = new float[width][height];
    this.delt = new float[width][height];
    this.Reset();
  }


  void Reset()
  {
    for(int i = 0; i < width; i++)
    {
      for(int j = 0 ; j < height ;j++)
      {
        this.conc[i][j] = random(1);
      }
    }
  }


  void Diffusion()
  {
    for(int i = 0 ; i < width; i++)
    {
      for(int j = 0 ; j < height; j++)
      {
        this.Diffuse(i,j);
      }
    }
  }


  void Diffuse(int x, int y)
  {
    for(int i = x-1 ; i < x+2; i++)
    {
      for(int j = y-1 ; j < y+2; j++)
      {
        if(i != x || j != y)
        {
          this.delt[x][y] += this.conc[(i+width) % width][(j + height) % height] - this.conc[x][y]; //sum delta
        }
      }
    }
    this.delt[x][y] /= 8; //average delta
  }


  void Update(float timeStep, float rDif, float rBif)
  {
    for(int i = 0 ; i < width; i++)
    {
      for(int j = 0 ; j < height; j++)
      {
        this.conc[i][j] += this.delt[i][j] * rDif * timeStep; //add delta

        if(this.conc[i][j] > 0.5)
        {
          this.conc[i][j] += (1-this.conc[i][j]) * rBif * timeStep; //positive bifurcation
        }
        else if( this.conc[i][j] < 0.5)
        {
          this.conc[i][j] += (0-this.conc[i][j]) * rBif * timeStep; //negative bifurcatation
        }

        this.delt[i][j] = 0; //reset delta
      }
    }
  }


  void Draw(color c0, color c1, color c2)
  {
    loadPixels();

    for(int i = 0 ; i < width; i++)
    {
      for(int j = 0 ; j < height; j++)
      {       
        if(this.conc[i][j] > 0.5)
        {
          pixels[i + j * width] = lerpColor(c0, c1, this.conc[i][j] * 100 % 1); 
        }  
        else
        {
         pixels[i+j*width] = lerpColor(c1, c2, this.conc[i][j] * 100 % 1); 
        }
      }
    }

    updatePixels();
  }

}





