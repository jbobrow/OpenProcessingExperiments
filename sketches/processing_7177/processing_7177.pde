
boolean glaettung;
boolean drehung;

PFont schrift = createFont("Monospaced", 11);
float b1 = 100; 
float b2 = 100;
float h1 = 100;
float h2 = 100;
float r = 25;
float t1 = 0.5;
float t2 = 2;
int k = 5;

void setup()
{
  size(700, 500);
  textFont(schrift);
}

void draw()
{
  if(!glaettung) smooth(); 
  else noSmooth();
  background(230);
  
  stroke(107);
  fill(141);
  if(k > 0) strokeWeight(k); else noStroke();
  rrect(width / 3, height / 7 * 2, b1, h1, r, t2, "MITTELPUNKT");
  pushMatrix();
  translate(width / 3 * 2, height / 7 * 2);
  if(drehung) rotate(0.7853982);
  rrect2(0, 0, b2, h2, t1, "MITTELPUNKT");
  popMatrix();

  fill(23);
  String s1 = "left object:\n\'q\' - width\n\'w\' + width\n\'e\' - height\n\'d\' + height\n\'a\' - corner radius\n\'s\' + corner radius\n\'r\' - tightness\n\'f\' + tightness";
  String s2 = "right object:\n\'u\' - width\n\'i\' + width\n\'o\' - height\n\'l\' + height\n\'j\' - tightness\n\'k\' + tightness\n\'p\' 45° rotation";
  String s3 = "both:\n\'n\' - stroke weight\n\'m\' + stroke weight\n\'x\' on/off smoothing";
  float tx = (width - textWidth(s1) - textWidth(s2) - textWidth(s3)) / 4;
  float ty = height / 12 * 7;
  text(s1, tx, ty);
  text(s2, textWidth(s1) + tx * 2, ty);
  text(s3, textWidth(s1) + textWidth(s2) + tx * 3, ty);
  text("b = " + b1 + "\nh = " + h1 + "\nr = " + r + "\nt = " + t2, width / 3 - b1 / 2 - 75, height / 8 * 2);
  text("b = " + b2 + "\nh = " + h2 + "\nt = " + t1, width / 3 * 2 + b2 / 2 + 25, height / 8 * 2);
}

void rrect(float x, float y, float b, float h, float r, float t, String m)
{
  if(m == "MITTELPUNKT")
  {
    x = x - b / 2;
    y = y - h / 2;
  }
  //  if(r > b / 2 || r > h / 2) println("Radius zu groß.");
  beginShape();
  vertex(x, y + r);
  bezierVertex(x, y + r / t, x + r / t, y, x + r, y);
  vertex(x + b - r, y);
  bezierVertex(x + b - r / t, y, x + b, y + r / t, x + b, y + r);
  vertex(x + b, y + h - r);
  bezierVertex(x + b, y + h - r / t, x + b - r / t, y + h, x + b - r, y + h);
  vertex(x + r, y + h);
  bezierVertex(x + r / t, y + h, x, y + h - r / t, x, y + h - r);
  //  vertex(x, y + r);
  endShape(CLOSE);
}

void rrect2(float x, float y, float b, float h, float t, String m)
{
  String s = "x = " + x + "\ny = " + y + "\nb = " + b + "\nh = " + h + "\nt = " + t;
  if(m == "MITTELPUNKT")
  {
    x = x - b / 2;
    y = y - h / 2;
  }
  curveTightness(t); // konkav > -2.2 > konvex // -0.66 = kreis // konkav > 1
  beginShape();
  curveVertex(x + b, y);
  curveVertex(x, y);
  curveVertex(x, y + h);
  curveVertex(x + b, y + h);
  curveVertex(x + b, y);
  curveVertex(x, y);
  curveVertex(x, y + h);
  endShape(CLOSE);
}

void keyPressed()
{
  if(key == 'x') glaettung = !glaettung;
  if(key == 'q') b1 -= 1;
  if(key == 'w') b1 += 1;
  if(key == 'e') h1 -= 1;
  if(key == 'd') h1 += 1;
  if(key == 'a') r -= 1;
  if(key == 's') r += 1;
  if(key == 'r') t2 -= .1;
  if(key == 'f') t2 += .1;
  
  if(key == 'u') b2 -= 1;
  if(key == 'i') b2 += 1;
  if(key == 'o') h2 -= 1;
  if(key == 'l') h2 += 1;
  if(key == 'j') t1 -= .01;
  if(key == 'k') t1 += .01;
  if(key == 'p') drehung = !drehung;
  
  if(key == 'n' && k > 0) k -= 1;
  if(key == 'm') k += 1;
}

