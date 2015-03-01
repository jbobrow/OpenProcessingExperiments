
/*
 * Creative Coding
 * Week 3, 06 - rule-based system
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch draws a series of moving Elements (circles) according to the following rules:
 * - start from a random position and move in a constant random direction
 * - if the point reaches the boundary of the screen move in the opposite direction with new velocity
 * - if the circles intersect then draw a line connecting their centres, colouring the line based on the circle being odd or even
 *
 * Excuse the lack of comments
 *   Basically 2 layers
 *   Layer 2 reflects layer using the spinning techniques top 1 but trying to 
 *   give an illusion of distance. Also reflected so it isn't too similar
 *
 *
 */

PGraphics pgLayer1;
PGraphics pgLayer2;

float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
float[] radI;

float b1mult, b2mult, b3mult;

int numArray;   // number of elements

float proximity;  // if distance between elements < proximity then draw a line between them

void setup() {
  size(600, 600);

  numArray = 40;

  //set the speed multipliers
  b3mult=2.59;  //1;
  b2mult=1.61;
  b1mult=1;     //2.59;
  
  
  // allocate arrays
  x= new float[numArray];
  y= new float[numArray];
  

  xInc= new float[numArray];
  yInc= new float[numArray];
  radI= new float[numArray];
  
  colorMode(HSB,360,100,100);

  proximity = 100;   // influence distance

  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    x[i] = random(width);
    y[i] = random(height);
    
    xInc[i] = random(-1, 1);
    yInc[i] = random(-1, 1);
    radI[i] = random(20,100);
  }

  strokeWeight(1);
  background(0);
  
  pgLayer1 = createGraphics(width,height);
  pgLayer2 = createGraphics(width,height);

  
}

void draw() {

  pgLayer1.beginDraw();
  pgLayer2.beginDraw();
  pgLayer1.colorMode(HSB,360,100,100);
  pgLayer2.colorMode(HSB,360,100,100);  
  
  pgLayer1.background(0);
  pgLayer2.background(0,0);
  
  float dRad = radians(frameCount/50);

  // iterate over each point
  for (int i=0; i<numArray; i++) {
    
    float thisMult=0;
    if (
       ((x[i] >= 0) && (x[i] <= 1 * (width/3))) ||     
       ((x[i] >= width - 1 * (width/3)) && (x[i]<=width)) ||
       ((y[i] >= 0) && (y[i]<= 1 * (height/3))) ||
       ((y[i] >= height - 1 * (height/3)) && (y[i]<=height))
       )
       thisMult=b1mult;
    
    if (
       ((x[i] >= 1 * (width/3)) && (x[i]<= 2 * (width/3))) ||
       ((x[i] >= width - 2 * (width/3)) && x[i] <= width - 1 * (width/3)) ||
       ((y[i] >= 1 * (height/3)) && (y[i]<= 2 * (height/3))) ||
       ((y[i] >= height - 2 * (height/3)) && y[i] <= height - 1 * (height/3))
       )
       thisMult=b2mult;
       
    if (
       ((x[i] >= 2 * (width/3)) && (x[i]<= 3 * (width/3))) ||
       ((x[i] >= width - 3 * (width/3)) && x[i] <= width - 2 * (width/3)) ||
       ((y[i] >= 2 * (height/3)) && (y[i]<= 3 * (height/3))) ||
       ((y[i] >= height - 3 * (height/3)) && y[i] <= height - 2 * (height/3))
       )
       thisMult=b3mult;
    
       
    x[i] += xInc[i]*thisMult;
    y[i] += yInc[i]*thisMult;

    // bounce off the sides of the window
    if (x[i] > width || x[i] < 0) {
      xInc[i]=redirect(xInc[i]*thisMult,"bounce");
    }

    if (y[i] > height || y[i] < 0 ) {
      yInc[i]=redirect(yInc[i]*thisMult,"bounce");
    }

    //drawElement(x[i], y[i], xInc[i], yInc[i]);
  }

  for (int i=0; i<numArray; i++) {
    for (int j=0; j<i; j++) {
      float distd = dist(x[i], y[i], x[j], y[j]  );
      if (distd < proximity) {
        
        //deviate if touching
        //would be best to know the direction as well
        //such that we can deviate in a single object away from
        //that direction but we haven't visited pvectors yet

        xInc[i]=redirect((xInc[i]),"deviate");
        yInc[i]=redirect((yInc[i]),"deviate");
        xInc[j]=redirect((xInc[j]),"deviate");
        yInc[j]=redirect((yInc[j]),"deviate");
        
        float elSize = map(distd,0,proximity,10,.1);
        float elBright = map(distd,0,proximity,100,50);
        float elWeight = map(distd,0,proximity,4,.1);

        
        float bXi= (constrain(x[i] + 100 * sin(dRad),0,width));
        float bYi= (constrain(y[i] + 100 * sin(dRad),0,height));
                
        float handXi =( constrain(x[i] + 100 * sin(dRad),0,width) + (radI[i] *  sin(dRad*0.1)) * sin(dRad*3));
        float handYi =(constrain(y[i] + 100 * cos(dRad),0,height) + (radI[i] *  cos(dRad*0.1)) * cos(dRad*3));
        float handXj =( constrain(x[j] + 100 * sin(dRad),0,width) + (radI[j] *  sin(dRad*0.1)) * sin(dRad*3));
        float handYj =(constrain(y[j] + 100 * cos(dRad),0,height) + (radI[j] *  cos(dRad*0.1)) * cos(dRad*3));
        
        float distb = dist(bXi, bYi, handXj, handYj  );
        float belSize = map(distb,0,proximity,4,.1);
        
        pgLayer1.ellipse(handXi,handYi,belSize,belSize);
        
        
        if ((distb > proximity*.61) && (distb < proximity*1.62)) {
          
          float belBright = map(distb,proximity*.61,proximity*1.62,5,0);
          float belWeight = map(distb,proximity*.61,proximity*1.62,.1,40);
          
          pgLayer1.strokeWeight(belWeight);
          pgLayer1.stroke(0,0,belBright, 200);
          pgLayer1.line(width -bXi, height -bYi, width -handXj, height -handYj  );
        }
                 
        //println(elSize);

        pgLayer2.noStroke();
        pgLayer2.fill(0,0,elBright);
        pgLayer2.ellipse(x[i],y[i],elSize,elSize);
        pgLayer2.ellipse(x[j],y[j],elSize,elSize);

        pgLayer2.strokeWeight(elWeight);
        
        
        
        if (i%2 == 0 || j%2==0) {
          pgLayer2.stroke(60,100,50, 200);
        } 
        else {
          pgLayer2.stroke(360,100,50, 200);
        }
        pgLayer2.line(x[i], y[i], x[j], y[j]  );
      }
    }
  }
  
  pgLayer2.endDraw();
  pgLayer1.endDraw();
 
  image(pgLayer1,0,0);
  image(pgLayer2,0,0);
}

void drawElement(float x, float y, float dx, float dy ) {

  // draw the point in red
  noFill();
  stroke(255, 0, 0);
  point(x, y);

  // draw an arrow in the current direction of travel
  stroke(0, 100);
  float endX = x + (dx*20);
  float endY = y + (dy*20);
  float arX = x + (dx*15);
  float arY = y + (dy*15);
  line(x, y, endX, endY);
  line(endX, endY, arX + (dy * 5), arY - (dx * 5));
  line(endX, endY, arX - (dy * 5), arY + (dx * 5));


  // draw the boundary of proximity
  stroke(0, 10);
  ellipse(x, y, proximity, proximity);
}


float redirect (float rdInc, String rdType) {
  float rdRet=rdInc;

  if (rdType=="bounce") {  
    rdRet = rdInc > 0 ? -random(1) : random(1);
  } else if (rdType=="deviate") {
    rdRet = rdInc > 0 ? random(1) : -random(1);
  }
  
  return rdRet;
}



