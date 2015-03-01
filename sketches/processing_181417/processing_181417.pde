

//Info: http://processingjs.org/reference
void setup() {
  size(750,750);
  colorMode(HSB,100);
  smooth();
  noStroke();
  
}

int rotation=0;
int el=0;
int h=0;

void draw() {
  fill(245,10);
  rect(0,0,width,height);
  translate(width/2,height/2);
  rotate(rotation);
  fill(h,100,100,25);
  ellipse(el,el,el,el);
  rotation=rotation+90;
  el=(el+1)%150;
  h=(h+1)%100;
}
 


