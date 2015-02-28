
void setup(){
  size(255,255);
  frameRate(7);
}
int count=0,l=30,r=10,g=250,b=75,x=10,y=120;
void draw(){
    noFill();
    stroke (r,g,b);
    ellipse (x,y,15,l);
    r=r+10;
    g=g+20;
    b=b+5;
    l=l+7;
    x=x+5;
    count=count+1;
    draw1();
  }
int count1=0,l1=30,r1=10,g1=250,b1=75,x1=245,y1=120;
void draw1(){
    noFill();
    stroke (r1,g1,b1);
    ellipse (x1,y1,15,l1);
    r1=r1+10;
    g1=g1+20;
    b1=b1+5;
    l1=l1+7;
    x1=x1-5;
    count1=count1+1;
  }


