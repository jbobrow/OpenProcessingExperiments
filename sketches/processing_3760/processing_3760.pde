
int w,h,j;void setup(){background(0);}void draw(){w=width;h=height;blend(w/16,h/16,w-w/8,h-h/8,0,0,w,h,BLEND);for(j=0;j<9999;j++){stroke(random(150),0,random(100)+150);point(random(w),random(h));}}

