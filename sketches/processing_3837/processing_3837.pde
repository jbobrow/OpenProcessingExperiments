
void setup(){textFont(loadFont("a.vlw"));}void draw(){background(0);int m=minute(),s=second(),h=hour();float r=2*m,t=2*s,d=map(millis()%1000,0,1000,0,120);text(h,9,r);text(m,40,t);text(s,70,d);}

