
/*
* Creative Coding
*Solar_System
*by Mike Smith
*Copyright (c) 2014
*
*This generates Solar Systems based on an image
*
*/

PImage myImg;
color[] pixelColors;

// Parameters of Sun and eight Planets
int num = 9;
float[] dist = new float [num];
float[] angle = new float [num];
float[] speed = new float [num];
float[] size = new float [num];
float[] distInc = new float [num];
boolean[] moon = new boolean [num];
float[] distmoon = new float [num];
float[] anglemoon = new float [num];
float[] speedmoon = new float [num];

void setup()
{
  size(800, 800);
  myImg = loadImage("Dahlia.jpg");
  pixelColors = new color[num];
  smooth();
  //initial state of Solar System
  dist[0] = 0; // Sun
  angle[0] = 0;
  speed[0] = 0;
  size[0] = 20;
  distInc[0] = 0;
  //int x = int(random(800));
  //int y = int(random(800));
  pixelColors[0] = myImg.get(int(random(width/2)), int(random(width/2)));
  for(int i = 1; i < num; i++) {
    dist[i] = random(350) + 50;
    angle[i] = radians(random(360));
    speed[i] = radians(random(2));
    size[i] = 0; // this will be varied by accretion of pixels
    distInc[i] = 0;
    if(int(random(4)) == 2) {
      moon[i] = true;
      distmoon[i] = random(10, 50);
      anglemoon[i] = radians(random(360));
      speedmoon[i] = radians(random(2));
    }
    pixelColors[i] = myImg.get(int(width/2 + dist[i]*sin(angle[i])),
                               int(height/2 + dist[i]*cos(angle[i])));
  }
}

void draw()
{
  background(0);
  noStroke();
  // draw Sun 
  fill(pixelColors[0]);
  ellipse(width/2, width/2, size[0], size[0]);
  
  // draw Planets and update parameters
  for(int i = 1; i < num; i++)
  {
    fill(pixelColors[i]);
    float px = width/2 + dist[i]*sin(angle[i] + speed[i]);
    float py = height/2 + dist[i]*cos(angle[i] + speed[i]);    
    ellipse(px, py, size[i], size[i]);
    angle[i] += speed[i];
    
    // draw moon
    if(moon[i] == true)
    {
       float mx = px + distmoon[i]*sin(anglemoon[i] + speedmoon[i]);
       float my = py + distmoon[i]*cos(anglemoon[i] + speedmoon[i]);
       ellipse(mx, my, size[i]/5, size[i]/5);
       anglemoon[i] += speedmoon[i];
       if(anglemoon[i] >= 2*PI) anglemoon[i] = 0;
    }       
    
    // accrete pixels to Planets if same colour
    if(pixelColors[i] == myImg.get(int(width/2 + (dist[i] + distInc[i])*sin(angle[i] + speed[i])),
            int(height/2 + (dist[i] + distInc[i])*cos(angle[i] + speed[i]))))
    {
       size[i] ++;
       size[0] ++;
       if(size[0] > 100) size[0] = 100;
    }
    // reset angle of rotation
    if(angle[i] >= 2*PI) angle[i] = 0;
    
    // move sample points one pixel further out when big enough to see
    if(size[i] % 10 < 1)
    {      
      distInc[i] ++;
      if(distInc[i] > width/2 - dist[i]) distInc[i] = -dist[i];
    }       
    //    
  }
   
}
 
     
    
  
  


