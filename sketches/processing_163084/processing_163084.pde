
//snow snow snow

void setup()
{
  size(600,600);
  frameRate(1);
}

void draw()
{
  background(0);
  
    float litX1 = random(0, width);
    float litX2 = random(litX1-50, litX1+50);
    float litY2 = random(200,500);
    line( litX1, 0, litX2, litY2);
    stroke(173,255,47);
    strokeWeight(2);
    
    
}
