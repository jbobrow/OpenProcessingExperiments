
int reps = 1000;
float [] ypos = new float[reps];
float [] xpos = new float[reps];
int instance = 0;
int startingPointX= 350;
int startingPointY= 350;
int refreshPoint = 50;
void setup()
{
  size(700, 400);
  smooth();
  for (instance = 0; instance < reps; instance ++) {
    xpos[instance] = int(random(-startingPointX, startingPointX));
    ypos[instance] = int(random(-startingPointY, startingPointY));
  }
}

void draw()
{
  if(mousePressed) {}
  else{background(0);}
  
  pushMatrix();
  translate(width/2, height/2);
  for (instance = 0; instance < reps; instance ++) {
    stroke(255,instance);
    point(xpos[instance], ypos[instance]);
    xpos[instance]= xpos[instance]+(xpos[instance])/100.0;
    ypos[instance]= ypos[instance]+(ypos[instance])/100.0;
    if ((xpos[instance] < -width) || (xpos[instance] > width) ||
      (ypos[instance] < -height) || ( ypos[instance] > height)) {
      xpos[instance] = random(-refreshPoint, refreshPoint);
      ypos[instance] = random(-refreshPoint, refreshPoint);
    }
  }
  popMatrix();
}



