
int i=0;
float radio=150;
float ang=0;
float a,b;
float xcenter=160;
float ycenter=160;
float m =-2;
int e=0;

void setup(){size(320,320);
background(255);
smooth();
}

void draw(){
if (b>30)
{e=1;}
if(b<=0){e=0;}
if(e==0){b++;}else{b--;}
background(255);
for(int t=0;t<300;t++)
{
  a=2*PI*t/300;
  ang=pow(pow(abs(cos(16*a/4)),0.5)+pow(abs(sin(16*a/4)),16),m);
//float ang2=pow(pow(abs(cos(8*a/4)),0.1)+pow(abs(sin(8*a/4)),16),2*m);
  stroke(0,0,0,40);
  line(160+b*2*ang*cos(a),160+b*2*ang*sin(a),160+150*cos(a),160+150*sin(a));
  stroke(255,0,0,30);
  line(160+b*ang*cos(a),160+b*ang*sin(a),xcenter,ycenter);
  fill(200,0,0,80);
  ellipse(160+radio*cos(a),160+radio*sin(a),2,2);
  t++;

}
}

