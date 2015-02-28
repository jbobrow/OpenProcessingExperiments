
int[] b = new int[9];
int c;
int inc=1;
int dia=20;

boolean firstTime=true;
void setup() {
  size((dia)*b.length, dia);
  b[0]=255;
}

void draw() {
  update();


  drawCircles();
}

void drawCircles() {
  for (int i=0; i<b.length; i++) {
    fill(b[i]);
    ellipse(i*dia+dia/2, dia/2, dia, dia);
  }
}

void update() {
  b[(c+1)%b.length]=b[(c+1)%b.length]+inc;
  b[(c+b.length-1)%b.length]-=inc;
  if(b[(c+b.length-1)%b.length]<0)b[(c+b.length-1)%b.length]=0; 
  if (b[(c+1)%b.length] >=255) { 
    b[(c+1)%b.length]=255; 
    c=(c+1)%b.length;
  }
}



