
float delta = 5;
float delta2 = 20;
float r = 200;

PFont font;
void setup() {
  size(600,600,P3D);
  font = loadFont("NanumBrush-48.vlw");
  textFont(font);
  background(0);
}

void draw() {
  
  translate(width/2, height/2);

  String s = "o";
    
  for (float deg = 0; deg < 360; deg += delta) {
    for (float deg2 = 0; deg2 < 360; deg2 += delta) {
      float theta = radians(deg);
      float phi = radians(deg2);
      float x = r * sin(phi) * cos(theta);
      float y = r * sin(phi) * sin(theta);
      float z = r * cos(phi);
      noStroke();
      
      float sz = random(10,30);

      int substrbegin = (int)random(0, s.length()-1);
      int substrend = (int)random(substrbegin+1, s.length()-1);
      textSize(sz);
      fill(200);
      text(s.substring(substrbegin, substrend), x, y, z);
    }
  }
}
