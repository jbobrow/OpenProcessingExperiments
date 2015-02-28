
ArrayList<BouncingBall> abb=new ArrayList<BouncingBall>();

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  for (int i=0;i<abb.size();i++) {
    BouncingBall b=abb.get(i);
    b.display();
    if (b.state=="die") abb.remove(i);
    if (b.state=="divide") {
      float vx1=b.vx+random(-(b.vx*0.6),b.vx*0.6);
      float vy1=b.vy+random(-(b.vx*0.6),b.vx*0.6);
      BouncingBall nb1=new BouncingBall(b.x, b.y, vx1, vy1, b.fs/2, 0);
      abb.add(nb1);
      float vx2=b.vx+random(-(b.vx*0.3),b.vx*0.3);
      float vy2=b.vy+random(-(b.vx*0.3),b.vx*0.3);
      BouncingBall nb2=new BouncingBall(b.x, b.y, vx2, vy2, b.fs/2, 0);
      abb.add(nb2);
      abb.remove(i);
    }
  }
}
//throw a new ball
//int sx,sy,ex,ey;
float vx, vy, mx, my;
float a=0.4;
void mousePressed() {
}

void mouseReleased() {
  //ex=mouseX;ey=mouseY;
  //float d=sqrt(pow(sx-ex,2)+pow(sy-ey,2));
  vx=(mouseX-pmouseX)*a;
  vy=(mouseY-pmouseY)*a;
  mx=mouseX;
  my=mouseY;
  makeANewBall();
}

void makeANewBall() {
  BouncingBall nb=new BouncingBall(mx, my, vx, vy, 40, 0);
  abb.add(nb);
}

class BouncingBall{
  public int bc=0;
  public int g;
  public float vx,vy,ay;
  public float x,y;
  public boolean isBouncing=false;
  public float fs;
  RectFlame rf;
  public int life;
  public String state="";
  
  public BouncingBall(float x,float y,float vx,float vy,float fs,int g){// g stand for generation
    this.x=x;
    this.y=y;
    this.vx=vx;
    this.vy=vy;
    this.fs=fs;
    this.g=g;
    life=(int)random(3,6);
    ay=1;
    rf=new RectFlame(fs,50);
  }
  public void update(){
    x+=vx;
    vy+=ay;
    y+=vy;
    isBouncing=false;
    //bouncing
    if(y<=0){y=0;vy=-vy;bc++;isBouncing=true;}
    if(y>=height){y=height;vy=-vy;bc++;isBouncing=true;}
    if(x<=0||x>=width){ vx=-vx;bc++;isBouncing=true;}
    //time's up
    if(bc>life){
      if(fs<5)state="die";
      else state="divide";
    }
  }
  public void display(){
    update();
    fill(255);
    ellipse(x,y,fs/5,fs/5);
    rf.setFire(x,y);
    rf.display();
  }
}
class RectFlame {
  float s, ax, ay;
  int colorCycle=(int)random(0,255);
  ArrayList<RectSprite> sa=new ArrayList<RectSprite>();
  int max=50;

  public RectFlame(float s, float l) {
    this.s=s;
    max=(int)l;
    ax=0;
    ay=0;
  }
  public void setFire(float x, float y) {
    RectSprite sp=new RectSprite((int)x, (int)y, color(colorCycle, 255, 255, 255),s);
    sa.add(0, sp);
    if (sa.size()>max) sa.remove(sa.size()-1);
    //move to next color
    colorCycle++;
    if (colorCycle==170) colorCycle++;
    if (colorCycle==255) colorCycle=0;
  }
  public void display() {
    for (int i=0;i<sa.size();i++) {
      sa.get(i).setColorAlpha(255-(int)map(i, 0, sa.size(), 0, 255));
      //sa.get(i).setColorAlpha(255);
      sa.get(i).display();
      //clean up
      if(sa.get(i).aa==0) sa.remove(i);
    }
    //text("flame length : "+sa.size(),10,10);
  }
}

class RectSprite {
  int x, y;
  float a;
  public color col;
  public int aa;//alpha chanel of the color
  float spinSpeed;
  float expandSpeed;
  float minD;
  float d;
  float maxD;
  
  public RectSprite(int mx, int my, color col, float s) {
    x=mx;
    y=my;
    a=radians(random(0, 45));
    spinSpeed=radians(random(3, 10));
    expandSpeed=0.5;
    minD=s+random(-(s*0.5), s*0.5);
    maxD=minD*2;
    d=minD;
    this.col=col;
  }
  public int getAlpha(){
    return aa;
  }
  public void setColorAlpha(int a) {
    float t=255-map(d, minD, maxD, 0, 255);
    aa=(int)(t*(a/255.0));
    if (aa<0)aa=0;
    col=color(hue(col), saturation(col), brightness(col), aa);
  }
  public void display() {
    pushMatrix();
    translate(x, y);
    rotate(a);
    noFill();
    stroke(col);
    rect(0, 0, d, d);
    //text(""+hue(col),0,0);
    popMatrix();
    //change something
    a+=spinSpeed;
    d+=expandSpeed;
    if (d>maxD)d=maxD;
  }
}


