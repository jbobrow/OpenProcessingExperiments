
int x,y,m,r,s,c;


void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set backgrounwhited white
  colorMode(HSB);  //set colors to Hue, Saturation, Brightness mode(HSB);   
  x = width/2
  y = height/2
  r = 5; //set radius 
  s = 400; //set speed
  c = 100; //set color from
  c1 = 200; //set color to
}

void draw() {  //draw function spirals
 
 r = r+4/10
 m = millis();
 m = m/s
 
 if (r>300) r = 5
 
 fill(random(c,c1),200,200)
 noStroke();
 
 ellipse(cos(m)*r+x,sin(m)*r+y,10,10);
 
 
 
}
