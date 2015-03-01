
float widt = 750;
float rad = 100;
float sSize = widt-rad*8;

void setup(){
  size(750,750);
  background(250);
  drawCircles();
}

void draw(){
}

void drawCircles(){
  float x1 = random(sSize/2)+rad*2;
  float x2 = random(sSize/2)+sSize/2+6*rad;
  float y1 = random(sSize)+rad*4;
  float y2 = random(sSize)+rad*4;
  boolean completes = random(1)>.5;
  boolean occluded = random(6)<4;
  
  drawCircleUnit(x1,y1,completes,occluded);
  drawCircleUnit(x2,y2,completes,occluded);
}

void drawCircleUnit(float x, float y, boolean completes,boolean occluded){
  noStroke();
  fill(50);
  pushMatrix();
  translate(x,y);
  rotate(random(2*PI));
  if(completes){
    fill(color(200,100,100));
    stroke(color(200,100,100));
    strokeWeight(1);
    rect(-rad/3,-rad/3.,2*rad/3.,2*rad/3.);
    
    if(random(1)>.5){
      fill(250);
      stroke(250);
      strokeWeight(3);
      rect(-2./6.*rad,1./6.*rad,rad/6,rad/6);
      rect(1./6.*rad,-2./6.*rad,rad/6,rad/6);
      if(!occluded){
        rect(-rad/3,-rad/3.,2*rad/3.,2*rad/3.);
      }
    }
    
    if(occluded){
      noStroke();
      fill(50);
      ellipse(rad/3,rad/3,rad,rad);
      ellipse(-rad/3,-rad/3,rad,rad);
      rect(-1./6.*rad,-1./6.*rad,rad/2,rad/2);
      rect(-2./6.*rad,-2./6.*rad,rad/2,rad/2);
    }
  }else{
    fill(color(200,100,100));
    stroke(color(200,100,100));
    strokeWeight(1);
    rect(-5./6.*rad,1./6.*rad,2*rad/3.,2*rad/3.);
    rect(1./6.*rad,-5./6.*rad,2*rad/3.,2*rad/3.);
    
    if(random(1)>.5){
      fill(250);
      stroke(250);
      strokeWeight(3);
      rect(-2./6.*rad,1./6.*rad,rad/6,rad/6);
      if(!occluded){
        rect(-5./6.*rad,1./6.*rad,2*rad/3.,2*rad/3.);
      }
    }
    if(random(1)>.5){
      fill(250);
      stroke(250);
      strokeWeight(3);
      rect(1./6.*rad,-2./6.*rad,rad/6,rad/6);
      if(!occluded){
        rect(1./6.*rad,-5./6.*rad,2*rad/3.,2*rad/3.);
      }
    }
    
    if(occluded){
      noStroke();
      fill(50);
      float uN = 2./3.*rad;
      float r2 = (uN-(1./3.*rad))*2.;
      ellipse(1./6.*rad,-uN,r2,r2);
      ellipse(uN,-1./6.*rad,r2,r2);
      ellipse(-1./6.*rad,uN,r2,r2);
      ellipse(-uN,1./6.*rad,r2,r2);
      
      ellipse(.6*rad,-.6*rad,rad/1.3,rad/1.3);
      ellipse(-.6*rad,.6*rad,rad/1.3,rad/1.3);
      
      rect(2./6.*rad,-2.5/6.*rad,rad/4.,rad/4.);
      rect(1./6.*rad,-3.5/6.*rad,rad/4.,rad/4.);
      
      rect(-3./6.*rad,2.02/6.*rad,rad/3.,rad/3.);
      rect(-3.98/6.*rad,.7/6.*rad,rad/3.,rad/3.);
    }
  }
  popMatrix();
}

void mousePressed(){
  background(250);
  drawCircles();
}


