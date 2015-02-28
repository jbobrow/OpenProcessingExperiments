
//millis()は意味なし
//とおもったけどそんなことなかったぜ
float msx, msy;
float sx, sy;
float mx, my;
float hx, hy;
float ms;
float s;
float m;
float h;
float hp = HALF_PI;
void setup(){
  size(300, 300);
  noFill();
  textAlign(CENTER, CENTER);
  textSize(30);
}
void draw(){
  background(200,1);
  ms = map(millis(), 0, 1000, 0, 360);
  s = map(second(), 0, 60, 0, 360);
  m = map(minute(), 0, 60, 0, 360);
  h = map(hour(), 0, 24, 0, 360);

  msx = width/2 + 120*cos(radians(ms) - hp);
  msy = height/2 + 120*sin(radians(ms) - hp);
  sx = width/2 + 80*cos(radians(s) - hp);
  sy = height/2 + 80*sin(radians(s) - hp);
  mx = width/2 + 60*cos(radians(m) - hp);
  my = height/2 + 60*sin(radians(m) - hp);
  hx = width/2 + 30+cos(radians(h) - hp);
  hy = height/2 + 30+sin(radians(h) - hp);
  /*
  line(width/2, height/2, msx, msy);
  line(width/2, height/2, sx, sy);
  line(width/2, height/2, mx, my);
  line(width/2, height/2, hx, hy);
  */
  text(millis() % 1000, msx, msy);
  text(second(), sx, sy);
  text(minute(), mx, my);
  text(hour()%12, hx, hy);
}  


