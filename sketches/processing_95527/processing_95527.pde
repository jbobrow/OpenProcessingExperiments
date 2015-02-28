
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
spheree[] spherees;
void setup() {
  size(500,500,P3D);
  ma=250;
  smooth();
  spherees= new spheree[ma];
  for(int i=0; i<ma;i++) {
    spherees[i]= new spheree(i);
  }
  textSize(12);
}
 
void draw() {
  background(90);
  text("Y=(-2)^X",60,60);
  yr=mouseY;
  xr=mouseX;
  r=10;
   
  yr1=(yr-(height/2))*-1;
  xr1=(xr-(width/2));
  translate(width/2,height/2,0);
  rotateX(radians(yr1));
  rotateY(radians(xr1));
   
  stroke(255,0,0); //red
  fill(255);
  line(0,0,250,0,0,-250);//z
  text("Yi",0,0,ma/2+30);
   
  stroke(0,255,0);//green
  fill(255);
  line(250,0,0,-250,0,0);//x
  text('X',ma/2+30,0,0);
    
  stroke(0,0,255);//blue
  fill(255);
  line(0,250,0,0,-250,0);//y
  text('Y',0,-(ma/2+30),0);
  stroke(255);
  
  for(int i=0; i<25;i++) {
  stroke(150,150,150,150);
  line(i*10-ma/2+5,125,0,i*10-ma/2+5,-125,0);
    line(125,i*10-ma/2+5,0,-125,i*10-ma/2+5,0);
  noStroke();
  }
 
     
     for(int i=0; i<ma;i++) {
     spherees[i].display(i);
     }
     
   
   
  }
 
 
 
class spheree{
  float xloc;
  float yloc;
  float zloc;
  color g;
  float d;
  float time;
  float c;
   
   
  spheree(float that) {
    xloc=that;
  time=random(30,120);
    d=random(0,255);
   g=color(255, 100, 100);
  yloc=r*(sin(radians(xloc*9+90)));
    zloc=sqrt(sq(r)-sq(yloc))*(floor((xloc-floor((xloc-20)/40)*40-20-20)/20)*20+10)/abs(floor((xloc-floor((xloc-20)/40)*40-20-20)/20)*20+10);
  }
   
  void display(float that) {
  pushMatrix();
   xloc=that-ma/2;
    yloc=r*(sin(radians(xloc*18+90)))*pow(2,xloc/10);
    zloc=sqrt(sq(r*pow(2,xloc/10))-sq(yloc))*(floor((xloc-floor(xloc/20)*20)/10)*10-5)/abs(floor((xloc-floor(xloc/20)*20)/10)*10-5);
  translate(xloc,-yloc,zloc);
  fill(255);
  sphere(1.5);
   
  popMatrix();
  }
 
}



