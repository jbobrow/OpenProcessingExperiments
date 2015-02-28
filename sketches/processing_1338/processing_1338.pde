
class Stroke {
  float heading;
  float headingStart;
  float strokeLength, startLength;
  float curveRate;
  float x,xStart;
  float y,yStart;
  float speed;
  
  public Stroke(float x_, float y_) {
    heading = headingStart = random(360);
    strokeLength = startLength = random(maxStrokeLength);
    curveRate = random(maxCurveRate) - (maxCurveRate/2);
    x = xStart = x_;
    y = yStart = y_;
    speed = minSpeed + random(maxSpeed);
  }
  
  public void display() {
    float old_x = x;
    float old_y = y;
    if(strokeLength > 0) {
      //update positions
      x = (x + (speed * cos(radians(heading))));
      y = (y + (speed * sin(radians(heading))));
      
      //update heading
      heading += curveRate;
      
      //decrement length
      strokeLength -= 1;
      
      //draw 'leaves'
      pushMatrix();
       translate(x,y);
       rotate(radians(heading + 90));
       stroke(0,250,0,10);
       line(-20,0,20,0);
      popMatrix();
      
      //draw line
      strokeWeight(1 + ((strokeLength * 0.25) / speed));
      stroke(46,19,1);
      line(old_x,old_y,x,y);
      
      //spawn child
      if((random(100) + (startLength/strokeLength)) > 95) {
        Stroke s = new Stroke(x,y);
        s.strokeLength = strokeLength;
        s.speed = speed;
        strokes.add(s);
      }
    }
  }
}

