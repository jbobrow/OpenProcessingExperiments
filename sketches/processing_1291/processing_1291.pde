
int i=0;
float radio=200;
float ang=0;
float a,b;
float xcenter=250;
float ycenter=250;
float m =-2;
int e=0;


void setup(){size(500,500);
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
line(250+b*4*ang*cos(a),250+b*4*ang*sin(a),250+200*cos(a),250+200*sin(a));
stroke(255,0,0,30);
line(250+b*ang*cos(a),250+b*ang*sin(a),xcenter,ycenter);
fill(200,0,0,80);
ellipse(250+radio*cos(a),250+radio*sin(a),2,2);
t++;

}



}

