
float q,f,a,b,p,c,x,i=.004,j=.001,k=9;void setup(){background(0);smooth();stroke(140);frameRate(300);}void draw(){q++;rotate((6*PI)/q);c+=j;a+=i;b+=k;f=noise(a,c,b)*900;line(x-1,p,x,f);x++;p=f;}

