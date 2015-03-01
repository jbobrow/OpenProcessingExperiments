
int num=20;

int [] sq_X=new int[num];
int [] sq_Y=new int[num];
int [][] sq_Z=new int[num][num];

void setup()
{
  size(500, 500);
  
  for( int k=0; k< num; k++)
  {
    sq_X[k]=(int)random(0, width/2);
    sq_Y[k]=(int)random(0, height/2);
    
    
  }
  
  for(int l=0; l<num; l++)
  {
    for(int m=0; m<num; m++)
    {
     sq_Z[l][m]=sq_X[l]*sq_Y[m]; 
    }
    
  }
  
  
}

void draw()
{
  background(150);
  
  for(int n=0; n<num; n++)
  {
    for(int o=0; o<num; o++)
    {
      fill(random(255),sq_X[n], sq_Y[o]);
      ellipse(sq_Z[n][o],sq_Z[n][o],sq_Z[n][o],sq_Y[o]);
    }
    
  }
  
}


