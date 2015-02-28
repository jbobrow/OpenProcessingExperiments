
int loopLength;

void setup() {
  size(640,480);
  background(0);
  color(HSB);
  loopLength = 100;
}

void draw() {
 
  for(int i = 0; i< loopLength; i++) {
    int x = int(random(0,width));
    int y = int(random(0,height));
    //point of reference of the sine curve
    float currentCurvePoint = (width/2)-100 + sin(radians(x-50))*100;
    float distance = abs(y - currentCurvePoint);
    float col = map(distance,0,200,255,0);
    //println(cos(PI/180. * x) + "," + sin(PI/180. * y));
   //oscilates color accoridng to pont position
    //float a = map(cos(PI/180. * x),-1,1,0,128)
    //float b = map(sin(PI/180. * y),-1,1,0,255);
    
    stroke(col);
    point(x,y);
  }
   
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
  
}

void keyPressed() { 
  if (key == '+') {
      loopLength += 100;
  } else if (key == '-') {
    loopLength -= 100;
  } else if(key == 's') {
    saveFrame("thumb.jpg"); 
  }
  println(loopLength);
}


