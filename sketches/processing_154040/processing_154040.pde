
float xstart, xnoise, ystart, ynoise;
 
Circle[] _circleArr = {};
float num_balls = 3;

void setup() {
  size(640,640);
  smooth();
  background(0); 
  frameRate(12);
}

void draw () { 
  background(0);
  xstart += 0.01;
  ystart += 0.01;
  ynoise += 0.01;
  xnoise +=0.01;
  xnoise = xstart;
  ynoise = ystart;


    for (int i=0; i<_circleArr.length; i++) {
      Circle thisCirc = _circleArr[i];
      thisCirc.drawPoint( noise(xnoise, ynoise) ) ;
      
    }
  }
  void mouseReleased() {
    drawCircles();
  }

   void drawCircles() {
     for (int i=0; i<num_balls; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawPoint(noise(xnoise, ynoise) );
    _circleArr = (Circle[])append(_circleArr, thisCirc);
    
   }
}



class Circle {
  float xmove, ymove;
  float radius;
  float centX;
  float centY;
  float x, y;
  float alph;
  float SPRING = .05;

  Circle(){
    xmove = random(10)-5;
    ymove = random(5)-5;
    radius = random(50,80);
    x = random(width);
    y = random(height);
    alph = 50 + (noise(0.9,0.9) * 255);
    centX = x;
    centY = y;
  }
  void drawPoint(float noiseFactor) {
    
    pushMatrix();
    strokeWeight(2.5);
    stroke(255, alph);
    fill(255, alph/5);
    float radiusNoise = noiseFactor;
    float circleNoise = noiseFactor;
    float lastx = -999;
    float lasty = -999;

    fill(255, alph/4);
    ellipse(centX,centY, radius,radius);

    noStroke();
    fill(255,alph);
    for (float ang = 0; ang <= 360; ang += 0.9) { 
        radiusNoise += 1;
        float thisRadius = radius + (noise(radiusNoise) * noiseFactor * 150) - 100; 
        float rad = radians(ang);
        x = centX + (thisRadius * cos(rad) );
        y = centY + (thisRadius * sin(rad) );
        float edgesize = noiseFactor * 3;
        ellipse(x,y,edgesize,edgesize);
    }
    popMatrix();
    updateMe();
  }

  void updateMe() {

     centX += xmove;
     centY += ymove;

     if (centX > (width) ) { 
       centX = 0; 

     }if (centX < 0 ) {
       centX = width; 

     }if (centY > (height) ) { 
       centY = 0; 

     }if (centY < (0) ) { 
       centY = height; 
      }

      boolean touching = false;
      for (int i=0; i<_circleArr.length; i++) {

        Circle b = _circleArr[i];
        float xx = b.centX, yy = b.centY;
        float dx = xx - centX, dy = yy - centY;
        float distance = dist (b.centX, b.centY, centX, centY);
          float minDist  = b.radius + radius;

      if (distance <= minDist/2){   
       
            float ang = atan2(dy, dx);
            float tx = centX + cos(ang)*minDist;
            float ty = centY + sin(ang)*minDist;
            float ax = (tx - xx)*SPRING;
            float ay = (ty - yy)*SPRING;
          centX -= ax ;
            centY -= ay;
            b.centX += ax ;
            b.centY += ay;
            touching = true;

          xmove=xmove*-1;
        b.xmove=b.xmove*-1;
        ymove=ymove*-1;
        b.ymove=b.ymove*-1;
          }
      } 
  }
}


