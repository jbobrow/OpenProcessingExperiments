
float x, y;
float angle = PI/7;
float r  ; //200;
float diff = 1;
float a = 1;
float red = 10;
float speed=PI*100000000;
float counter=speed;
float anglectrl;
float rotctrl;
float rot=1;
boolean  FractionOfPI=true;
PVector spin;
int maxiter=10;

void setup() {
  size(500, 500);
  background(0,0,0); 
spin= new PVector ( r * cos(angle),  r * sin(angle));
}
  
void draw() {
  stroke(255,100);
  int niter=1; 
   anglectrl = PI /   round (0 +  ( map(mouseX,0,width, 1, 1.4* TWO_PI)));
   rotctrl = PI /    round (0 +  ( map(mouseY,0,height, 1, 1.4* TWO_PI)));
    pushMatrix();
      translate(width/2, height/2);
          rot=rot+ rotctrl;

      rotate(rot);
      drawcircle( spin, anglectrl, rotctrl,niter, maxiter);
    popMatrix();
}
 
void drawcircle(  PVector spin, float anglectrl, float rotctrl, int niter,int maxiter) {
   niter++; 
  if (niter <maxiter){
    angle = angle + anglectrl ;
    r= 400*2 /niter ; //try to multiply by sin( maxiter/niter* PI/2)
    spin.x=  r * cos(angle);
    spin.y=  r * sin(angle);
    color col = color(niter*10, niter*30, 300/niter, niter*15);  
    fill(col);
    strokeWeight(2/niter);
    ellipse(0, 0, spin.x, spin.y);
    
  drawcircle(   spin, anglectrl, rotctrl, niter, maxiter);
}
}

void mousePressed() {
background(0);
  if (mouseButton ==RIGHT) { maxiter--;}
  if (mouseButton ==LEFT) { maxiter++;}
  if(maxiter <0){maxiter=0;}
  if (mouseButton ==CENTER) { anglectrl=0; rotctrl=0;}
}
