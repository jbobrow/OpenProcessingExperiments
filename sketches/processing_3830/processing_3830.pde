
float a,b,x,s=99,w=50,d=612;void draw(){a++;b=a%d-w;background(0);smooth();fill(d);for(int i=0;i<d;i++){ellipse(i*w,w,8,8);}fill(0);rect(0,0,b,s);x=PI*abs(a%s-w)/d;fill(d,d,0);arc(b,w,s,s,x,2*PI-x);}

