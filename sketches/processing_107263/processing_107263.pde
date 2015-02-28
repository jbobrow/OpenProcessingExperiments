
// notte
// by azathoth 2013

int min_dist = 20;
int max_val = 255;

float divisor;
color carpet_color;

float t;

ArrayList coords;

void setup()
{
  size(512, 512);
  frameRate(25);
  colorMode(HSB, max_val);
  smooth();
  carpet_color = color(random(1,max_val),random(1,max_val),random(1,max_val));
  divisor = 1;
  
  t = 0;
  
  background(0);
  //smooth();
  
  coords = new ArrayList();
}

void mousePressed()
{
  //int t0 = millis();
  setup();
  carpet_init();
  //println(millis()-t0);
}


boolean paused = false;
void keyPressed()
{
  if(key==' ')
  {
    if(paused)
      loop();
    else
      noLoop();
    
    paused = !paused;
  }
}

float scale_factor;
void draw()
{
  t += 1.0/frameRate;
  
  //float alpha = t*0.4;
  float alpha = int(random(4))*PI/2 + t*0.4;
  
  /*
  float mx = 2.0*float(mouseX)/width -1.0;
  float my = 2.0*float(mouseY)/height -1.0;
  float alpha = int(random(4))*PI/2 + t*0.4*(sqrt(mx*mx+my*my));
  //*/
  
  /*
  float mx = 2.0*float(mouseX)/width -1.0;
  float my = 2.0*float(mouseY)/height -1.0;
  float alpha = atan2(my,mx);
  //*/
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(alpha);
  //scale_factor = 0.75 + 0.5*sin(t);
  //scale_factor = 0.4/(0.2+6.0*cos(t*0.2)*cos(t*0.2));
  scale_factor = cos(t*0.2)*cos(t*0.2);
  scale(scale_factor,scale_factor);
  translate(-width/2, -height/2);
  
  
  
  if(coords.size()==0)
  {
    //background(0);
    carpet_init();
  }
  ArrayList old_coords = coords;
  coords = new ArrayList();
  for(int i=0; i<old_coords.size(); i++)
  {
    int[] p = (int[])old_coords.get(i);
    carpet_cross(p[0],p[1], p[2],p[3]);
  }
  //println(frameRate);
  
  popMatrix();
}

void carpet_init()
{
  float variability = 0.0001;
  carpet_color = color(
                        (hue(carpet_color)+variability*random(0,255))%max_val,
                        (saturation(carpet_color)+variability*random(0,255))%max_val,
                        (brightness(carpet_color)+variability*random(0,255))%max_val
                       );
  divisor += random(-2,2);
  if(divisor<1) divisor=1;
  if(divisor>16) divisor=16;
  stroke(carpet_color);
  
  int x0 = 0;
  int y0 = 0;
  int x1 = width-1;
  int y1 = height-1;
  
  line(x0,y0, x0,y1);
  line(x0,y1, x1,y1);
  line(x1,y1, x1,y0);
  line(x1,y0, x0,y0);
  
  add_cross(x0,x1, y0,y1);
}

void add_cross(int x0, int x1, int y0, int y1)
{
  int[] p = new int[4];
  p[0] = x0;
  p[1] = x1;
  p[2] = y0;
  p[3] = y1;
  coords.add(p);
  //carpet_cross(x0, x1, y0, y1);
}

void carpet_cross(int x0, int x1, int y0, int y1)
{
  int xM = (x0+x1)/2;
  int yM = (y0+y1)/2;
  
  color c = floor((get(x0,y0) + get(x1,y1) + get(x0,y1) + get(x1,y0))/divisor);
  c = color(hue(c), saturation(c)*2, brightness(c));
  
  stroke(c);
  
  line(x0+1, yM, x1-1, yM);
  line(xM, y0+1, xM, y1-1);
  
  stroke(0);
  fill(0,0,0, 75); //60
  quad( x0+1,y0+1,
        x0+1,yM-1,
        xM-1,yM-1,
        xM-1,y0+1
        );
  stroke(c);
  
  if( x1-x0>min_dist && y1-y0>min_dist)
  {
    add_cross(x0,xM, y0,yM);
    add_cross(x0,xM, yM,y1);
    add_cross(xM,x1, y0,yM);
    add_cross(xM,x1, yM,y1);
  }
}

