
int n=0, s=120,i=0;
float a=radians(160*(3-sqrt(5))); // Golden angle
float r, x0, y0, x1, x2, y1, y2;
float rd=random(250), gr=random(250), bl=random(250) ;
 
void setup() {
  size(680, 480);
  smooth();
  background(0);
  strokeWeight(s);
  x0=width/2;
  y0=height/2;
}

void draw() {
  noStroke();
  fill(0,0,120);
line(mouseX,mouseY, 0, 120);
  r=2*(n+1)/5;
  x1=x0+2*r*cos(a*n);
  y1=y0+2*r*sin(a*n);
  r=2*(n+1)/5;
  x2=x0+2*r*cos(a*(n+1));
  y2=y0+2*r*sin(a*(n+1));
  stroke(rd, gr, bl);
  line(x1, y1, x2, y2);
///ellipse(0,140,200,120);
  point(x1, y1);
 if(n++==299) {
   n=2;
  rd=random(250);
   gr=random(250);
    bl=random(250);
    
    for(  int i= 1 ; i<50; i++)
    {
    
      fill(120,255,0);
      line(mouseX,mouseY,120,100);
  }
   
    if(mousePressed==true)
    {
      background(255);
    }else

    if(s>2) {
      strokeWeight(s/=2);
    }
    else {
      strokeWeight(s=120);

    }
  }
}


