
int[] x=new int[4];
x[0]=random(600);
x[1]=random(600);
x[2]=random(600);
x[3]=random(600);
x[4]=random(600);
int[] s=new int[4];
s[0]=random(4)-2;
s[1]=random(4)-2;
s[2]=random(4)-2;
s[3]=random(4)-2;
s[4]=random(4)-2;
color[] c=new color[4];
c[0]=color(random(255),random(255),random(255));
c[1]=color(random(255),random(255),random(255));
c[2]=color(random(255),random(255),random(255));
c[3]=color(random(255),random(255),random(255));
c[4]=color(random(255),random(255),random(255));

int[] xc=new int[4];
int[] sc=new int[4];
color[] cc=new color[4];
arrayCopy(x,0,xc,0,4);
arrayCopy(s,0,sc,0,4);
arrayCopy(c,0,cc,0,4);
xc=append(x, random(600));
sc=append(s, random(4)-2);
cc=append(c, color(random(255),random(255),random(255)));


void setup() {  
  size(600, 250);
  }

void draw() {  
  background(0);
noStroke();
for (int i = 0; i < 6; i = i+1){
  fill(cc[i],175);
  ellipse(xc[i],125,100,100);
  xc[i]=xc[i]+sc[i];
  if ((xc[i]>600)||(xc[i]<0)) {sc[i]=sc[i]*-1;}
  }
}
