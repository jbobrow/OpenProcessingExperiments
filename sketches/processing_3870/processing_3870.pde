
int t=0,n=500;void setup(){size(n,n,P3D);}void draw(){t++;smooth();background(0);for (int i=0;i<n;i+=40){float y=n*sin(i*t*0.0001);triangle(i,n,i+40,n,i+20,n-y);triangle(i+20,0,i+60,0,i+40,y);}}

