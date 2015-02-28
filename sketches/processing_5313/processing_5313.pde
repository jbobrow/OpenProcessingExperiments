
float as, am, ah;
PImage hs,hm,hh;

float d=80; 
int num=5; 
float angle,xoff,yoff; 

void setup() {
  size(500,500);
  smooth();
  hs = loadImage("second.png");
  hm = loadImage("minute.png");
  hh = loadImage("hour.png");
}

void draw() {
  background(255,0,0);
  translate(width/2,height/2);

  noStroke();

//draw pentagon
 pushMatrix(); 
 
  for (int i=0; i<num; i++) { 
    if (i>0) { 
      translate(5*d,0); 
      angle=(num-2)*PI/num; 
      rotate(-(PI-angle)); 
    } 
    else { 
      xoff= -5*d/2; 
      yoff= 5*d*tan(angle/2)/2; 
      translate(xoff,yoff); 
    } 
    float angle2 = (PI-angle)/2; 
    float x1= 5*d*cos(angle2); 
    float y1= -5*d*sin(angle2); 
    float x2= 5*d*cos(angle-angle2); 
    float y2= -5*d* sin(angle-angle2); 
    fill(255,255,0); 
    triangle(0,0, x1,y1,x2,y2); 
  } 
  popMatrix();

  int s = second();
  int m = minute();
  int h =hour();

  as = map (s, 0, 60, 0, TWO_PI);
  am = map (m, 0, 60, 0, TWO_PI);
  ah = map (h%12, 0, 12, 0, TWO_PI);

  //as =am =ah =0;

  pushMatrix();
  rotate(as-PI);
  image(hs, -30, -10);
  popMatrix();

  pushMatrix();
  rotate(am-PI);
  image(hm, -40, -10);
  popMatrix();

  pushMatrix();
  rotate(ah-PI);
  image(hh, -50, -10);
  popMatrix();

  println(s);
  println(m);
  println(h);




}


