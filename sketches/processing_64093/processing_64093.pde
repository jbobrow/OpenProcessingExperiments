
float merc;
float v;
float e;
float m;
float j;
float sat;
float dia;
float scalar;
int offset;
float speed = PI/180;

void setup() {

  size(750, 750);
  smooth();
}



void draw() {

  background(0);
  

  
  scalar = 60;
  offset = 100;
  dia = 20;

  fill(255);
  float sv = random(0, 10); //these are random stars
  int svalue = int(sv);
  float sx = random(0, width);
  int starx = int(sx);
  float sy = random(0, height);
  int stary= int(sy);
  ellipse(sx, sy, svalue, svalue);


  float mercx = width/2+(cos(merc) * scalar); //mercury
  float mercy = height/2+(sin(merc) * scalar); 
  float vx = width/2+(cos(v) * scalar*1.5); //venus
  float vy = height/2+(sin(v) * scalar*1.5); 
  float ex = width/2+(cos(e) * scalar*2); //earth
  float ey = height/2+(sin(e) * scalar*2);
  float mx = width/2+(cos(m) * scalar*2.5); //mars
  float my =  height/2+(sin(m) * scalar*2.5);
  float jx =  width/2+(cos(j) * scalar*4); //jupiter
  float jy =  height/2+(sin(j) * scalar*4); 
  float satx = width/2+(cos(sat) * scalar*5); //saturn
  float saty = height/2+(sin(sat) * scalar*5);


fill(255);
  ellipse(mercx, mercy, 10, 10);
  ellipse(vx, vy, 15, 15);
  ellipse(ex, ey, 17, 17);
  ellipse(mx, my, 18, 18);
  ellipse(jx, jy, 40, 40);
  ellipse(satx, saty, 25, 25);

  ellipse(width/2, height/2, 65, 65); //sun
  
  noFill();
  stroke(255);
  ellipse(satx, saty, 47, 40);
  
    for(int i=0; i< 10; i++){
    ellipse(width/2, height/2, scalar*i, scalar*i);
  }
  merc += speed;
  v += speed/1.5;
  e += speed/2;
  m += speed/2.5;
  j += speed/4;
  sat += speed/5;
}


