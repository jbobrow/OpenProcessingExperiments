
int drawmode = 1; // 0 = 2d, 1 = 1d slice

int W = 800;
int H = 800;
int WW = W;
int WH = H;
float[][] world = new float[W][H];
float[][] worldx = new float[W][H];
int i, j;
float n;

int ii = 0;
int iii;

void setup()
{
  if(drawmode == 1) WH /= 2;
  size(800,800);
  background(255);
  stroke(0);
  
  for(i = 0; i < W; i++)
    for(j = 0; j < H; j++)
      world[i][j] = 0;
  world[W/2][H/2] = 1;
}

void draw()
{
  //for(iii = 0; iii < 10; iii++){
  ii++;
  
  for(i = 0; i < W; i++){
    for(j = 0; j < H; j++){
      n = world[i][j];
      if(i > 0) n += world[i-1][j]; else n += world[W-1][j];
      if(j > 0) n += world[i][j-1]; else n += world[i][H-1];
      if(i < W-1) n += world[i+1][j]; else n += world[0][j];
      if(j < H-1) n += world[i][j+1]; else n += world[i][0];
         
       n /= 5;
       
       n = sin(n*6.2831);
       //n = tan(n/10);
       
       if(n > 1) n = 1;
       if(n < 0) n = 0;
       worldx[i][j] = n;
       
       stroke((int)(255*(1-n)));
       
       if(drawmode ==1){ if(j == H/2 && ii < WH) point(i,ii); }
       else point(i,j);
    }
  }
  
  for(i = 0; i < W; i++)
    for(j = 0; j < H; j++)
      world[i][j] = worldx[i][j];
  //}
}

