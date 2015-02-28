
class LineGraph {
  float [] values;
  float gX, gY, gWidth, gHeight;
  color lineColor;
  int cursor;
  float lastValue = 0;
  float minValue = 0;
  float maxValue = 0;

  LineGraph(int nValues, float gX, float gY, float gWidth, float gHeight) {
    values = new float[nValues];
    this.gX = gX;
    this.gY = gY;
    this.gWidth = gWidth;
    this.gHeight = gHeight;
    lineColor = color(255);
    maxValue = 10;
    minValue = -maxValue;
  }

  void setValue(int iValue, float newValue) {
    lastValue = values[cursor];
    iValue = (iValue % values.length);
    values[iValue] = (0.8*lastValue + 0.2*newValue);
    cursor = iValue;
  }

  void update() {
    //    minValue = min(values)<minValue ? min(values) : minValue;
    //    maxValue = max(values)>maxValue ? max(values) : maxValue;
  }

  void draw() {
    stroke(255);
    strokeWeight(2.0);
    float x0 = map(cursor, 0, values.length, gX, gX+gWidth), 
    x1 = x0, 
    y0 = gY - gHeight/2, 
    y1 = gY + gHeight/2;
    line(x0, y0, x1, y1);

    stroke(lineColor);
    for (int iValue=0; iValue<values.length-1; iValue++) { 
      if (iValue < cursor) {
        x0 = map(iValue, 0, values.length, gX, gX+gWidth);
        x1 = map(iValue+1, 0, values.length, gX, gX+gWidth); 
        y0 = map(values[iValue], minValue, maxValue, gY-gHeight/2, gY+gHeight/2); 
        y1 = map(values[iValue+1], minValue, maxValue, gY-gHeight/2, gY+gHeight/2);

        line(x0, y0, x1, y1);
      }
    }
  }
}

class AccObject {
  float angle;
  float x, px, vx, pvx, ax;
  float y, py, vy, pvy, ay;
  float sz;
  float lax = 0, lay = 0;


  AccObject() {
    angle = 0;
    sz = 100;
  }

  void setPos(float newX, float newY) {
    px = x;
    x = newX;

    py = y;
    y = newY;
  }

  void trans(float tX, float tY) {
    px = x;
    x += tX;

    py = y;
    y += tY;
  }

  void update() {

    pvx = vx;
    vx = x - px;
    lax = vx - pvx;


    pvy = vy;
    vy = y - py;
    lay = vy - pvy;

    ax = lax*cos(angle) + lay*sin(angle) + cos(angle)*10;
    ay = lay*cos(angle-PI) + lax*sin(angle-PI) + sin(angle)*10;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    pushMatrix();
    rotate(angle);
    stroke(0);    
    rect(-sz/2, -sz/2, sz, sz);


    stroke(255, 0, 0);
    line(0, 0, lax*100, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, lay*100);

    popMatrix();
    popMatrix();
  }
} 

LineGraph lineGraphX, lineGraphY;
AccObject accObject;

void setup() {
  size(500, 500);
  lineGraphX = new LineGraph(width, 0, 3*height/4, width, height/4);
  lineGraphY = new LineGraph(width, 0, 3*height/4, width, height/4);
  lineGraphX.lineColor = color(255, 0, 0);
  lineGraphY.lineColor = color(0, 255, 0);
  accObject = new AccObject();
}

void draw() {
  background(0);

  if (mousePressed)
    accObject.angle += (float)(mouseX - pmouseX)/(float)width * PI;
  else
    accObject.trans(mouseX-pmouseX, mouseY-pmouseY);

  accObject.update();
  accObject.draw();

  lineGraphX.setValue(frameCount, accObject.ax);
  lineGraphY.setValue(frameCount, accObject.ay);
  lineGraphX.update();
  lineGraphY.update();
  lineGraphX.draw();
  lineGraphY.draw();
}

