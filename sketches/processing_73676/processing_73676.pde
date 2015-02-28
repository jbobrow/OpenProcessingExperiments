
void setup(){
size(600,600);
}

void draw(){
background(0);


int radiusae = 40;
for( int deg = 150; deg < 360; deg += 12){
  fill(0,255,99,80);
  float angle = radians(deg);
  float x = 319 + (cos(angle) * radiusae);
  float y = 300 + (sin(angle) * radiusae);
  ellipse(x,y,6,6);
}

int radiusa = 60;
for( int deg = 0; deg < 250; deg += 12){
  fill(0,255,189,100);
  float angle = radians(deg);
  float x = 300 + (cos(angle) * radiusa);
  float y = 300 + (sin(angle) * radiusa);
  ellipse(x,y,6,6);
}

int radius = 80;
for( int deg = 250; deg < 480; deg += 12){
  fill(0,249,255,120);
  float angle = radians(deg);
  float x = 300 + (cos(angle) * radius);
  float y = 320 + (sin(angle) * radius);
  ellipse(x,y,10,10);
}

int radiu = 100;
for( int deg = 120; deg < 360; deg += 12){
  fill(0,159,255,140);
  float angle = radians(deg);
  float x = 300 + (cos(angle) * radiu);
  float y = 300 + (sin(angle) * radiu);
  ellipse(x,y,13,13);
}

int radi = 140;
for( int deg = 0; deg < 250; deg += 12){
  fill(0,70,255,160);
  float angle = radians(deg);
  float x = 270 + (cos(angle) * radi);
  float y = 300 + (sin(angle) * radi);
  ellipse(x,y,13,13);
}

int rad = 180;
for( int deg = 250; deg < 550; deg += 12){
  fill(0,44,255,180);
  float angle = radians(deg);
  float x = 280 + (cos(angle) * rad);
  float y = 340 + (sin(angle) * rad);
  ellipse(x,y,18,18);
}

int ra = 220;
for( int deg = 190; deg < 400; deg += 12){
  fill(50,0,255,200);
  float angle = radians(deg);
  float x = 305 + (cos(angle) * ra);
  float y = 340 + (sin(angle) * ra);
  ellipse(x,y,23,23);
}

int re = 250;
for( int deg = 40; deg < 280; deg += 12){
  fill(135,0,255,220);
  float angle = radians(deg);
  float x = 280 + (cos(angle) * re);
  float y = 320 + (sin(angle) * re);
  ellipse(x,y,26,26);
}

int r = 300;
for( int deg = 270; deg < 400; deg += 12){
  fill(182,0,255,220);
  float angle = radians(deg);
  float x = 315 + (cos(angle) * r);
  float y = 365 + (sin(angle) * r);
  ellipse(x,y,30,30
  );
}
}

