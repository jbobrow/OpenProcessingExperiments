
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



void setup() {  
  size(600, 250);
  }

void draw() {  
  background(0);
noStroke();
for (int i = 0; i < 5; i = i+1){
  fill(c[i],175);
  ellipse(x[i],125,100,100);
  x[i]=x[i]+s[i];
  if ((x[i]>600)||(x[i]<0)) {s[i]=s[i]*-1;}
  }
}
