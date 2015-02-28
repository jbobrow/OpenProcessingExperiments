
float px, py,px1,px2,py2,px3,py3;
float angle,angle2,angle3;
float radius = 50;
float x;
float a, b;

void setup(){
  size(720,480);
  background(250);
  angle=0;
}

void draw(){
//background(200);
fill(200,15);
rect(0,0,720,480);
  a=mouseX;
  b=mouseY;
  radius=sqrt(sq(a/2)+sq(b/2));
  angle--;
  angle2-=2;
  angle3-=3;
  fill(255,70);
 noStroke();
  ellipseMode(RADIUS);
  
  px = 360+ cos(radians(angle))*(radius)/2;
  py = 240 + sin(radians(angle))*(radius)/2;
 
  
  px2 = 360+ cos(radians(angle2))*(radius);
  py2 = 240 + sin(radians(angle2))*(radius);
  
  px3 = 360+ cos(radians(angle3))*(radius)/4;
  py3 = 240 + sin(radians(angle3))*(radius)/4;
  
  
  ellipseMode(CENTER);
  fill(240,20,80,100);
  //draw rectangle
  ellipse (px, py, radius/10-5, radius/10-5);
  ellipse (px2, py2, radius/5, radius/5);
  ellipse (px3, py3, radius/2, radius/2);


}


