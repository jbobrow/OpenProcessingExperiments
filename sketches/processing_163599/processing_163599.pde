
void setup()
{
  size(1200,400);
  frameRate(10);
}

void draw()
{
  background(0);
  for (float x=0; x<width; x+=10) { 
    float randY = random(0,height); 
    drawRain(x, randY); 
  
  }
}

void drawRain(float x, float y){
   fill(random(0,255),random(0,255),random(0,255));
 
    for (int i=2;i<8;i++){
        noStroke();
        ellipse(x,(i*4)+y,(i*2),(i*2));
    } 
  
}
