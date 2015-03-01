
int a=225;
int b=250;
int c=200;
int d=300;
int e=275;
int f=325;
int g=350;
int h=150;
int i=175;
int j=125;
int k=100;
int l=203;
int m=204;
int n=253;
int o=254;
int p=179;
int q=189;
int r=279;
int s=289;
int t=300;
int u=290;
int v=160;
int w=170;
int x=252;
int y=242;
int z=129;
int aa=139;
int bb=175;
int cc=187;
int dd=270;
int ee=260;
int ff=275;
int gg=285;
int hh=230;
int ii=240;
int jj=180;
int kk=190;
int ll=185;
int mm=280;
int nn=313;
int oo=400;
int pp=#0A891D;
int qq=#FC0303;
int rr=#145A01;
int ss=#EDC2C2;
int tt=#5A491C;
int uu=#F07807;
int vv=#AF5612;
int ww=#ADAA88;
int xx=#E0680B;
void setup()
{size(900,520);
}

void draw()
{
background(#FAFAFA);
fill(#1D8B0D);
stroke(pp);
pp=pp+qq;
rect(0,0,300,520);
fill(#FF0000);
stroke(qq);
qq=qq+pp;
rect(600,0,300,520);
stroke(vv);
vv=vv+ww;
fill(xx);
ellipse(a,110,100,100);
a=a+1;

ellipse(a,135,300,125);
noStroke();
fill(#5BBF23);
a=a+1;


ellipse(a,225,200,200);
a=a+1;

triangle(f,225,a,225,d,350);


triangle(j,225,a,225,h,350);

triangle(h,350,a,225,d,350);

quad(d,275,e,300,f,350,g,325);
d=d+3;
e=e+3;
f=f+3;
g=g+3;

quad(h,275,i,300,j,325,k,300);
h=h+3;
i=i+3;
j=j+3;
k=k+3;

rect(i,425,25,50);

rect(b,425,25,50);
b=b+3;
fill(vv);
vv=vv+ww;

rect(h,350,150,25);

rect(h,375,50,50);

triangle(c,375,a,375,c,425);
c=c+3;

triangle(a,375,b,375,b,425);

rect(b,375,50,50);
fill(#FAF3E3);

ellipse(c,200,25,25);

ellipse(b,200,25,25);

rect(c,250,50,25);

triangle(i,250,c,250,c,275);

triangle(b,250,e,250,b,275);
stroke(#5D460D);
strokeWeight(10);

line(l,205,m,206);
l=l+3;
m=m+3;

line(n,205,o,206);
n=n+3;
o=o+3;
strokeWeight(1);

line(p,150,q,160);
p=p+3;
q=q+3;

line(r,310,s,320);
r=r+3;
s=s+3;

line(t,210,u,220);
t=t+3;
u=u+3;

line(v,323,w,333);
v=v+3;
w=w+3;

line(x,342,y,332);
x=x+3;
y=y+3;

line(x,242,y,232);

line(z,252,aa,262);
z=z+3;
aa=aa+3;

line(bb,450,cc,460);
bb=bb+3;
cc=cc+3;

line(dd,440,ee,430);
dd=dd+3;
ee=ee+3;

line(ff,175,gg,185);
ff=ff+3;
gg=gg+3;

line(hh,170,ii,160);
hh=hh+3;
ii=ii+3;

line(v,200,w,190);

line(jj,240,kk,230);
jj=jj+3;
kk=kk+3;

line(jj,340,kk,330);

line(jj,240,kk,230);

line(bb,300,ll,290);
ll=ll+3;

line(ii,300,b,290);

line(mm,290,u,280);
mm=mm+3;
fill(tt);
tt=tt+uu;

ellipse(e,475,50,25);

ellipse(bb,475,50,25);
strokeWeight(10);

line(oo,275,nn,362.5);
oo=oo+3;
nn=nn+3;
fill(rr);
rr=rr+ss;
stroke(rr);
strokeWeight(30);

point(oo,275);

point(nn,362.5);
}
