
class Line
{
  float x,y,z;
  float rx,ry,rz;
  float speed;
  float rspeed;
  PImage p;
  color col;
  float f1,f2,f3,f4,f5,f6;
  float c1,c2,c3;
  float size;
  int cap;
  float exist;
  int life;
  float vx,vy;

  Line()
  {
    life = (int)random(50,70);
    exist = 0;
    size = random(400,500);
    f1 = random(100);
    f2 = random(100);
    f3 = random(100);
    f4 = random(100);
    f5 = random(100);
    f6 = random(100);
    x = random(width*2);
    y = random(height*2);
    vx = random(-1,1);
    vy = random(-1,1);
    
    z = 0;
    rx = 0;
    ry = 0;
    rz = 0;

    p = new PImage(1,(int)random(100,300));
    colorMode(HSB);
    for(int i=0;i<p.pixels.length;i++)
    {
      p.pixels[i] = color(noise((millis()+i)*0.01)*255,255,255);
    }
    
    
    speed=0.00001;
    rspeed = random(0.01,0.1);
    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
    col = color(c1,c2,c3,40*exist);
  }

  void update()
  {
    if(exist<1)
      exist+=0.001;
    col = color(c1,c2,c3,40*exist);
    
    vx = (noise(frameCount*speed+f1)-0.5)*5;
    vy = (noise(frameCount*speed+f2)-0.5)*5;
    
    //vx+=(width-x)*0.001;
    //vy+=(height-y)*0.001;
    
    x+=vx;
    y+=vy;
    z+=(noise(frameCount*speed+f3)-0.5)*5;
    
    rx+=(noise(frameCount*speed+f4)-0.5)  *rspeed;
    ry+=(noise(frameCount*speed+f5)-0.5)  *rspeed;  
    rz+=(noise(frameCount*speed+f6)-0.5)  *rspeed; 
    
    pl.add(new LineParticle(x,y,z,rx,ry,rz,life,size,p,col));
  }

  void render()
  {
    pushMatrix();
    translate(x,y,z);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    tint(col);
    image(p,0,0,5,size);
    popMatrix();
  }
}

