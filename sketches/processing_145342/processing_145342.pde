
/* @pjs preload="1.jpg"; */ 
PImage img;
float a;
float s;
int m=0;
long timeToWait = 2000;// in miliseconds
long lastTime;

void setup(){
  size(300,300);
  background(255);
  img = loadImage("1.jpg");
  img.resize(0,300);
  image(img,0,0);
  rectMode(CENTER);
  colorMode(HSB,360,100,100);
  lastTime = millis();
}

void draw(){
  a = a + 0.04;
  s = cos(a)*2;
  if( millis() - lastTime > timeToWait){
  for(int j =0;j<10000;j++){
    if(j==9999){
      m++;
  for(int i=0;i<300;i+=10){
  translate(width/2, height/2);
  scale(s);
  int r = int(random(0,360));
  fill(r,100,100); 
  rect(0+i, 0+i, 25, 25); }
  image(img,0,0);
  if(m==100){
  filter(INVERT);
   m=0;
   }
    }
}
  }
}


