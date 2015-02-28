
int ch1, ch2, ch3, help, x1, y1, x2=250, y2=250;

void setup(){
  size(500,500);
  background(0);
  noStroke();
  ch1=int(random(256));
  ch2=int(random(256));
  ch3=int(random(256));
}

void draw(){
  help=int(random(-2,2))*10;
  switch(int(random(4))){
    case 1: ch1+=help; break;
    case 2: ch2+=help; break;
    case 3: ch3+=help;
  }
  if(ch1<0) ch1+=10;
  if(ch2<0) ch2+=10;
  if(ch3<0) ch3+=10;
  if(ch1>255) ch1-=10;
  if(ch2>255) ch2-=10;
  if(ch3>255) ch3-=10;
  fill(color(ch1, ch2, ch3));
  if(int(random(2))==1) x2+=help;
  else y2+=help;
  if(x2==0) x2+=10;
  if(x2==490) x2-=10;
  if(y2==0) y2+=10;
  if(y2==490) y2-=10;
  rect(x2, y2, 10, 10);
  x1=x2;
  y1=y2;
  filter(BLUR,0.6);
}
