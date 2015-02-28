
int h=500,w=h,i;float d=0,e=0,r=.01,z,n;void draw(){background(0);for(i=0;i<w*h;i+=5){z=i/w;set(int(i%w/z*h),int(h/2+noise(i%w*r+e,i*r/w+d)*99/z*h),-1);}d-=(mouseY-h/2f)/h/2f;e+=(mouseX-w/2f)/w/2f;}

