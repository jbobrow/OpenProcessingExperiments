
PGraphics clock;
PGraphics sun;
PGraphics ground;

void setup(){
  
  size(700,400);
  background(255);
  smooth();
  
  clock = createGraphics(700,400,P2D);
  ground = createGraphics(700,400,P2D);
}
/*
float secs = map(second(), 0, 60, 0, 360);
float mins = map(minute(), 0, 60, 0, 360);
float hrs = map(hour() % 12, 0, 12, 0, 360);
*/

float s;
float m;
float h;

float sect = 1;
float mint = 1;
float hrst = 1;

float xs = 0;
float xm = 0;

float timepast = 0;
float speed;

void draw(){
  
  ground.beginDraw();
  
  ground.noStroke();
  ground.fill(128,50,50);
  ground.rect(0,height/2,width,height/2);
  ground.fill(255);
  ground.ellipse(width/2,height/2,130,130);
  
  ground.endDraw();
  
  stroke(255,2);
  strokeWeight(11);
  fill(255,30);
  ellipse(700/2,400/2,120,120);
  
  float s = second();
  float m = minute() * 60;
  float h = hour() * 3600;

  float time = s + m + h;
  
  
  float ss;
  float mm;
  float hh;
  
  time = time + speed;
  
  hh = time / 60 / 60;
  mm = time / 60;
  ss = time;

  float secs = map(ss, 0, 86400, 0, 518400);
  float mins = map(mm, 0, 1440, 0, 8640);
  float hrs = map(hh, 0, 24, 0, 720);
  
  clock = createGraphics(700,400,P2D);
  
  clock.beginDraw();
  clock.smooth();

  clock.translate(width/2,height/2);
  clock.rotate(radians(-90));
  
//  secs = secs * sect;
  
  clock.background(255,0);
  
 // mins = mins * mint;
 // hrs = hrs * hrst;
  clock.stroke(0);
  clock.strokeWeight(1);
  clock.line(0,0,cos(radians(secs))*65, sin(radians(secs))*65);
  clock.strokeWeight(2);
  clock.line(cos(radians(mins))*5, sin(radians(mins))*5,cos(radians(mins))*36, sin(radians(mins))*36);
  clock.line(cos(radians(hrs))*5, sin(radians(hrs))*5,cos(radians(hrs))*20, sin(radians(hrs))*20);
  
  float opac = map(speed,0,50000,10,100);
  float col = map(speed,100000,10000000,0,255);
  clock.fill(255-col,127-(col/2),0,opac);
  clock.stroke(255,127,0);
  clock.ellipse(cos(radians(mins))*51,sin(radians(mins))*51,24,24);
  clock.strokeWeight(1);
  clock.ellipse(cos(radians(hrs))*30,sin(radians(hrs))*30,16,16);
  clock.fill(255,170,0,10);
  clock.ellipse(cos(radians(hrs/2))*150,tan(radians(hrs/2))*100,40,40);
  
  clock.endDraw();
  
  image(clock,0,0);

  
  timepast = time;
  
  if (xs == 0){
    if (speed > 1){
      speed = speed * 0.99;
    } else {
      speed = 1;
    }}
  else{xs = xs - 1; speed = speed * (1 - ((100-xs)/10000));}
}

void mouseClicked(){
  if (speed<100000){
    speed = speed * 1.1;
  }xs = 130;
}

