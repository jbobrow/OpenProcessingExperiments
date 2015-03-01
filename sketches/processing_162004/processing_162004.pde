
Background b=new Background();
float r1;
float r2;

void setup(){
  size(600,600);
  background(255);
  b.display(); 
}

void draw(){

  r1=random(160);
  r2=random(110);
  
  Circle c1=new Circle(random(240,255),random(80,120),random(60,90),300,100,r1,r1); //big red
  Circle c2=new Circle(random(130,170),random(180,220),random(100,140),300,100,r2,r2); //little green
  Circle c3=new Circle(random(130,170),random(180,220),random(100,140),100,300,r1,r1); // big green
  Circle c4=new Circle(random(240,255),random(80,120),random(60,90),100,300,r2,r2); // little red
  Circle c5=new Circle(random(230,255),random(200,240),random(90,130),300,500,r1,r1); // big yellow
  Circle c6=new Circle(random(240,255),random(80,120),random(60,90),300,500,r2,r2); //little red
  Circle c7=new Circle(random(240,255),random(80,120),random(60,90),500,300,r1,r1); //big red
  Circle c8=new Circle(random(230,255),random(200,240),random(90,130),500,300,r2,r2); // little yellow

  Rect re1=new Rect(random(230,255),random(200,240),random(90,130),100,100,r1,r1); // big yellow
  Rect re2=new Rect(random(240,255),random(80,120),random(60,90),100,100,r2,r2); // little red
  Rect re3=new Rect(random(130,170),random(180,220),random(100,140),500,100,r1,r1); // big green
  Rect re4=new Rect(random(230,255),random(200,240),random(90,130),500,100,r2,r2); // little yellow
  Rect re5=new Rect(random(230,255),random(200,240),random(90,130),300,300,r1,r1); // big yellow
  Rect re6=new Rect(random(130,170),random(180,220),random(100,140),300,300,r2,r2); //little green
  Rect re7=new Rect(random(230,255),random(200,240),random(90,130),100,500,r1,r1); // big yellow
  Rect re8=new Rect(random(130,170),random(180,220),random(100,140),100,500,r2,r2); //little green
  Rect re9=new Rect(random(130,170),random(180,220),random(100,140),500,500,r1,r1); // big green
  Rect re10=new Rect(random(240,255),random(80,120),random(60,90),500,500,r2,r2); //little red

  
  
  if((mouseX-pmouseX >= 10 || mouseX-pmouseX <=-10) && (mouseY-pmouseY <=100 || mouseY-pmouseY <=-100)){
    c1.display();
    c2.display();
    c3.display();
    c4.display();
    c5.display();
    c6.display();
    c7.display();
    c8.display();
  }
  
  if((mouseY-pmouseY >= 10 || mouseY-pmouseY <=-10) && (mouseX-pmouseX <= 100 || mouseY-pmouseY <=-100)){
    re1.display();
    re2.display();
    re3.display();
    re4.display();
    re5.display();
    re6.display();
    re7.display();
    re8.display();
    re9.display();
    re10.display();
  }
  
  frameRate(15);
}
class Background{

  void display(){
    noStroke();
  
    fill(#9CCD81);
    rect(0,0,200,200);
    fill(#9CCD81);
    rect(400,200,200,200);
    fill(#9CCD81);
    rect(200,400,200,200);
    
    fill(#F1997A);
    rect(400,0,200,200);
    fill(#F1997A);
    rect(200,200,200,200);
    fill(#F1997A);
    rect(0,400,200,200);
    
    fill(#F1997A);
    rect(400,0,200,200);
    fill(#F1997A);
    rect(200,200,200,200);
    fill(#F1997A);
    rect(0,400,200,200);
    
    fill(#FFF371);
    rect(200,0,200,200);
    fill(#FFF371);
    rect(0,200,200,200);
    fill(#FFF371);
    rect(400,400,200,200);
  }
}
class Circle{
  float r, g, b;
  float cposx,cposy,csizex,csizey;
  Circle(float c1, float c2, float c3, float x, float y, float w, float h){
    r=c1;
    g=c2;
    b=c3;
    cposx=x;
    cposy=y;
    csizex=w;
    csizey=h;
  }
  
  void display(){
    noStroke();
    fill(r,g,b);
    ellipseMode(CENTER);
    ellipse(cposx,cposy,csizex,csizey);
  }

}
class Rect{
  float rr,rg,rb,rposx,rposy,rsizex,rsizey;
  
  Rect(float rc1,float rc2,float rc3,float rx,float ry,float rw,float rh){
    rr=rc1;
    rg=rc2;
    rb=rc3;
    rposx=rx;
    rposy=ry;
    rsizex=rw;
    rsizey=rh;  
  }
  void display(){
    noStroke();
    fill(rr,rg,rb);
    rectMode(CENTER);
    rect(rposx,rposy,rsizex,rsizey);
  }
}


