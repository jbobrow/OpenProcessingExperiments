

float rotIncr = 20;
float bigCircleSize=300;
//PFont font;
void setup()
{
  size(600,600,P3D);
  //smooth();
  frameRate(25);
  background(255);
   noStroke();
  fill(255,0,0,50);
  //font = loadFont("CourierNewPSMT-48.vlw"); 
  //textFont(font, 48);
}
float prevX,prevY;
float X,Y;
float rotY=0;
float nbTriangle = 15;
color col =color(90,90,random(255),50);
void draw()
{  fill(255,0,0,50);
  background(255); 
  float circleSize=bigCircleSize;
  float nbCircle = 70;

  rotY += rotIncr;

; 

  pushMatrix();
  translate((width>>1),(height>>1),0);

  rotateX(radians(mouseY));
  rotateZ(radians(mouseX));

if(frameCount%100==0)
col =color(20,20,random(255),50);
  fill(col);
  for(int i=0;i<nbCircle;i++)
  {
    pushMatrix();
    rotateY(radians(rotY));
    boolean firstTime=true;
    float triangleSize = circleSize/nbTriangle;
    float coef = 2*PI/circleSize;

    for(float j=0;j<=circleSize;j+=(triangleSize))
    {
      float iter = coef*j;
      X = circleSize*cos(iter);
      Y = circleSize*sin(iter);

      if(firstTime != true)
      {
        
        pushMatrix();
        beginShape(TRIANGLES);
        vertex((prevX+X)/2.0,-2*i,(prevY+Y)/2.0);
        vertex(prevX,-i,prevY);
        vertex(X,-i,Y);
        endShape();
        popMatrix();
        pushMatrix();
        rotateX(PI);
        beginShape(TRIANGLES);
        vertex((prevX+X)/2.0,-2*i,(prevY+Y)/2.0);
        vertex(prevX,-i,prevY);
        vertex(X,-i,Y);
        endShape();
        popMatrix();
        
      }
      else
      {
        firstTime=false;
      }
      prevX=X;
      prevY=Y;
    }
    popMatrix();
    circleSize -= (bigCircleSize/nbCircle);
  }
  popMatrix();
  //fill(0);
  //text(frameRate,5,49);
}

void keyPressed()
{
  switch(key)
  {
  case 'e' :
  case 'E' :
    {
      if(nbTriangle>0)
        nbTriangle--;
      break;
    }
  case 'r' :
  case 'R' :
    {
      //if(nbTriangle>0)
      nbTriangle++;
      break;
    }
  case 'd' :
  case 'D' :
    {
      if(bigCircleSize>10)
        bigCircleSize-=10;
      break;
    }
  case 'f' :
  case 'F' :
    {
      //if(nbTriangle>0)
      bigCircleSize+=10;
      break;
    }
  case '+':
    {
      rotIncr += 0.1;
      break;
    }
  case '-':
    {
      if(rotIncr>0)
      rotIncr -= 0.1;
      break;
    }
  }
}


