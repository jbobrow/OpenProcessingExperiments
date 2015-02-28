
int w,h,j;void draw(){w=width;h=height;blend(0,0,w,h,0,0,w,h,BLEND);translate(w/2,h/2);noFill();stroke(255);for(j=0;j<15;j++){rotate((float)frameCount/600);bezier(0,0,0,h/2,w,h,w,h);}}

