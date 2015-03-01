
//Trembling dots
//Simple interactive line based spiral
//Based on Ex 4.2 & 4.3 from Generative Art book by Matt Pearson
//Updated to react to mouse movements (X&Y)
//X - increase radius delta
//Y - increase number of points/rounds
//X+Y - decrease noise/trembling
//Created by @rasagy

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
}

void draw() {
  background(map(mouseX, 0, width, 0, 40), map(mouseY, 0, height, 60, 40), 80);
  noFill();
  strokeWeight(map(mouseX, 0, width, 4, 16));
  smooth();

  float radius = 10;
  float addRadius=map(mouseX, 0, width, 0, 1);
  float rounds=map(mouseY, 0, height, 0.25, 3.75);
  float radiusNoise=random(5);
  float noisePower=map(mouseX+mouseY,0,width+height,1,0);
  int centerX=width/2;
  int centerY=height/2;

  //ellipse(centerX, centerY, radius*2, radius*2);
    
  stroke(60, 60, 40, 30);
  float x, y;
  float lastX= -999;
  float lastY= -999;
  
  radius=0;
  
  for (float ang=0; ang<=360*rounds; ang+=5) {
    radiusNoise+=0.01;
    radius+=(addRadius*2+noise(radiusNoise)*noisePower)/2;
    float rad= radians(ang);
    x=centerX + (radius*cos(rad));
    y=centerY + (radius*sin(rad));
    if (lastX> -999)
    {
      line(x, y, lastX, lastY);
    }
    lastX=x;
    lastY=y;
  }
}


