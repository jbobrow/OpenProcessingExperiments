
float x, y, wd, ht, easingcoef;

 boolean sketchFullScreen() {
        return true;
}
void setup(){
  
  size(1500, 800);
        

  
  smooth();
  x = width * .5;
y = height * .5;
wd = width/5;
ht = height/5;

background(0);
frameRate(120);
}
 
void draw(){
  
pushMatrix();{
  fill(random(0), random(0), random(255),  5);
   noStroke();
   ellipse(random(width) , random(width), wd, ht);
   wd = wd + 1;
   ht = ht + 1;
   float distx = random(width) - x;
   float disty = random(height) - y;
   
  if (wd > width)
  {
    wd = width * .1;
    background(0);
  }
  if(ht > height)
  {
    ht = height * .1;
     }
    popMatrix();
    
  stroke(255,255,255,10);
    int s = second();  // Values from 0 - 59
  for (int x = 20; x<width; x+=20){
    if (s<=0.5*width){
    float mx = s/10.0;
    float offsetA = random(-mx,mx);
    float offsetB = random(-mx,mx);
    line(x+offsetA,s*100, x + offsetB, 0);
    }
  }
  }
   }


