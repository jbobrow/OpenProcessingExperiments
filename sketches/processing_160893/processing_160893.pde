
float col;  //color 0~255
float xnoise,ynoise;
float x,y;
float rad;
float radius;
float radiusnoise;
float angle =-PI/2;
float angnoise;
float change;

void setup(){
  frameRate(30);
  size(560,400);
  background(255);
  col = 0;
  x = 0;
  y = height/2;
  rad = 0;
  change = 1;
}

void draw(){
  
  xnoise = random(10)-5;
  ynoise = random(10)-5;
  angnoise = random(10);
  radiusnoise = random(10);
  
  x += cos(PI+xnoise)*noise(random(10));
  y += (sin(PI+ynoise)*5)*noise(random(10));
  col += change;
  
  if(col >255)  change = -1;
  if(col < 0)  change = 1;
  
  angnoise += 0.005;
  angle += (noise(angnoise))-1;
  if(angle >360)  angle -= 360;
  if(angle <0)  angle += 360;
  
  radiusnoise += 0.005;
  radius = noise(radiusnoise)*10;
  
  rad = radians(angle);
  float opprad = rad +PI;
  float x2 = x +(radius*cos(opprad))*50;
  float y2 = y +(radius * sin(opprad))*50;
  
  strokeWeight(1);
  stroke(col,60);
  line(x,y,x2,y2);
  
 // saveFrame("output/sequence_####.jpg");
}


