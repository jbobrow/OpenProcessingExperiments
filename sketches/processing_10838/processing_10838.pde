
PImage photo;
PImage photoBorder; // photo with border
int[][] dMap = new int[1000][800];// depth map 
int ix,iy;
int xOff,xOff2,yOff;
int depth;
int r=40; // brush radius
int oldX,oldY;
boolean d=false;

void setup()
{
  size(640,480,P2D);
  frameRate(60);
  for (ix=0;ix<1000;ix++){for(iy=0;iy<800;iy++){dMap[ix][iy]=128;}}
  photo = loadImage("girldog.jpg");
  photoBorder = createImage(width+60,height+60,RGB);
  photoBorder.copy(photo, 0, 0, photo.width, photo.height, 30, 30, width, height);
}

void draw()
{
  if (mousePressed)
  {
    // paint depth 
    
    if (sqrt(sq(oldX-mouseX)+sq(oldY-mouseY))>(r/10))
    {
      for (iy=-r;iy<r;iy++)
      {
        yOff= mouseY+100+iy;
        int rx=round(sqrt(sq(r)-sq(iy)));
        
        for (ix=-rx;ix<rx;ix++)
        {
          xOff=mouseX+100+ix;
          if ((mouseButton==LEFT)&&(dMap[xOff][yOff]<250)) dMap[xOff][yOff]+=2;
          if ((mouseButton==RIGHT)&&(dMap[xOff][yOff]>5)) dMap[xOff][yOff]-=2;
        }
      }
      oldX=mouseX;
      oldY=mouseY;
    }
  }
  
  loadPixels();
  photoBorder.loadPixels();
  
  if(!d)
  {
    // draw image
    
    for (iy=0;iy<height;iy++)
    {
      int xOff = iy*width;
      int xOff2 = (iy+30)*photoBorder.width;
      for (ix=0;ix<width;ix++)
      {
        depth=(dMap[ix+100][iy+100]-150)/16;
        pixels[xOff+ix]= photoBorder.pixels[xOff2+ix+30-depth] & 0xff0000 | photoBorder.pixels[xOff2+ix+30+depth] & 0x00ffff;
      }
    }
  }
  else
  {
    // draw depth map
    
    for (iy=0;iy<height;iy++)
    {
      int xOff = iy*width;
      int xOff2 = (iy+100)*(width+200);
      for (ix=0;ix<width;ix++)
      {
        pixels[xOff+ix]= color(dMap[ix+100][iy+100]);
      }
    }
  }
  noFill();
  stroke(0,0,0,128);
  ellipse(mouseX,mouseY,r*2,r*2);
}

void keyPressed() 
{
  if (key=='z') r=max(8,r-2);
  if (key=='x') r=min(90,r+2);
  if (key=='d') d=!d;
  if (key=='r') 
  {
    for (ix=0;ix<1000;ix++){for(iy=0;iy<800;iy++){dMap[ix][iy]=128;}}
  } 
}

