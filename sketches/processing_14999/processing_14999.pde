

class Raindrop {
  float x, y, z;
  String string;
  int r, g, b;
  int accelr = 1, accelg = 1, accelb = 1;
  
  Raindrop() { }
  
  void Generate() {   
    int len = int(random(1, 30));
    char[] s = new char[2*len];
  
    for(int i = 0; i < 2*len; i++) {
      int bit = int(random(33,96.1));
      if(bit < 58) {
        if(bit < 45)
          s[i++] = '0';
        else
          s[i++] = '1';
      }
      else
        s[i++] = char(bit);
      s[i] = '\n';
    }

    string = new String(s);
    x = random(0,800);
    y = -32 * len + 50;
    z = random(-800, 0);
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
  }
  
  void Update() {
    y += 10;
    if(y > 850)
      Generate();
  }
  
  void updateColor()
{
  r += int(random(0,random(5,15)))*accelr;
  g += int(random(0,random(5,15)))*accelg;
  b += int(random(0,random(5,15)))*accelb;
  if(r > 255) {
    r = 255;
    accelr = -1;
  }
  else if(r < 0) {
    r = 0;
    accelr = 1;
  }
  if(g > 255) {
    g = 255;
    accelg = -1;
  }
  else if(g < 0) {
    g = 0;
    accelg = 1;
  }
  if(b > 255) {
    b = 255;
    accelb = -1;
  }
  else if(b < 0) {
    b = 0;
    accelb = 1;
  }
}
}

