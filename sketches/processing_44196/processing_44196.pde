
PShape s, so;
float rangle,angle = 0.0;

void setup()
{
  size(800, 800);
  s = loadShape("Nintendo_logo.svg");
  so = loadShape("Nintendo_logo_outline.svg");
  smooth();
  shapeMode(CENTER);
}

void draw()
{
  background(255);
//  float easing = 0.05;
  float d = dist(width/2, height/2, mouseX, mouseY);
  float sz = constrain(d, 100, 299);
  //float st = constrain(sz, -500,-110);
  pushMatrix();
  translate(width/2,height/2);
  scale(300-sz);
  shape(s, 0,0, 1, 1);
  popMatrix();
  
  if (d <= 100) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(angle);
    for(float i=1.1; i <= 5; i= i+.1)
    {
      scale(i);
      shape(so, 0,0, 1,1);
    }
    popMatrix();
    
    pushMatrix();
    translate(width/2,height/2);
    rotate(rangle);
    for(float j=1.1; j <= 5; j= j+.1)
    {
      scale(j);
      shape(so,0,0,1,1);
    }
      
    popMatrix();
    
    angle += 0.01;
    rangle -= 0.01;
  }
    
}


