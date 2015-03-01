
PVector center;
float size = 1.2;
float step = 2;
float xOff = 0.0;
float yOff = 0.0;
float noiseX, noiseY;
void setup () {
  colorMode(HSB, 60, 100, 100);
  size (500, 500);
  background(120,100,50,50);
  center = new PVector(width/2, height/2);
  smooth();
  
}
void draw () {

  if (size % 2 > 1) 
  {
    xOff = xOff + 0.001;
    yOff = yOff + 0.51;
    noiseX = noise(xOff) * 400;
    noiseY = noise(yOff) * 400;
    strokeWeight(noise(yOff) * 7);
  } else
  {
    xOff = xOff + 0.001;
    yOff = yOff + 0.91;
    noiseX = noise(xOff) * 400;
    noiseY = noise(yOff) * 400;
    strokeWeight(noise(yOff) * 7);
   
  }


  

  noFill();
  float colX = map(size, 0, width, 0, 60);
  stroke(180-colX, 100, 90-colX, 100-colX*1.2);
  rectMode(CENTER);
  rect(center.x +noiseX, center.y+noiseY, size+noiseX, size+noiseY);
  size = size + step;
  if (size > width+400)
  {
    size = 0;
    background(60,100,50,50);
  }
}



