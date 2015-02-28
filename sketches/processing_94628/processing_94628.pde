
float xr;
float yr;
float yr1;
float xr1;
float y1;
float z1;
float x1;
float r;
int ma;
float a;
int thatthing;
void setup() {
  size(500,500,P3D);
  ma=250;
  frameRate(60);
}

void draw() {
  background(90);
  yr=mouseY;
  xr=mouseX;
  r=10;
  
    yr1=(yr-(height/2))*-1;
  xr1=(xr-(width/2));
  translate(width/2,height/2,0);
  rotateX(radians(yr1));
   rotateY(radians(xr1));
  stroke(255,0,0); //red
  line(0,0,250,0,0,-250);//z
  text("yi",0,0,ma/2+30);
  
   stroke(0,255,0);//green
  line(250,0,0,-250,0,0);//x
   text('x',ma/2+30,0,0);
   
   stroke(0,0,255);//blue
  line(0,250,0,0,-250,0);//y
    text('y',0,-(ma/2+30),0);
  stroke(255);

    
     for(int i=0; i<ma;i++) {
    pushMatrix();
    
    x1=(i-ma/2);

  y1=r*(sin(radians(x1*9+90)));
    z1=sqrt(sq(r)-sq(y1))*(floor((x1-floor((x1-20)/40)*40-20-20)/20)*20+10)/abs(floor((x1-floor((x1-20)/40)*40-20-20)/20)*20+10);
    translate(x1,-y1,z1);
    

    sphere(1);
    popMatrix();
     }
    
  
  
  }

