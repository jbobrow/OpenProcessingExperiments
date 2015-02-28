
Raining[] b;
PImage rain;
PImage cloud;
PImage river;

void setup()
{
  size(500,500);
  smooth();
  stroke(0,0,250);
  fill(255);
  frameRate(30);

  rain = loadImage("raindrops.gif");
  cloud = loadImage("clouds.gif");
  river = loadImage("river.gif");
  

  b = new Raining[100];
  for(int i=0; i<100; i++)
  {
    b[i] = new Raining();
    //coordinates
    b[i].x = random(0,width);
    b[i].y = random(-height,height*2);
    //diameter
    b[i].d = (int)random(1,4);
    b[i].w = width*0.01;
    b[i].h = height*0.02;
    //velocity
    b[i].v = (int)random(1,10);
    
    
    if(i%10==0){
     b[i].r = color(150, 0, 0);
   } 
   
    
    
    
    
  }
}

void draw()
{
  background(135,206,250);
  
  image(river, 0, 0, width, height);
  
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
  image(cloud, 0, 0, width, height);
}

class Raining
{
  
  float x, y, w, h;
  int d, v, n, c, r;



  void show()
  {
    image(rain, x, y, d*w, d*h);
   
   
  
    
   
    	


}

  void move()
  {
    if (x > width)
  {
    x = 0;
  }
  
    if (x < 0)
  {
    x = width;
  }
    x += ( mouseX - width/2  ) * 0.004 * v;
    
    
    if (y > height-d*w)
  {
    y = 0;
    fill(135,206,250);
    ellipse(x, height-d*w,(d*w)*4,(d*w)*2);    
    ellipse(x, height-d*w,(d*w)*3,(d*w)*1.5);    
    ellipse(x, height-d*w,(d*w)*2,d*w);

  }  
    y += ( y + 1 ) * 0.002 * v;
  }

}


