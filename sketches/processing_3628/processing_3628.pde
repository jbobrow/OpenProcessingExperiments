
int l=99;int s=0;void setup(){size(99,99);textFont(createFont("",25));}void draw(){background(l);char c=char(l);text(c,43,74);text(s,10,30);if(millis()< 30000&&key==c){l=int(random(97,122));s++;}}

