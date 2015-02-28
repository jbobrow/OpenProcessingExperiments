
class ball{
  PVector x;
  PVector v;
  PVector f;
  color c;
  int r=30;
  ball(int x0, int y0){
    x=new PVector(x0,y0);
    v=new PVector(random(-3,3),-random(0,3));
    c=color(random(255),random(255),random(255));
    f = new PVector(0,0);
  }
  void update(){
    v.y+=0.1;
    v.add(f);
    x.add(v);
  }
  void render(){
    fill(c);
    ellipse(x.x,x.y,2*r,2*r);
  }
}
int width=800;
int height=600;
float g=0.25;
ArrayList balls= new ArrayList();
float k=1;//factor to increment distance between balls
float c= 4;//maximun penetrance in walls
float vlim=8;//maximum speed
float plimit=25;//population limit

void setup(){
  noStroke();
  frameRate(48);
  size(800,600);
}

void draw(){
  background(255);
  for(int i=0;i<balls.size();i++){    
    ball b = (ball) balls.get(i);
    // speed limit
    if (b.v.y>vlim){b.v.y=vlim;}
    // bounce against walls
    if (b.x.x<b.r){b.v.x=abs(b.v.x);}
    if (b.x.x>width-b.r){b.v.x=-abs(b.v.x);}
    if (b.x.y>height-b.r){b.v.y=-abs(b.v.y);} 
    //separate from walls
    if(b.x.x>width-b.r+c){b.x.x-=5;}
    if(b.x.x<b.r-c){b.x.x+=5;}
    if(b.x.y>height-b.r+c){b.x.y-=5;}
    //bounce between them
    for(int j=i+1;j<balls.size();j++){
      ball b2 = (ball) balls.get(j);
    //separate embedded balls
      PVector dx=PVector.sub(b2.x,b.x);
      if (dx.mag()<(b.r+b2.r)*k){
        float inc1=b.r-dx.mag()/2;
        float inc2=b2.r-dx.mag()/2;
        dx.normalize();
        dx.mult(inc1);
        PVector dx1=dx;
        dx1.mult(inc2/inc1);
        if((b2.x.x+dx.x<width-b2.r)&&(b2.x.x+dx.x>b2.r)&&(b2.x.y+dx.y<height-b2.r)&&(b.x.x+dx1.x<width-b.r)&&(b.x.x+dx1.x>b.r)&&(b.x.y+dx1.y<height-b.r)){
          b2.x.add(dx);
          dx.mult(inc2/inc1);
          b.x.sub(dx);
        }
        //bounce between them
        PVector acum=b.v;
        b.v=b2.v;
        b2.v=acum;
      }
    }
    b.update();
    b.render();    
  }  

}

void mousePressed() {
  if (balls.size()<plimit){
    balls.add ( new ball(mouseX,mouseY));
  }
}

