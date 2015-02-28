
float x,y,r,t,p,m=1,h=200;void draw(){background(h);t+=mouseX/h-1;for(x=h;x>0;x-=2)for(y=0;h>y;y+=.5){m=-m;p=t/9+asin(x/h)*m;r=noise(p,y/h);r*=r*2;stroke((9*p+y/9)%1>r?0:r*h);line(h,y,h+m*x*r*.7,y);}}

