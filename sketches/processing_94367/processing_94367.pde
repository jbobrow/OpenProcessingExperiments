
Clock testClock;
float clockSize;


//Configurations
void setup(){
  size(640, 480);
  sketchFullScreen();
  noCursor();
  smooth();
  clockSize = 200;
  testClock = new Clock(clockSize);
}

//Drawing Loop
void draw(){
  background(255);
  pushMatrix();
  testClock.draw();
  testClock.update();
  popMatrix();
}

//Fullscreen Variable
boolean sketchFullScreen() {
  return true;
}

//Screen Capturer
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}

class Clock{
  Ring hourRing, minuteRing, secondRing;
  float clockSize;
  float hourAngle, minuteAngle, secondAngle;
  
  Clock(float _clockSize){
    clockSize = _clockSize;
    hourAngle = 360 * ((hour() % 12)/12.00);
    minuteAngle = 360 * (minute()/60.00);
    secondAngle = 360 * (second()/60.00);
    hourRing = new Ring(width/2, height/2, clockSize*1, clockSize*0.6, 0.00, hourAngle);
    minuteRing = new Ring(width/2, height/2, clockSize*0.6, clockSize*0.3, 0.00, minuteAngle);
    secondRing = new Ring(width/2, height/2, clockSize*0.3, clockSize*0.01, 0.00, secondAngle); 
    hourRing.setFillColor(color(0,255, 0));
    minuteRing.setFillColor(color(0,180, 0));
    secondRing.setFillColor(color(0,128, 0)); 
  }
  
  void draw(){
    pushMatrix();
    hourRing.draw();
    minuteRing.draw();
    secondRing.draw();
    popMatrix();
  }
  
  void update(){
    hourAngle = 360 * ((hour() % 12)/12.0);
    minuteAngle = 360 * (minute()/60.0);
    secondAngle = 360 * (second()/60.0);
    hourRing.setEnd(hourAngle);
    minuteRing.setEnd(minuteAngle);
    secondRing.setEnd(secondAngle);
  }
}

class Ring{
  float centx, centy;
  float outerRadius, innerRadius;
  float startAngle, endAngle;
  color fillColor = 255;
  color strokeColor = 0;
  
  boolean fillEnabled = true;
  boolean strokeEnabled = false;
  
  Ring(float _centx, float _centy, float _outerRadius, float _innerRadius, float _startAngle, float _endAngle){
    centx = _centx;
    centy = _centy;
    outerRadius = _outerRadius;
    innerRadius = _innerRadius;
    startAngle = _startAngle;
    endAngle = _endAngle;
  }
  
  void draw(){
    if(fillEnabled){
      fill(fillColor);
    }else{
      noFill();
    }
    if(strokeEnabled){
      stroke(strokeColor);
    }else{
      noStroke();
    }
    pushMatrix();
    translate(centx, centy);
    rotate(-radians(90));
    float x, y;
    beginShape();
    for(int i = (int) startAngle; i < endAngle; i++){
      x = outerRadius*cos(radians(i));
      y = outerRadius*sin(radians(i));
      vertex(x, y);
    }
    for(int i = (int) endAngle; i > startAngle; i--){
      x = innerRadius*cos(radians(i));
      y = innerRadius*sin(radians(i));
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void setStart(float _startAngle){
    startAngle = _startAngle;
  }
  void setEnd(float _endAngle){
    endAngle = _endAngle;
  }
  void addOffset(float _offset){
    startAngle += _offset;
    endAngle += _offset;
  }
  void setFillColor(color _fillColor){
    fillColor = _fillColor;
  }
  void setStrokeColor(color _strokeColor){
    strokeColor = _strokeColor;
  }
  void enableFill(boolean _enableFill){
    fillEnabled = _enableFill; 
  }
  void enableStroke(boolean _enableStroke){
    strokeEnabled = _enableStroke; 
  }
}
