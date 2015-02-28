
//set width
float w;


//set stroke weight
float sw=0; 

//set keyboard counter 
int counter;

//shake ranges
int range=2;

//set color
color c1=color(255,120,30,80);
color c2=color(80,210,255,100);
color c3=color(220,240,255,190);

//set interval(margin)
float ivx=25;
float ivy=25;

//set y direction
float a; 
float b;
float c;
float d;
float e;
float f;

//set x direction each characters
float r1;
float i1;
float s1;
float d1;




//setup 
void setup () {
  size (650,300);
  smooth();
  w=0;
}


//draw
void draw(
) {
  fadeToWhite();

  r1=mouseX;
  a=mouseY;

  i1=r1+ivx*6;
  s1=i1+ivx*3;
  d1=s1+ivx*8;

  b=a+ivy;
  c=b+ivy;
  d=c+ivy;
  e=d+ivy;
  f=e+ivy;

  fill(c1);
  stroke(c2);
  strokeWeight(sw);

  drawR();
  drawI();
  drawS();
  drawD();
}

//mouse
void mousePressed() {
  w=w+1;
  sw=sw+0.2;
  if(w>=40) {
    w=1;
    sw=1;
  }
}

//fadeout
void fadeToWhite() {
  noStroke();
  fill(255,255,255,90);
  rectMode(CORNER);
  rect(0,0,width,height);
}

//save as jpg
void keyPressed() {
  if(keyPressed) {
    if (key=='s'||key=='S') {
      //jpg
      save("myimage" +counter+ ".jpg");
      counter++;
    }
  }
}

//r
void drawR() {

  float r2=r1+ivx;
  float r3=r2+ivx;
  float r4=r3+ivx;
  float r5=r4+ivx;



  ellipse(r1+random(-range,range),c+random(-range,range),w,w);
  ellipse(r1+random(-range,range),d+random(-range,range),w,w);
  ellipse(r1+random(-range,range),e+random(-range,range),w,w);
  ellipse(r1+random(-range,range),f+random(-range,range),w,w);

  ellipse(r2+random(-range,range),b+random(-range,range),w,w);
  ellipse(r2+random(-range,range),c+random(-range,range),w,w);
  ellipse(r2+random(-range,range),d+random(-range,range),w,w);
  ellipse(r2+random(-range,range),e+random(-range,range),w,w);
  ellipse(r2+random(-range,range),f+random(-range,range),w,w);

  ellipse(r3+random(-range,range),b+random(-range,range),w,w);
  ellipse(r4+random(-range,range),b+random(-range,range),w,w);
  ellipse(r5+random(-range,range),b+random(-range,range),w,w);
}

//i
void drawI() {

  float i2=i1+ivx;


  ellipse(i1+random(-range,range),a+random(-range,range),w,w);
  ellipse(i1+random(-range,range),c+random(-range,range),w,w);
  ellipse(i1+random(-range,range),d+random(-range,range),w,w);
  ellipse(i1+random(-range,range),e+random(-range,range),w,w);
  ellipse(i1+random(-range,range),f+random(-range,range),w,w);

  ellipse(i2+random(-range,range),a+random(-range,range),w,w);
  ellipse(i2+random(-range,range),c+random(-range,range),w,w);
  ellipse(i2+random(-range,range),d+random(-range,range),w,w);
  ellipse(i2+random(-range,range),e+random(-range,range),w,w);
  ellipse(i2+random(-range,range),f+random(-range,range),w,w);
}

//s
void drawS() {


  float s2=s1+ivx;
  float s3=s2+ivx;
  float s4=s3+ivx;
  float s5=s4+ivx;
  float s6=s5+ivx;
  float s7=s6+ivx;


  ellipse(s1+random(-range,range),c+random(-range,range),w,w);
  ellipse(s1+random(-range,range),d+random(-range,range),w,w);
  ellipse(s1+random(-range,range),f+random(-range,range),w,w);

  ellipse(s2+random(-range,range),b+random(-range,range),w,w);
  ellipse(s2+random(-range,range),c+random(-range,range),w,w);
  ellipse(s2+random(-range,range),d+random(-range,range),w,w);
  ellipse(s2+random(-range,range),f+random(-range,range),w,w);

  ellipse(s3+random(-range,range),b+random(-range,range),w,w);
  ellipse(s3+random(-range,range),d+random(-range,range),w,w);
  ellipse(s3+random(-range,range),f+random(-range,range),w,w);

  ellipse(s4+random(-range,range),b+random(-range,range),w,w);
  ellipse(s4+random(-range,range),d+random(-range,range),w,w);
  ellipse(s4+random(-range,range),f+random(-range,range),w,w);

  ellipse(s5+random(-range,range),b+random(-range,range),w,w);
  ellipse(s5+random(-range,range),d+random(-range,range),w,w);
  ellipse(s5+random(-range,range),f+random(-range,range),w,w);

  ellipse(s6+random(-range,range),b+random(-range,range),w,w);
  ellipse(s6+random(-range,range),d+random(-range,range),w,w);
  ellipse(s6+random(-range,range),e+random(-range,range),w,w);
  ellipse(s6+random(-range,range),f+random(-range,range),w,w);

  ellipse(s7+random(-range,range),b+random(-range,range),w,w);
  ellipse(s7+random(-range,range),d+random(-range,range),w,w);
  ellipse(s7+random(-range,range),e+random(-range,range),w,w);
}

//d
void drawD() {


  float d2=d1+ivx;
  float d3=d2+ivx;
  float d4=d3+ivx;
  float d5=d4+ivx;
  float d6=d5+ivx;
  float d7=d6+ivx;


  ellipse(d1+random(-range,range),c+random(-range,range),w,w);
  ellipse(d1+random(-range,range),d+random(-range,range),w,w);
  ellipse(d1+random(-range,range),e+random(-range,range),w,w);

  ellipse(d2+random(-range,range),b+random(-range,range),w,w);
  ellipse(d2+random(-range,range),c+random(-range,range),w,w);
  ellipse(d2+random(-range,range),d+random(-range,range),w,w);
  ellipse(d2+random(-range,range),e+random(-range,range),w,w);
  ellipse(d2+random(-range,range),f+random(-range,range),w,w);

  ellipse(d3+random(-range,range),b+random(-range,range),w,w);
  ellipse(d3+random(-range,range),f+random(-range,range),w,w);

  ellipse(d4+random(-range,range),b+random(-range,range),w,w);
  ellipse(d4+random(-range,range),f+random(-range,range),w,w);

  ellipse(d5+random(-range,range),b+random(-range,range),w,w);
  ellipse(d5+random(-range,range),f+random(-range,range),w,w);

  ellipse(d6+random(-range,range),a+random(-range,range),w,w);
  ellipse(d6+random(-range,range),b+random(-range,range),w,w);
  ellipse(d6+random(-range,range),c+random(-range,range),w,w);
  ellipse(d6+random(-range,range),d+random(-range,range),w,w);
  ellipse(d6+random(-range,range),e+random(-range,range),w,w);
  ellipse(d6+random(-range,range),f+random(-range,range),w,w);

  ellipse(d7+random(-range,range),a+random(-range,range),w,w);
  ellipse(d7+random(-range,range),b+random(-range,range),w,w);
  ellipse(d7+random(-range,range),c+random(-range,range),w,w);
  ellipse(d7+random(-range,range),d+random(-range,range),w,w);
  ellipse(d7+random(-range,range),e+random(-range,range),w,w);
}               
