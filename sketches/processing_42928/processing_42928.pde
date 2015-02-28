
float ex,ey,angle,s;
float mx,my;
float vx,vy;
float Mx,My;
float jx,jy;
float sx,sy;
float ux,uy;
float nx,ny;
float ax,ay;
float moonx,moony;
  float rs = random(15);
  float rd = random(230,280);
  float rv = random(.12,.52);

void setup(){
  size(900,900);
  smooth();
  ex = 0;
  ey = 0;
  mx = 0;
  my = 0;
  vx = 0;
  vy = 0;
  Mx = 0;
  My = 0;
  jx = 0;
  jy = 0;
  sx = 0;
  sy = 0;
  ux = 0;
  uy = 0;
  nx = 0;
  ny = 0;
  ax = 0;
  ay = 0;
  moonx = 0;
  moony = 0;
  angle = 0;
  s = 1;
}

void draw(){
  background(0);
  fill(255,255,0);
  noStroke();
  ellipse(width/2,height/2,50,50); //sun
  
  //earth
  fill(5,255,23);
  ex = cos(radians(angle++)) * 150 + width/2;
  ey = sin(radians(angle)) * 150 + height/2;
  ellipse(ex,ey,20,20);
  //earth moon
  fill(250);
  moonx = cos(radians(ex/2)) * 20 + ex;
  moony = sin(radians(ey/2)) * 20 + ey;
  ellipse(moonx,moony,10,10);
  
  
  //mercury
  fill(240);
  mx = cos(radians(angle*4.16)) * 50 + width/2;
  my = sin(radians(angle*4.16)) * 50 + height/2;
  ellipse(mx,my,5,5);
  
  //venus
  fill(233,237,41);
  vx = cos(radians(angle*1.63)) * 100 + width/2;
  vy = sin(radians(angle*1.63)) * 100 + height/2;
  ellipse(vx,vy,18,18);
  
  //mars
  fill(183,32,24);
  Mx = cos(radians(angle*.53)) * 200 + width/2;
  My = sin(radians(angle*.53)) * 200 + height/2;
  ellipse(Mx,My,15,15);
  
  //asteroids
  /*/fill(240);
  ax = cos(radians(angle*rv)) * rd + width/2;
  ay = sin(radians(angle*rv)) * rd + width/2;
  ellipse(ax,ay,rs,rs);
  /*/
  //jupiter
  fill(180,157,109);
  jx = cos(radians(angle*.11)) * 300 + width/2;
  jy = sin(radians(angle*.11)) * 300 + height/2;
  ellipse(jx,jy,40,40);
  
  //saturn
  fill(214,145,6);
  sx = cos(radians(angle*.033)) * 350 + width/2;
  sy = sin(radians(angle*.033)) * 350 + height/2;
  ellipse(sx,sy,30,30);
  noFill();
  stroke(255);
  ellipse(sx,sy,50,25);
  noStroke();
  
  //uranus
  fill(73,151,227);
  ux = cos(radians(angle*.011)) * 400 + width/2;
  uy = sin(radians(angle*.011)) * 400 + height/2;
  ellipse(ux,uy,25,25);
  
  //neptune
  fill(10,92,250);
  nx = cos(radians(angle*.006)) * 430 + width/2;
  ny = sin(radians(angle*.006)) * 430 + height/2;
  ellipse(nx,ny,25,25);
  
}

