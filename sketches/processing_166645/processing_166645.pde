
float sqw = 25;
int incr = 15;


float tw = 0;


void setup() {
  size(400,400);
}

void draw() {
  float alpha = PI/4;
  float hsq = sqw * sqrt(2);
  float lux = mouseX- hsq*cos(abs(alpha-PI/2-tw));
  float luy = mouseY- hsq*sin(abs(alpha-PI/2-tw));
  float llx = mouseX - hsq*cos(abs(tw-alpha));
  float lly = mouseY + hsq*sin(abs(tw-alpha));
  float rux = mouseX + hsq*cos(abs(tw-alpha));
  float ruy = mouseY-hsq*sin(abs(tw-alpha));
  float rlx = mouseX+hsq*cos(abs(tw+alpha));
  float rly = mouseY+hsq*sin(abs(tw+alpha));

  float ang1 = atan(luy/lux);
  float ang2 = atan((height-lly)/llx);
  float ang3 = atan(ruy/(width-rux));
  float ang4 = atan((height-rly)/(width-rlx));
  
  float hy1 = sqrt(sq(lux)+sq(luy));
  float hy2 = sqrt(sq(llx)+sq(height-lly));
  float hy3 = sqrt(sq(width-rux)+sq(ruy));
  float hy4 = sqrt(sq(height-rly)+sq(width-rlx));

  background(#FF8D00);
  noFill();
  stroke(255);
  strokeWeight(4);
  line(0,0,lux, luy);
  line(width,0,rux,ruy);
  line(width,height,rlx, rly);
  line(0,height,llx, lly);
  line(lux, luy,llx, lly);
  line(lux, luy,rux, ruy);
  line(rux,ruy,rlx,rly);
  line(rlx, rly,llx, lly);
  
  float tw_inc = (PI/2)/(0.75*width);
  tw = (mouseX-width/2)*tw_inc;
  
  float zm = 0.1;
  sqw = (mouseY)*zm;
  
  for (int st = 1; st < incr; st = st + 1){
     beginShape();
     vertex(lux-st*(hy1/incr)*cos(ang1),luy-st*(hy1/incr)*sin(ang1));
     vertex(llx-st*(hy2/incr)*cos(ang2),lly+st*(hy2/incr)*sin(ang2));
     vertex(rlx+st*(hy4/incr)*cos(ang4),rly+st*(hy4/incr)*sin(ang4));
     vertex(rux+st*(hy3/incr)*cos(ang3),ruy-st*(hy3/incr)*sin(ang3));
     endShape(CLOSE);
  }
}
