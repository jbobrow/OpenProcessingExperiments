
void setup() {
  size(sx, sy);
  background(255);
  smooth();
  mmimg = loadImage("mm.png");
  //noStroke();
  leftp = 0;
  rightp = 1;
}

PImage mmimg;
static int sx = 640, sy = 480;
float x=sx/6, y=sy/2;
float sep = 52.0;

float leftp, rightp;
float omega;
PVector orient;
float vel;
float len;

float maxs = 1;
float t = 0;
float tt = 0;
float[] tx = new float[100];
float[] ty = new float[100];
void draw(){
  background(255);
  if(frameCount % 5 == 0)
  for(int i = 0; i < 99; i++)
  {    
    tx[i] = tx[i+1];
    ty[i] = ty[i+1];    
  }
  tx[99] = x;
  ty[99] = y;  
  if(frameCount % 1 == 0)
  {
    int c = 55;
    for(int i = 0; i < 99; i++)
    {
      if(tx[i] == 0 || ty[i] == 0 || tx[i+1] == 0 || ty[i+1] == 0)
        break;
      strokeWeight(4);
    stroke(c/4, c/6, c);
    c += 2;
    line(tx[i], ty[i], tx[i+1], ty[i+1]);
    stroke(0);
    strokeWeight(1);
    }
    
    t += .01;
    //if(sin(t)>0)
    //leftp = sin(t) + 1;
    //rightp = -cos(t);    
    omega += ((rightp-leftp)/sep);
    vel = (rightp+leftp)/2.0;
    float rlen = (sep/2.0) * ((rightp + leftp)/(rightp - leftp));
    
    float nx = -sin(omega);
    float ny = -cos(omega);
        float scal = 1;
    float hsize = 32 * scal;
    len = (nx * nx) + (ny * ny);
    nx /= len;
    ny /= len;
    float nx2 = -ny;
    float ny2 = nx;
    x += nx*(vel * scal);
    y += ny*(vel * scal);    
    pushMatrix();
    translate(x, y);
    rotate(-omega - PI);
    scale(scal); 
    strokeWeight(1);
    //ellipse(0, 0, 100, 100);
    image(mmimg, -32, -32);
    float spread = .075;    
    float range = 100;
    fill(255);
    ellipse(0 + (sin(.707) * ((range + 32) * scal)), 0 + (cos(.707) * ((range + 32) * scal)), 10, 10);
    if((y + (-cos(omega + .707) * ((range + hsize)*scal))<0) || (y + (-cos(omega + .707) * ((range+hsize)*scal))>sy) || (x + (-sin(omega + .707) * ((range + hsize)*scal))<0) || (x + (-sin(omega + .707) * ((range+hsize)*scal))>sx))
    //if((x + (((-sin(omega + .707)*(range + 32))))*scal) < 0 || (y + (((-sin(radians(45)) * (range + 32))))*scal) > sy || (x + (((-cos(radians(45)) * (range + 32))))*scal) < 0 || (x + (((-cos(radians(45)) * (range + 32))))*scal) > sx)
    {
        fill(255, 0, 0);
        leftp = 5;    
    }
    else
       leftp = .85;
    triangle(0, 32, -((range * spread)/2), 32+range, ((range * spread)/2), 32+range);
    fill(255);
    rotate(radians(45));    
    triangle(0, 32, -((range * spread)/2), 32+range, ((range * spread)/2), 32+range);
    rotate(-radians(90));
    triangle(0, 32, -((range * spread)/2), 32+range, ((range * spread)/2), 32+range);
    //triangle(32*.707, 32*.707, 384*.760, 384*.654, 384*.654, 384*.760);
    //triangle(-32*.707, 32*.707, 384*-.760, 384*.654, 384*-.654, 384*.760);
    //strokeWeight(4);
    //line(-50, 0, 50, 0);
    //line(0, 0, 0, -50);    
    popMatrix();        
    //ellipse(x + (-sin(omega +.707) * ((range + 32) * scal)), y + (-cos(omega + .707) * ((range + 32) * scal)), 10, 10);
    print("X: " + x + (nx * (range+32)) + ", Y: " + ((y/scal) + (ny * (range+32))) + "\r\n");
    //if(x < 0)
    //x = sx;
    //if(x > sx)
    //x = 0;
    //if(y<0)
    //y = sy;
    //if(y > sy)
    //y = 0;         
  }
}

