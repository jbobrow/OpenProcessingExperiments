
Po a=new Po(random(400),random(400));
Po b=new Po(random(400),random(400));
Po c=new Po(random(400),random(400));
float n=0;float z;float v=10;float m=1;
void setup(){
  size(400,400);  
  colorMode(HSB,100);
  background(0,0,0);
}
void draw(){
  fill(0,5);noStroke();rect(0,0,400,400);
  change();
  z=0;
  if(m==1){
    while(z<v){
      stroke(n%100,100,100);
      line(a.x+((b.x-a.x)/v)*z,a.y+((b.y-a.y)/v)*z,b.x+((c.x-b.x)/v)*z,b.y+((c.y-b.y)/v)*z);
      n+=5;z++;
    }
  }if(m==2){
    while(z<v){
      stroke(n%100,100,100);
      line(b.x+((c.x-b.x)/v)*z,b.y+((c.y-b.y)/v)*z,c.x+((a.x-c.x)/v)*z,c.y+((a.y-c.y)/v)*z);
      n+=5;z++;
    }
  }if(m==3){
    while(z<v){
      stroke(n%100,100,100);
      line(c.x+((a.x-c.x)/v)*z,c.y+((a.y-c.y)/v)*z,a.x+((b.x-a.x)/v)*z,a.y+((b.y-a.y)/v)*z);
      n+=5;z++;
    }
  }
  
  frameRate(map(mouseY,0,400,3,80));
  v=map(mouseX,0,400,0,60);
  strokeWeight(map(mouseX,0,400,5,0));
  m=m%3+1;
}
void change(){
  if (m==1){
    c.change();
  }if (m==2){
    a.change();
  }if (m==3){
    b.change();
  }
}
  
void tenlines(float q){
  z=0;
  
}
class Po{
  float x,y;
  Po(float ex,float why){
    x=ex;y=why;
  }
  void change(){
    x=random(400);
    y=random(400);
  }
}

