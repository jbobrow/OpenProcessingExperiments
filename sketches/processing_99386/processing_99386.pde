
Rrathe[] rrethi=new Rrathe[13];
void setup(){
  size(400,400);
  for(int i=0;i<rrethi.length;i++){
    rrethi[i]=new Rrathe();
  }
  smooth();
  frameRate(13);
}

void draw(){
  background(random(80,120),random(80,120),random(80,120));
  for(int i=0;i<rrethi.length;i++){
    rrethi[i].ndryshoNgjyre();
    rrethi[i].rastesia();
    rrethi[i].display();
    rrethi[i].move();
  }
}

class Rrathe{
  float d1;
  float d2;
  float speed;
  boolean rasti;
  color ngjyra;
  boolean k;
  boolean j;
  Rrathe(){
    d1=random(20,40);
    d2=d1-random(-20,20);
    speed=random(2);
    rasti=false;
    ngjyra=color(random(200,255));
    k=false;
    j=false;
  }
  void display(){
    if(rasti){
      fill(ngjyra,random(100,170));
      noStroke();
      ellipse(width/2,height/2,d1,d2);
    }
    else{
      fill(100,random(50,120));
      noStroke();
      ellipse(width/2,height/2,d1,d2);
    }
  }
  void move(){
    d1=d1+speed;
    d2=d2+speed;
    if(d1>width+20 && d2>height+20){
      d1=random(20,40);
      d2=d1-random(-20,20);
    }
  }
  void rastesia(){
    float r=random(1,4);
    if(r>3 && r<=4){
      rasti=true;
    }
    else rasti=false;
  }
  void ndryshoNgjyre(){
    if(keyPressed && k==false && j==false){
      ngjyra=color(random(150,220),50,50);
      k=true;
    }
    else if(keyPressed && k==true && j==false){
      ngjyra=color(50,random(150,220),50);
      k=false;
      j=true;
    }
    else if(keyPressed && k==false && j==true){
      ngjyra=color(random(150,220),random(150,220),50);
      j=false;
    }
  }  
}
