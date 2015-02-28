
float a=100;
float b=100;
float c=100;
float d=100;
float e=100;
float f=100;
float g=100;
float h=100;
float i=100;
float j=100;
float k=100;
float l=100;
float m=100;
float n=100;
float o=100;
float p=100;
void setup(){
  size (500,500);
  background(0);
}
void draw(){
//  
   
  float R = random (0);
  float G = random (100,150);
  float B= random (100,200);
  fill (R,G,B, 50);
  noStroke();
  if (mousePressed == true){
  float r =random(-10,10);
  
  a = a+((mouseX-a)/5.0);
  b = b+((mouseY-b)/5.0);
  c = c+((mouseX-c)/10.0);
  d = d+((mouseY-d)/10.0);
  e = e+((mouseX-e)/15.0);
  f = f+((mouseY-f)/15.0);
  g = g+((mouseX-g)/20.0);
  h = h+((mouseY-h)/20.0);
  i = i+((mouseX-i)/25.0);
  j = j+((mouseY-j)/25.0);
  k = k+((mouseX-k)/30.0);
  l = l+((mouseY-l)/30.0);
  m = m+((mouseX-m)/35.0);
  n = n+((mouseY-n)/35.0);
  o = o+((mouseX-o)/40.0);
  p = p+((mouseY-p)/40.0);
  
  /*a = a+((mouseX-a)/10.0);
  b = b+((mouseY-b)/10.0);
  c = c+((mouseX-c)/10.0);
  d = d+((mouseY-d)/10.0);
  e = e+((mouseX-e)/10.0);
  f = f+((mouseY-f)/10.0);
  g = g+((mouseX-g)/10.0);
  h = h+((mouseY-h)/10.0);
  i = i+((mouseX-i)/10.0);
  j = j+((mouseY-j)/10.0);
  k = k+((mouseX-k)/10.0);
  l = l+((mouseY-l)/10.0);
  m = m+((mouseX-m)/10.0);
  n = n+((mouseY-n)/10.0);
  o = o+((mouseX-o)/10.0);
  p = p+((mouseY-p)/10.0);*/
  
  ellipse(mouseX, mouseY, r, r);
  ellipse (a, b, r, r);
  ellipse (c, d, r, r);
  ellipse (e, f, r, r);
  ellipse (g, h, r, r);
  ellipse (i, j, r, r);
  ellipse (k, l, r, r);
  ellipse (m, n, r, r);
  ellipse (o, p, r, r);
  
  }else{
    float r =random(-20,20);
    ellipse(mouseX, mouseY, r, r);
  }
  }

