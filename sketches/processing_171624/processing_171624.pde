
size(600, 600);
background(0);

//stroke (153, 232, 252);
//int x1=0;
//int x2=0;
//int y1=0;
//int y2=0;
//for(int i=0; i<60; i++)
//{
//  if(x1%100==0)
//    stroke (255, 93, 95);
//  else
//    stroke(153, 232, 252);
//  line(x1, 0,x2, 600);
//  x1+=10;
//  x2+=10;
//  
//  line(0, y1, 600, y2);
//  y1+=10;
//  y2+=10;
//}
stroke(255);

//right vert
int ax1 = 470;
int ay1 = 0;
int ax2 = 470;
int ay2 = 600;

for(int i=0; i<3; i++)
{
  line(ax1, ay1, ax2, ay2);
  ax1+=10;  
  ax2+=10;
}

//mid vert
int bx1=350;
int by1=0;
int bx2=350;
int by2=600;

for(int i=0; i<8; i++)
{
  line(bx1, by1, bx2, by2);
  bx1+=10;  
  bx2+=10;
}

//left vert down
int cx1=200;
int cy1=0;
int cx2=200;
int cy2=600;

for(int i=0; i<5; i++)
{
  line(cx1, cy1, cx2, cy2);
  cx1+=10;  
  cx2+=10;
}

//left right to left diag down
int dx1 = 270;
int dy1 = 0;
int dx2 = 240;
int dy2 = 30;

for(int i=0; i<3; i++)
{
  line(dx1, dy1, dx2, dy2);
  dx1+=10;  
  dy2+=10;
}

int ex1 = 200;
int ey1 = 40;
int ex2 = 0;
int ey2 = 240;

for(int i=0; i<3; i++)
{
  line(ex1, ey1, ex2, ey2);
  ey1+=10;  
  ey2+=10;
}

int fx1 = 200;
int fy1 = 100;
int fx2 = 0;
int fy2 = 300;

for(int i=0; i<3; i++)
{
  line(fx1, fy1, fx2, fy2);
  fy1+=10;  
  fy2+=10;
}

//right right to left diag down
int gx1 = 600;
int gy1 = 400;
int gx2 = 490;
int gy2 = 510;

for(int i=0; i<3; i++)
{
  line(gx1, gy1, gx2, gy2);
  gy1+=10;  
  gy2+=10;
}

int hx1 = 470;
int hy1 = 500;
int hx2 = 420;
int hy2 = 550;

for(int i=0; i<3; i++)
{
  line(hx1, hy1, hx2, hy2);
  hy1+=10;  
  hy2+=10;
}

int ix1 = 470;
int iy1 = 560;
int ix2 = 430;
int iy2 = 600;

for(int i=0; i<3; i++)
{
  line(ix1, iy1, ix2, iy2);
  iy1+=10;  
  iy2+=10;
}

int jx1 = 350;
int jy1 = 580;
int jx2 = 330;
int jy2 = 600;

for(int i=0; i<3; i++)
{
  line(jx1, jy1, jx2, jy2);
  jy1+=10;  
  jy2+=10;
}

//left left to right diag down
int kx1 = 0;
int ky1 = 130;
int kx2 = 55;
int ky2 = 185;
int kx3 = 65;
int ky3 = 195;
int kx4 = 85;
int ky4 = 215;
int kx5 = 95;
int ky5 = 225;
int kx6 = 200;
int ky6 = 330;


for(int i=0; i<5; i++)
{
  line(kx1, ky1, kx2, ky2);
  ky1+=10;
  kx2-=5;
  ky2+=5;
  
  line(kx3, ky3, kx4, ky4);
  kx3-=5;
  ky3+=5;
  kx4-=5;
  ky4+=5;
  
  line(kx5, ky5, kx6, ky6);
  kx5-=5;
  ky5+=5;
  ky6+=10; 
}

//mid left section
int lx1 = 240;
int ly1 = 360;
int lx2 = 350;
int ly2 = 470;

for(int i=0; i<5; i++)
{
  line(lx1, ly1, lx2, ly2);
  ly1 -= 10;
  ly2 -= 10;
}

int mx1 = 240;
int my1 = 420;
int mx2 = 350;
int my2 = 530;

for(int i=0; i<5; i++)
{
  line(mx1, my1, mx2, my2);
  my1 += 10;
  my2 += 10;
}

//mid right section
int nx1 = 420;
int ny1 = 490;
int nx2 = 450;
int ny2 = 520;
int nx3 = 460;
int ny3 = 530;
int nx4 = 470;
int ny4 = 540;

for(int i=0; i<5; i++)
{
  line(nx1, ny1, nx2, ny2);
  ny1-=10;
  nx2+=5;
  ny2-=5;
  
  if(i<3)
  {
    line(nx3, ny3, nx4, ny4);
    nx3+=5;
    ny3-=5;
    ny4-=10;
  }
}

int ox1 = 420;
int oy1 = 550;
int ox2 = 450;
int oy2 = 580;
int ox3 = 460;
int oy3 = 590;
int ox4 = 470;
int oy4 = 600;

for(int i=0; i<5; i++)
{
  if(i<2)
  {
    int tempx = ox1;
    int tempy = oy1;
    tempx+=10;
    tempy+=10;
    if(i==1)
    {
      tempx-=5;
      tempy-=5;
    } 
    line(tempx, tempy, ox2, oy2);
    
    line(ox3, oy3, ox4, oy4);
    ox3-=5;
    oy3+=5;
    oy4+=10;
  }  
  else
  {
    line(ox1, oy1, ox2, oy2);
  }   
  oy1+=10;
  ox2-=5;
  oy2+=5;
}

//right section
int px1 = 490;
int py1 = 570;
int px2 = 520;
int py2 = 600;

for(int i=0; i<3; i++)
{
  line(px1, py1, px2, py2);
  py1+=10;  
  py2+=10;
}

int qx1 = 490;
int qy1 = 470;
int qx2 = 510;
int qy2 = 490;
int qx3 = 520;
int qy3 = 500;
int qx4 = 600;
int qy4 = 580;

for(int i=0; i<5; i++)
{
  line(qx1, qy1, qx2, qy2);
  qx2-=5;
  qy1+=10;  
  qy2+=5;
  
  line(qx3, qy3, qx4, qy4);
  qx3-=5;
  qy3+=5;
  qy4+=10;
}

//right right to left diag up
//right section
int rx1 = 600;
int ry1 = 470;
int rx2 = 575;
int ry2 = 445;
int rx3 = 565;
int ry3 = 435;
int rx4 = 490;
int ry4 = 360;

for(int i=0; i<5; i++)
{
  line(rx1, ry1, rx2, ry2);
  ry1+=10;
  rx2-=5;
  ry2+=5;

  line(rx3, ry3, rx4, ry4);
  rx3-=5;
  ry3+=5;
  ry4+=10;
}

//right mid section
int sx1 = 470;
int sy1 = 390;
int sx2 = 420;
int sy2 = 340;

for(int i=0; i<5; i++)
{
  line(sx1, sy1, sx2, sy2);
  sy1+=10;  
  sy2+=10;
}

int tx1 = 470;
int ty1 = 330;
int tx2 = 420;
int ty2 = 280;

for(int i=0; i<5; i++)
{
  line(tx1, ty1, tx2, ty2);
  ty1-=10;  
  ty2-=10;
}

//left mid section
int ux1 = 350;
int uy1 = 320;
int ux2 = 240;
int uy2 = 210;

for(int i=0; i<5; i++)
{
  line(ux1, uy1, ux2, uy2);
  uy1+=10;  
  uy2+=10;
}

int vx1 = 350;
int vy1 = 260;
int vx2 = 240;
int vy2 = 150;

for(int i=0; i<5; i++)
{
  line(vx1, vy1, vx2, vy2);
  vy1-=10;  
  vy2-=10;
}

int xx1 = 350;
int xy1 = 120;
int xx2 = 260;
int xy2 = 30;
int xx3 = 250;
int xy3 = 20;
int xx4 = 240;
int xy4 = 10;

for(int i=0; i<5; i++)
{
  line(xx1, xy1, xx2, xy2);
  xy1+=10; 
  xx2-=5; 
  xy2+=5;
   if(i<2)
   {
      line(xx3, xy3, xx4, xy4);
      xx3-=5;
      xy3+=5; 
      xy4+=10;
   }    
}

//left section
int yx1 = 200;
int yy1 = 20;
int yx2 = 180;
int yy2 = 0;

for(int i=0; i<5; i++)
{ 
  if(i>2)
  {
     int tx = yx1 - 5;
     int ty = yy1 - 5;
     if(i==4)
     {
       tx-=5;
       ty-=5;
     }  
     line(tx, ty, yx2, yy2);
  } 
  else
  {
     line(yx1, yy1, yx2, yy2);
  } 
  yy1+=10;
  yx2-=10;
}  

int zx1 = 200;
int zy1 = 160;
int zx2 = 180;
int zy2 = 140;
int zx3 = 170;
int zy3 = 130;
int zx4 = 150;
int zy4 = 110;
int zx5 = 140;
int zy5 = 100;
int zx6 = 40;
int zy6 = 0;

for(int i=0; i<5; i++)
{
  if(i<4)
  {
    line(zx1, zy1, zx2, zy2);
    zy1-=10;
    zx2+=5;
    zy2-=5;
  } 
  
  line(zx3, zy3, zx4, zy4);
  zx3+=5;
  zy3-=5;
  zx4+=5;
  zy4-=5;
  
  line(zx5, zy5, zx6, zy6);
  zx5+=5;
  zy5-=5;
  zy6-=10;
}

int aax1 = 200;
int aay1 = 260;
int aax2 = 130;
int aay2 = 190;
int aax3 = 120;
int aay3 = 180;
int aax4 = 100;
int aay4 = 160;
int aax5 = 90;
int aay5 = 150;
int aax6 = 0;
int aay6 = 50;

for(int i=0; i<5; i++)
{
  line(aax1, aay1, aax2, aay2);
  aay1-=10;
  aax2+=5;
  aay2-=5;
  
  line(aax3, aay3, aax4, aay4);
  aax3+=5;
  aay3-=5;
  aax4+=5;
  aay4-=5;
  
  line(aax5, aay5, aax6, aay6);
  aax5+=5;
  aay5-=5;
  aay6-=10;
}







