
int w=548;void setup(){size(w,w);colorMode(HSB,w);background(w);smooth();}void draw(){strokeWeight(random(w));stroke((millis()/w)%w,w,w*.8,random(25));point(random(w),random(w));filter(ERODE);}


