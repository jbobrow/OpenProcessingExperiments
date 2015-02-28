
float x, y, a, b,radius, angle;

void setup(){
  size (500,500);
  x = 0;
  y = 0;
  a = width/2;
  b = height/2;
  angle = 0;
  radius = 0;
  smooth();
}

void draw(){
  tint(255,random(1,255));
  background(random(1,255));
  
  a += .1;
  b += .1;
  x = cos(radians(angle)) * radius ;
  y = sin(radians(angle)) * radius ;
  stroke(random(1,255));
  line(a,b,x,y);
  //stroke(random(1,255));
  //line(x,y,a,b);
  radius +=.1;
  angle += noise(.1);
  //fill(255,255,255,random(1,100));
  //rect(0,0,width,height);
  
  if(radius >= 5){
      stroke(random(1,255));
      line(a,b,x,y);
      a ++;
      b++;
  }

}

