
float _gradient1Threshold = 10, _gradient2Threshold = 50, _gradient3Threshold = 150;

int[] _startColors = new int[4];
int[] _endColors = new int[4];
List<String> test = new ArrayList<String>();

void initializeColors() {

  color col = color(0,0,0);
  _startColors[0] = color(255,0,0);
  _endColors[0] = color(0,0,255);
  
  _startColors[1] = color(0,200,0);
  _endColors[1] = color(0,105,200);
  
  _startColors[2] = color(255,0,0);
  _endColors[2] = color(255,255,0);
  
  _startColors[3] = color(0,0,255);
  _endColors[3] = color(0,255,255);
//  println(getColor(0,0.1));
}
color getColor(int gradientNumber, float maxVal, float distance /* between 0 and 1 */) {
  float r = red((color) _startColors[gradientNumber]);
  color col = Gradient(
    red((color) _startColors[gradientNumber]),
    green((color) _startColors[gradientNumber]),
    blue((color) _startColors[gradientNumber]),
    red((color) _endColors[gradientNumber]),
    green((color) _endColors[gradientNumber]),
    blue((color) _endColors[gradientNumber]),
    maxVal, distance);
    return col;
}


color Gradient(float r1, float g1, float b1, float r2, float g2, float b2, float iMax, float iValue) {
  int R = adjust(r1,r2,iMax,iValue);
  int G = adjust(g1,g2,iMax,iValue);
  int B = adjust(b1,b2,iMax,iValue);
  return color(R,G,B);
}
int adjust(float start, float end, float maxValue, float iValue) {
  float inc = (end - start)/maxValue;
  float val =  (inc * iValue + start);
  //println(inc + ", " + val);
  float minval = min(start,end);
  float maxval = max(start, end);
  if (val < minval) val = minval;
  if (val > maxval) val = maxval;
  return (int) val;
}

