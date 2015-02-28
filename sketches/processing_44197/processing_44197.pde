
PShape s, so;
PImage mario;
float rangle,angle = 0.0;

void setup()
{
  size(800, 800);
  s = loadShape("Nintendo_logo.svg");
  so = loadShape("Nintendo_logo_outline.svg");
  mario = loadImage("realmario.png");
  smooth();
  imageMode(CENTER);
  shapeMode(CENTER);
}

void draw()
{
  background(255);
  s.disableStyle();
  so.disableStyle();
//  float easing = 0.05;
  float d = dist(width/2, height/2, mouseX, mouseY);
  float sz = constrain(d, 30, 299);
  float st = constrain(d, 0,255);
 
//Nintendo Logo  
  pushMatrix();
  translate(width/2,height/2);
  scale(sz);
  noStroke();
  fill(255,0,0,st);
  shape(s, 0,0, 1, 1);
  popMatrix();
 
//Nintendo Logo Stroke  
  if (d <= 100) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(angle);
    for(float i=1.1; i <= 5; i= i+.1)
    {
      scale(i);
      noFill();
      stroke(255,0,0);
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
    
    
    angle += 0.05;
    rangle -= 0.05;
  }
  
      //Mario  
    pushMatrix();
    translate(width/2,height/2);
    tint(255,255-st);
    image(mario, 0, 0);
    popMatrix();
    
}


