
class Stitch {
  float x, y;
  int lineAmt, order;
  float lastX, lastY;
  float sinAngle;
  float freq = .08;
  float amp = 50;
  float centralX;
  float centralY;
  float curSin;
  float lastSin;
  float newAmp;
  float newFreq;
  float lastFollowX;
  float lastFollowY;
  float lastFollowAngle;
  float orderFactor;
  
  Stitch(float _x, float _y, int order, int lineAmt)
  {
    x = _x;
    y = _y;
    lastX = x;
    lastY = y;
    lastFollowX = x;
    lastFollowY = y;
   
    this.lineAmt = lineAmt;
    this.order = order;
    
    noFill();

    centralX = _x;
    centralY = _y;
    sinAngle = 0;
    
    newAmp = amp;
    newFreq = freq;
    
    int orderDif = ((lineAmt-1) - order);
    int amt = lineAmt-1;
    orderFactor = (order * (2.0/amt)) - 1;
  }
  
  
  
  void drawLine(float mousex, float mousey)
  {
    float followX = lastFollowX + (mousex - lastFollowX) * .05;
    float followY = lastFollowY + (mousey - lastFollowY) * .05;
    
    // find the direction that the line is moving in
    float dx = followX - lastFollowX;
    float dy = followY - lastFollowY;
    float followDist = sqrt(dx*dx + dy*dy);
    float followAngle;
   
    if(followDist == 0){
      followAngle = lastFollowAngle;
    }else{
      followAngle = (float)atan2(dy, dx);
      lastFollowAngle = followAngle;
      centralX += (followX - centralX) * .01;
      centralY += (followY - centralY) * .01;
    }
    
    
    if(order == 0){
      stroke(0, 20);
      line(followX, followY, followX + cos(followAngle) * 100, (float)followY + sin(followAngle) * 100);
      noStroke();
    }
    // get the current sin wave position
    lastSin = curSin;
    curSin = sin(sinAngle) * orderFactor;
    
    
    float newX = centralX + (curSin * (sin(followAngle)*amp)); // amplitude
    float newY = centralY + (curSin * (cos(followAngle)*-amp));
    
    int lineAlpha  = 255 - (5 + round(abs(sin(sinAngle) - 0) * random(200, 250)));
      
    stroke(10, lineAlpha);
    line(lastX, lastY, newX, newY);
     noStroke();
    
    if((curSin < 0 && lastSin > 0) || (curSin > 0 && lastSin < 0)){
      if(order == 0){
         newAmp = random(40, 140);
         newFreq = random(.015, .09);
      }
    }
    
    amp += (newAmp - amp) * .1;
    freq += (newFreq - freq) * .1;
    
    lastX = newX;
    lastY = newY;
    lastFollowX = followX;
    lastFollowY = followY;
    
    sinAngle += freq; // frequency
    
  }
    
}

