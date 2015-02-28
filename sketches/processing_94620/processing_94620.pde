
String whatever;
where[] thatthing;
PFont gift;





void setup() {
  smooth();
  textAlign(CENTER,TOP);
  size(1000,500);
  gift=loadFont("Shruti-48.vlw");
  whatever="acceleration";
  thatthing= new where[whatever.length()];
  for(int i=0; i<whatever.length(); i++) {
   thatthing[i]= new where(whatever.charAt(i),i);
  }
  
   
   
}

void draw() {
  fill(90,90,90,30);
  rect(0,0,width,height);
  fill(255);
  for(int i=0; i<whatever.length(); i++) {
   thatthing[i].display();
   thatthing[i].go();
  }

  
  
}



class where{
  float xloc;
  float that;
  float yloc;
  char a;
  float ii;
  float gox;
  float goy;
  
  float vx;
  float vy;
  
  float ax;
  float ay;
  
  where(char a1, int ii1) {
    xloc=random(0,width);
    yloc=random(0,height);
    vx=random(-.5,.5);
    vy=random(-.5,.5);
    a=a1;
    ii=ii1;
    gox=ii*10-10*whatever.length()/2+width/2;
    goy=height/2;
    that=10000;
  }
  
  void display() {
    textFont(gift,12);
    text(a,xloc,yloc);
  }
  
  void go() {
    xloc=xloc+vx;
    yloc=yloc+vy;
    
    vx=vx+ax;
    vy=vy+ay;
    
    ax=(gox-xloc)/that;
    ay=(goy-yloc)/that;
    
    if(abs(gox-xloc)<60 && abs(goy-yloc)<60) {
     vx=vx/1.01;
     vy=vy/1.01;
     that=1000;
  }
  else {
    that=10000;
  }
  
  
  
}
    
    
  
}


