
float sqw = 25;
int incr = 15;
float x = 50;
float y = 50;
float beta = 0;
float tw = 0;
float tw_pos = 1;
float dir = 1;
int value = 0;

void setup() {
  size(600,600);
  
}

void draw() {
  float jitterx = 0; //random(-1,1);
  float jittery = 0; //random(-1,1);
  float r = width/3.5;
  
  x = width/2 + (r * cos(beta));
  y = height/2 + (r * sin(beta));
  beta = beta + PI/180;
  
  float alpha = PI/4;
  float hsq = sqw * sqrt(2);
  float lux = jitterx + x - hsq*cos(abs(alpha-PI/2-tw));
  float luy = jittery + y - hsq*sin(abs(alpha-PI/2-tw));
  float llx = jitterx + x - hsq*cos(abs(tw-alpha));
  float lly = jittery + y + hsq*sin(abs(tw-alpha));
  float rux = jitterx + x + hsq*cos(abs(tw-alpha));
  float ruy = jittery + y -hsq*sin(abs(tw-alpha));
  float rlx = jitterx + x +hsq*cos(abs(tw+alpha));
  float rly = jittery + y +hsq*sin(abs(tw+alpha));

  float ang1 = atan(luy/lux);
  float ang2 = atan((height-lly)/llx);
  float ang3 = atan(ruy/(width-rux));
  float ang4 = atan((height-rly)/(width-rlx));
  
  float hy1 = sqrt(sq(lux)+sq(luy));
  float hy2 = sqrt(sq(llx)+sq(height-lly));
  float hy3 = sqrt(sq(width-rux)+sq(ruy));
  float hy4 = sqrt(sq(height-rly)+sq(width-rlx));

  background(0);
  noFill();
  stroke(255);
  strokeWeight(3);
  if (value == 1) {
    background(255);
    stroke(0, 0, 255, 100);
    line(0,0,lux, luy);
    line(width,0,rux,ruy);
    line(width,height,rlx, rly);
    line(0,height,llx, lly);
  }
  line(lux, luy,llx, lly);
  line(lux, luy,rux, ruy);
  line(rux,ruy,rlx,rly);
  line(rlx, rly,llx, lly);
  
   
  float tw_inc = (PI/2)/(0.75*width);
    
  if (tw_pos > width-50) {
    dir = -1;
  }
  if (tw_pos < 50) {
    dir = 1;
  }
  tw_pos = tw_pos + dir;
  tw = (tw_pos-width/2)*tw_inc;
  
  
  float zm = 0.15;
  sqw = (tw_pos)*zm;
  
  for (int st = 1; st < incr; st = st + 1){
     beginShape();
     vertex(lux-st*(hy1/incr)*cos(ang1),luy-st*(hy1/incr)*sin(ang1));
     vertex(llx-st*(hy2/incr)*cos(ang2),lly+st*(hy2/incr)*sin(ang2));
     vertex(rlx+st*(hy4/incr)*cos(ang4),rly+st*(hy4/incr)*sin(ang4));
     vertex(rux+st*(hy3/incr)*cos(ang3),ruy-st*(hy3/incr)*sin(ang3));
     endShape(CLOSE);
  }
}

void mouseClicked() {
  if (value == 1) {
    value = 0;
  } else {
    value = 1;
  }
}
