
// for the SCU + MIT workshop 2010
// project: Under the River

Splash [] splashMatrix=new Splash[15];
boolean pressed;
int t;
int mx = 0;
int my = 0;


void setup() {
  size(600, 400);
  background(0);
  smooth();
}//end setup


void draw() {
  if(mousePressed==true)
    pressed=true;
  if(pressed==true && mousePressed==false){
    mx = mouseX;
    my = mouseY;
    splashMatrix[t]=new Splash(t, mx, my);
    t+=1;
    pressed=false;
    if(t==splashMatrix.length){
      t=0;
      background(255);
    }
  }
  for(int i=0; i<t; i++)
    splashMatrix[i].update(i);
  fade();
}//end draw


void fade(){
  noStroke();
  fill(0,30);
  rect(0,0, width, height);
}







