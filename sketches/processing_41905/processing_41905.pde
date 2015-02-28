
PImage backing;
void setup(){
  
  size(400,600);
  smooth();
}


int t,i,i1,h1,w=255,a[]=new int[w*w],b[]=new int[w*w],s,h,m;
float mcount;
float daytime, night, hpurpose, hcount;
void draw(){
background(w);
s=second();
m=minute();

h=hour();
//background changer

hpurpose=h-12;
//seconds
noFill();
//line background
beginShape(10);
a[t]=s*10;a[t+1]=100+s*5-w;

stroke(255);
strokeWeight(1.5);

for(i=0;i<t;i+=2)
 vertex(w+cos((t-i)/99f)*a[i+1]-50,a[i]);

if(a[t]>0)t+=2;
endShape();
beginShape(10);
a[t]=s*10;a[t+1]=100+s*5-w;

stroke(s*3,100,100);
strokeWeight(1);

for(i=0;i<t;i+=2)
 vertex(w+cos((t-i)/99f)*a[i+1]-50,a[i]);

if(a[t]>0)t+=2;
endShape();

 if(s==59){
   a=new int[w*w];
   t=0;
   a[t]=500;
   a[t+1]=500;
   i=0;
   println(i);
 }
  ellipse(w+cos((t-i)/99f)*a[i+1]-50,a[i],20,20);
 //minutes
 mcount=m*9+29;
 hcount=h*24;

for(int i1=29;i1<571;i1=i1+9){
  fill(255-m*3,100,m*3);
  noStroke();
  ellipse(350,i1,9,9);
   fill(0);
  ellipse(50,i1,9,9);
  fill(255);
  ellipse(50,i1,9,9);
}
for(int t1=29;t1<mcount;t1=t1+9){
  fill(255,255,255);
  ellipse(350,t1,9,9);
  fill(255-m*3,100,m*3);
  ellipse(50,t1,9,9);
}

for(float i2=39;i2<561;i2=i2+22.5){
  fill(255-h*10,50+h*5,50+h*9);
  noStroke();
  ellipse(380,i2,20,20);
   fill(0);
  ellipse(20,i2,20,20);
  fill(255,255,255);
  ellipse(20,i2,20,20);
}
for(float t2=39;t2<hcount;t2=t2+22.5){
  fill(255);
  ellipse(380,t2,20,20);
  fill(255-h*10,50+h*5,50+h*9);
  ellipse(20,t2,20,20);
}

for(int lfunc=29;lfunc<=height;lfunc=lfunc+90){
  stroke(0);
  line(32,lfunc,40,lfunc);
  line(359,lfunc,367,lfunc);
}
}


