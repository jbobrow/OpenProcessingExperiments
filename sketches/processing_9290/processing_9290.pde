
import processing.opengl.*;

PImage img;
ArrayList points = new ArrayList();

float rotationY = 0;
float rotationX = 0;
float hgt=0;

void setup()
{
  //size (800,800,OPENGL);
  size (800,800,P3D);
  colorMode(HSB,100);
  background(0);
  smooth();
  
  img=loadImage("clouds.jpg");
  img.loadPixels();
  println(img.width+" "+img.height);
  
  for (int x = 0 ; x<img.width ; x+=2)
  {
    for (int y = 0 ; y<img.height ; y+=2)
    {
      float xx=x-img.width/2;
      float yy=y-img.height/2;
      float zz = 3*brightness(img.get(x,y));
      points.add(new PVector(xx,yy,zz));
    }
  }
  
  
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  image(img,width/4,height/4,width/4,height/4);  

  rotateY(rotationY);
  rotateX(rotationX);


  for (int i = 0 ; i<points.size() ; i++)
  {

    PVector p = (PVector) points.get(i);
    stroke(p.z/3);
    point(p.x,p.y,p.z*cos(hgt));

  }

  hgt+=.01;
  if(hgt>PI/2) hgt=-PI/2;

}

void mouseDragged()
{
  rotationY+= map(mouseX-pmouseX,0,100,0,2);
  rotationX+= map(mouseY-pmouseY,0,100,0,2);
  
}

void keyPressed()
{
  if (key=='1')
  {
    clear();
    
    img=loadImage("clouds.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
  
  if (key=='2')
  {
    clear();
    
    img=loadImage("bars.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
  
  if (key=='3')
  {
    clear();
    
    img=loadImage("fibers.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
  
  if (key=='4')
  {
    clear();
    
    img=loadImage("frames.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
  
  if (key=='5')
  {
    clear();
    
    img=loadImage("zebra.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
  
  if (key=='6')
  {
    clear();
    
    img=loadImage("zebra smooth.jpg");
    
    println(img.width+" "+img.height);
  
    for (int x = 0 ; x<img.width ; x+=2)
    {
      for (int y = 0 ; y<img.height ; y+=2)
      {
        float xx=x-img.width/2;
        float yy=y-img.height/2;
        float zz = 3*brightness(img.get(x,y));
        points.add(new PVector(xx,yy,zz));
      }
    }
  }
}

void clear()
{
  for (int i = points.size() - 1 ; i >= 0 ; i--)
  {
    points.remove(i);
  }
  println(points.size());
}

