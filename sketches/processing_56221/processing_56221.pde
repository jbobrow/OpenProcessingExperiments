
int ht2;
int wd1;
int wd2;
int x;
int y;
 
int hd1;
int hd2;
int wt1;
int wt2;
int x1;
int y1;
 
int hc1;
int hc2;
int hc3;
int wc1;
int xc;
int yc;
 
void setup(){
size (900,450)
ht1=70;
ht2=35;
wd1=90;
wd2=30;
x=100;
y=100;
 
hd1=103;
hd2=75;
wt1=70;
wt2=22;
x1=220;
y1=100;
 
hc1=20;
hc2=15;
hc3=80;
wc1=30;
xc=335;
yc=95;
}
void draw(){
background(0);
strokeWeight (5);
stroke(255);
 
line (x,y,x+wd1,y);
line (x,y,x,y+ht2);
line (x,y+ht2,x+wd2,y+ht2);
line (x+wd2,y+ht2,x+wd2,y+ht2+ht1);
line (x+wd2,y+ht2+ht1,x+wd2*2,y+ht2+ht1);
line (x+wd2*2,y+ht2+ht1,x+wd2*2,y+ht2);
line (x+wd2*2,y+ht2,x+wd2*3,y+ht2);
line (x+wd2*3,y+ht2,x+wd2*3,y);
x=x^4;
y=y^4;

line (x1,y1,x1+wt2,y1);
line (x1,y1,x1,y1+hd1);
line (x1,y1+hd1,x1+wt1,y1+hd1);
line (x1+wt1,y1+hd1,x1+wt1,y1);
line (x1+wt1,y1,x1+wt2*2,y1);
line (x1+wt2*2,y1,x1+wt2*2,y1+hd2);
line (x1+wt2*2,y1+hd2,x1+wt2,y1+hd2);
line (x1+wt2,y1+hd2,x1+wt2,y1);
x1=x1^4;
y1=y1^4;

 
 
line (xc,yc,xc+wc1,yc);
line (xc,yc,xc,yc+hc1);
line (xc,yc+hc1,xc+wc1,yc+hc1);
line (xc+wc1,yc+hc1,xc+wc1,yc);
line (xc,yc+hc1+hc2,xc,yc+hc1+hc2+hc3);
line (xc,yc+hc1+hc2+hc3,xc+wc1,yc+hc1+hc2+hc3);
line (xc+wc1,yc+hc1+hc2+hc3,xc+wc1,yc+hc1+hc2);
line (xc+wc1,yc+hc1+hc2,xc,yc+hc1+hc2);
xc=xc^4;
yc=yc^4;

 
}

