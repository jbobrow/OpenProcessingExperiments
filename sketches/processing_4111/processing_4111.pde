
color b=color(0);int n,i,a=199;void draw(){set(5,5,b);for(i=0;i<a*a;i++){if (get(i%a,i/a)==b){set(i%a+n,i/a+n,color(200));set(i%a+r(2),i/a+r(2),b);}}n=n+r(2);}int r(int x){return int(random(-x,x));}

