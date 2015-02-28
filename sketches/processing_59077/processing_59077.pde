
size(600,400);
smooth();
int y=height/2+5;
int w=7;
int l=25;

fill(0);
rect(0,y-25,width,60);


fill(#FFD700);
rect(0,y,l,w);
rect(40,y,l,w);
rect(80,y,l,w);
rect(120,y,l,w);
rect(160,y,l,w);
rect(200,y,l,w);
rect(240,y-5,width,6.5);
rect(240,y+3,width,6.5);

stroke(#DDDDDD);
int s=3;
int m=width/7;
int h=height/3;
strokeWeight(s);
line(0,h-70,m,h);
line(m,h,m*2,h-90);
line(m*2,h-90,m*3,h);
line(m*3,h,m*4,h-30);
line(m*4,h-30,m*5,h);
line(m*5,h,m*6,h-45);
line(m*6,h-45,width,h-20);

fill(#2B4281);
noStroke();
int p=(height/7)*6;
int r=(width/6)*5;
ellipse(r,p,width/4,height/7);

stroke(0);
int t=20;
int aa=(height/4)*3;
int bb=aa-t;
int c=width/50;
line(c,bb,c,aa);
line(c*2,bb,c*2,aa);
line(c*3,bb,c*3,aa);
line(c*5,bb,c*5,aa);
line(c*10,bb,c*10,aa);
line(c*20,bb,c*20,aa);
line(c*21,bb,c*21,aa);
line(c*22,bb,c*22,aa);
line(c*40,bb,c*40,aa);
line(0,(aa+bb)/2,width,(aa+bb)/2);

