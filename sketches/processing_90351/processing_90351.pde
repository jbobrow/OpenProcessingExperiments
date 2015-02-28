
float x;
float y;
float x2;
float y2;
float x3;
float y3;
float r;
float g;
float b;
float a;

void setup(){
  size(1320,1240);
  frameRate(1000000);
}

void draw(){
background(random(255),random(255),random(255));

  x= random(1320);
  y=random(1240);
  x2=random(1320);
  y2=random(1240);
  x3=random(1320);
  y3=random(1240);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
fill(r,g,b,a);
triangle(430, 475, 458, 420,486, 475);

fill(0);
triangle(330, 375, 358, 320, 386, 375);
fill(0);
triangle(530, 575, 558, 520, 586, 575);
fill(r,g,b,a);
triangle(630, 675, 658, 620, 686, 675);
fill(0);
triangle(131, 460, 966, 488,611, 812);
  
  fill(255);
  ellipse(x,y,170,80);

 fill(r,g,b,a);
  ellipse(x,y,80,80);
  fill(0);
  ellipse(x,y,50,50);
  

  
}


