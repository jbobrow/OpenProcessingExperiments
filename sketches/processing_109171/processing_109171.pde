
int a, r, s, c;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  a = 0;
  r = height/7;
  s = 1;
  c = 0;
}

void draw() {  //draw function loops
 
  int x = width/2+cos(a)*r;
  int y = height/2+sin(a)*r;
  
  noStroke();
  fill(c % 250,255,180);
  ellipse(x,y,s,s);
  
  a+=4*PI/360;
  c++;
  s = 1+c/90;
  
}
