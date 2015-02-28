
int x1=250, y1=250, x2=250, y2=250, help, ch1, ch2, ch3;

void setup(){
  size(500,500);
  background(255);
  strokeWeight(3);
  //frameRate(24);
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
  //println("ch1: "+ch1+" ch2: "+ch2+"ch3: "+ch3);
  if(ch1<0) ch1+=10;
  if(ch2<0) ch2+=10;
  if(ch3<0) ch3+=10;
  if(ch1>255) ch1-=10;
  if(ch2>255) ch2-=10;
  if(ch3>255) ch3-=10;
  stroke(color(ch1, ch2, ch3));
  if(int(random(2))==1) x2+=help;
  else y2+=help;
  if(x2==0) x2+=10;
  if(x2==500) x2-=10;
  if(y2==0) y2+=10;
  if(y2==500) y2-=10;
  line(x1, y1, x2, y2);
  x1=x2;
  y1=y2;
  //saveFrame("bla####.png");
}


