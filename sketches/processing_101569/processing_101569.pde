
/*
Simple firework. This sketch made as peer assessment in Coursera course "Creative Programming for digital media and mobile apps".
Golovina Ekaterina, 23.06.2013
*/

int[][] startXY = new int[20][2];  // coordinates of centre of fireworks
int[][] fColor = new int[10][3];  // colors
int cnt = 0;                      // count of fireworks
int[] i_list = new int[20];       // number of point of firework


void setup(){
size(840,480);
background(0);
fill(0,255,0,180);
stroke(255,255,255);
strokeWeight(2);
smooth();


fColor[0][0] = 255;
fColor[0][1] = 0;
fColor[0][2] = 0;
fColor[1][0] = 0;
fColor[1][1] = 255;
fColor[1][2] = 0;
fColor[2][0] = 0;
fColor[2][1] = 0;
fColor[2][2] = 255;
fColor[3][0] = 255;
fColor[3][1] = 255;
fColor[3][2] = 0;
fColor[4][0] = 255;
fColor[4][1] = 0;
fColor[4][2] = 255;
fColor[5][0] = 0;
fColor[5][1] = 255;
fColor[5][2] = 255;
fColor[6][0] = 255;
fColor[6][1] = 128;
fColor[6][2] = 64;
fColor[7][0] = 128;
fColor[7][1] = 0;
fColor[7][2] = 255;
fColor[8][0] = 0;
fColor[8][1] = 255;
fColor[8][2] = 128;
fColor[9][0] = 255;
fColor[9][1] = 128;
fColor[9][2] = 192;


}

void draw()
{
  background(0);
  displayFirework();
}

void mousePressed()
{
   if (cnt==20) // size of array max - move all elements left
   {
    for (int jj=0;jj<19;jj++)
    {
      startXY[jj][0]=startXY[jj+1][0];
      startXY[jj][1]=startXY[jj+1][1];
      i_list[jj]=i_list[jj+1];
    }
    int f1,f2,f3;
    f1=fColor[0][0];
    f2=fColor[0][1];
    f3=fColor[0][2];
    for (int jj=0;jj<9;jj++)
    {
      fColor[jj][0]=fColor[jj+1][0];
      fColor[jj][1]=fColor[jj+1][1];
      fColor[jj][2]=fColor[jj+1][2];
    }
    fColor[9][0]=f1;
    fColor[9][1]=f2;
    fColor[9][2]=f3;
    cnt=cnt-1;
   }
 
  startXY[cnt][0]=mouseX;  // new firework
  startXY[cnt][1]=mouseY;
  i_list[cnt]=1;
  cnt=cnt+1;
  }

void displayFirework()
{
for (int j=0;j<cnt;j++)
 {
    noStroke();
    fill(color(fColor[j % 10][0], fColor[j % 10][1], fColor[j % 10][2]));
    drawEllipse(i_list[j],j);
    int c_el = 10;
    if (i_list[j]<20)
      c_el=10;
      else if (i_list[j]<100)
        c_el=10-i_list[j]/10;
        else c_el=1;
        
    for (int k=1;k<c_el;k++)
    {
     if (i_list[j]>k)
        drawEllipse(i_list[j]-k,j);
    }
    
    
    i_list[j]=i_list[j]+1;
    
 }
}

void drawEllipse(int i, int j)
{
  int rad;
  if (i<20)
    rad=20-i/3;
  else if (i<50)
    rad=16-i/10;
    else if (i<100)
       rad=18-i/10;
       else rad=8-i/100;
       
  
    ellipse(startXY[j][0]+i*0.7,startXY[j][1]+i*0.7,rad,rad);
    ellipse(startXY[j][0]-i*0.7,startXY[j][1]-i*0.7,rad,rad);
    ellipse(startXY[j][0]+i*0.7,startXY[j][1]-i*0.7,rad,rad);
    ellipse(startXY[j][0]-i*0.7,startXY[j][1]+i*0.7,rad,rad);
    
    ellipse(startXY[j][0]+i*0.866,startXY[j][1]+i*0.433,rad,rad);
    ellipse(startXY[j][0]-i*0.866,startXY[j][1]-i*0.433,rad,rad);
    ellipse(startXY[j][0]+i*0.866,startXY[j][1]-i*0.433,rad,rad);
    ellipse(startXY[j][0]-i*0.866,startXY[j][1]+i*0.433,rad,rad);
    
    ellipse(startXY[j][0]+i*0.433,startXY[j][1]+i*0.866,rad,rad);
    ellipse(startXY[j][0]-i*0.433,startXY[j][1]-i*0.866,rad,rad);
    ellipse(startXY[j][0]+i*0.433,startXY[j][1]-i*0.866,rad,rad);
    ellipse(startXY[j][0]-i*0.433,startXY[j][1]+i*0.866,rad,rad);
    
    ellipse(startXY[j][0],startXY[j][1]+i,rad,rad);
    ellipse(startXY[j][0]-i,startXY[j][1],rad,rad);
    ellipse(startXY[j][0],startXY[j][1]-i,rad,rad);
    ellipse(startXY[j][0]+i,startXY[j][1],rad,rad);
    
}


