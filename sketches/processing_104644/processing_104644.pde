
int a;
int w;
int c;
int d;
int e;
int f;
int g;
int h;
int i;
int j;
int k;
int l;
int m;
int n;
void setup() 
{
    size (700,700);
    background(0,130,120); 
    smooth();
  frameRate(15);  
    a=400;
   w=390;
   c=355;   
   d=375;
   e=425;
   f=458;
   g=465;   
  h=10;
  i=200;
  j=100;
  k= 110;
l= 300;
m= 500;
n=600;
  }

  

void draw()  
{
 background(0,130,125);
   ellipseMode(CENTER);
  rectMode(CENTER);
a++;
w++;
c++;
d++;
e++;
f++;
g++;
h++;
i++;
j++;
k--;
  l--;
  m--;
  n--; 

  noStroke();
  fill(255);
rect(j+46,92,290,15);// Primeira nuvem
ellipse (i+80,77,60,47);
ellipse (i+25,75,65,50);
ellipse (j+75,65,75,65);
ellipse (j+40,60,75,80);
ellipse (j,65,50,50);
ellipse (h+53,85,44,30);

rect(i+148,166,185,15);// Segunda nuvem
ellipse (e+3,150,70,44);
ellipse (d,140,58,60);
ellipse (i+125,150,70,45);
  
  fill(0);
  quad(c,522,a,505,a,525,w,565); // Primeiro pássaro
ellipse(a+20,510,60,40);
triangle(a,510,d,440,e,495);
triangle(a+10,500,a,438,e+20,500);
ellipse(a+50,497,20,18);
triangle(f,503,f,494,g,499);

quad(e+100,267,d+200,245,d+200,265,a+150,300); // Segundo pássaro
ellipse(f+140,255,60,45);
triangle(d+200,250,e+200,175,e+200,250);
triangle(d+200,250,a+150,185,a+210,250);
ellipse(a+232,250,20,20);
triangle(a+242,250,a+247,253,a+240,257);


stroke(255,167,3);
fill(255,167,3);
ellipse(j+50,l+25,100,110);//balão
triangle(j+3,l+40,j+97,l+40,j+50,l+100);
triangle(j+50,l+85,j+40,l+105,j+60,l+105);
stroke(0);
line(j+50,l+105,j+50,l+270);
//rect(j+50,l+105,3,175);//cordão
//rect(j+50,l+200,3,160);
fill(255);
stroke(255);
ellipse(h+60,m+50,60,60);//cabeça
quad (h+55,m+70,h+65,m+70,j+10,n+45,h+20,n+45);
rect(h+50,n+45,3,75);//perna
rect(h+70,n+45,3,75);
line (h+60,m+75,h,n+20);//braço
line(h+65,m+85,j+50,m+50);

triangle(h+15,m+25,h+35,m+35,h+15,m+75);
triangle(h+85,m+35,j+15,m+25,j+15,m+75);

if (mousePressed)
{
  background(1,96,124);
  fill(200);
  stroke(200);
  ellipse(j+50,200,150,150);// lua
  
  fill(255,167,3);
  stroke(255,167,3);
  ellipse(j+50,l+25,100,110);//balão
triangle(j+3,l+40,j+97,l+40,j+50,l+100);
triangle(j+50,l+85,j+40,l+105,j+60,l+105);

stroke(0);
line(j+50,l+105,j+50,l+270);
noStroke();
fill(255);
rect(i+148,166,185,15);// Segunda nuvem
ellipse (e+3,150,70,44);
ellipse (d,140,58,60);
ellipse (i+125,150,70,45);

}
}
