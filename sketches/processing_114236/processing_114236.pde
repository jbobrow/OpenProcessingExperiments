
ArrayList<Thing> theThings = new ArrayList<Thing>();

void setup(){
  size(500,500);
  background(0);
  noStroke();
  ch1=int(random(256));
  ch2=int(random(256));
  ch3=int(random(256));
}
 
void draw(){
  for(int i=0;i<theThings.size();i++){
    Thing actualThing=theThings.get(i);
    actualThing.drawThing();
  }
  filter(BLUR,0.6);
}

class Thing{
  int ch1=int(random(256)), ch2=int(random(256)), ch3=int(random(256)), help, theX, theY;

  Thing(int x, int y){
    theX=x;
    theY=y;
  }

  void drawThing(){
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
    
    if(int(random(2))==1) theX+=help;
    else theY+=help;
    if(theX==0) theX+=10;
    if(theX==490) theX-=10;
    if(theY==0) theY+=10;
    if(theY==490) theY-=10;
    rect(theX, theY, 10, 10);
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    theThings.add(new Thing(mouseX,mouseY));
  }
}
