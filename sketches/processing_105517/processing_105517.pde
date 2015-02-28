
float rad = 200;
float newTheta;
float radVel;
float xLen;
float xVel;
int divs;
float thetaVel = 0;
boolean drawStroke =true;
void setup(){
  size(800, 800);
  noStroke();
//frameRate(20);
smooth();
  radVel=.5;
  xLen = 0;
  xVel = .1;
  rad = 0;
  divs = 1;
}
void draw(){
  background(127);
   if(drawStroke){stroke(255);}
    else {noStroke();}
  
  for(float theta = newTheta; theta < 2*PI+newTheta; theta += PI/divs)
  {
    fill(color(rad*theta/PI,200*theta/(2*PI),0, 127));
    pushMatrix();
    translate(width/2+rad*cos(theta), height/2+rad*sin(theta));
    rotate(-theta);
    ellipse(0,0,mouseX
    ,mouseY);
    popMatrix();
  }
  
    newTheta+=thetaVel;
    if(rad > width/2 || rad < -width/2){
      xVel *=-1;
      radVel*=-1;
    }
    rad+=radVel;
    xLen+=xVel;
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      divs++;
    } else if (keyCode == DOWN) {
      if(divs > 1)
      divs--;
    }
    else if(keyCode == LEFT)
    {
      thetaVel -=PI/500;
    
    }
    else if(keyCode == RIGHT)
    {
      thetaVel += PI/500;
          
    }
  } 
}
void mouseClicked(){
    drawStroke = !drawStroke;
}
