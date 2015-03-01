
float phase,rad,centerx,centery;
float x,y;
float seed;
ArrayList<Float> radii = new ArrayList<Float>();
void setup()
{
 size(800,800);
  phase = 0.0;
   rad = 150;
  centerx = width/2;
 centery = height/2;
 noLoop();
 smooth();
   phase = 0;
  while(phase < PI*2)
  {
   phase+=random(.05,.38);
   if(phase > PI*2)
     phase = PI*2;
     radii.add(phase);
    
   
    
  }
 seed = random(1,1000);
  background(255,0,0);
}

void draw()
{
 
  noFill();

  //for(int j = 0; j < 60;j++)
  int j = 0;
  while(rad < width/2)
  {
    j++;
  if(j %2 ==-0)
  {
   stroke(random(30)); 
    
  }
  else
  {
    stroke(255-random(30));
  }
  float w = random(2,6);
  strokeWeight(w);
  rad+=w/2;
  beginShape();

  for(int i = 0; i < radii.size();i++)
  {
   float p = (float)radii.get(i); 
   float offset = noise(i*.84+seed)* (rad*.75)-(rad*.375);
    x = sin(p)*(rad+offset)+centerx;
    y = cos(p)*(rad+offset) +centery;
    vertex(x,y);
  }
endShape(CLOSE);
  }
}
void mouseReleased()
{
  seed = random(1,10000);
  centerx = random(width);
  centery = random(height);
  radii.clear();
 // radii = new ArrayList<Float>();
   phase = 0.0;
    rad = random(20,100);
   while(phase < PI*2)
  {
   phase+=random(.05,.8);
   if(phase > PI*2)
     phase = PI*2;
     radii.add(phase);
    
   
    
  }
  redraw();
}
