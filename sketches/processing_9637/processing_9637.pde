
bolt b;
float xn;
float yn;

void setup(){
  size(300,300);
  background(0);
}



void draw(){
  xn = random(mouseX-20,mouseX+20);
  yn = 0;
  b = new bolt(xn,yn,1);
  b.draw();
  fill(0,10);
  rect(0,0,300,300);
}

class bolt{
  float boltwidth;
  float l;
  float theta;
  float x0,y0,x1,y1;
  bolt(float x00, float y00, float bwidth){
    boltwidth = bwidth;
    x0 = x00;
    y0 = y00;
    l = random(1,2);
    theta = random(-HALF_PI,HALF_PI);
    x1 = x0+l*sin(theta);
    y1 = y0+l*cos(theta);
  }
  void draw(){
    //strokeWeight(2);
    stroke(229);
    line(x0,y0,x1,y1);
    ellipse(x1,y1,2,2);
    if(y1<300){
      new bolt(x1,y1,2).draw();
    }
    //ellipse(x,30,30,30);
  }
}

