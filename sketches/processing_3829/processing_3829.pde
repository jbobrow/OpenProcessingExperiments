
String[] t={"to","or","not","be","be?"};int a=900,b=128,c;void setup(){size(a,b);textFont(createFont("",64));}void draw(){background(0);c=c+b;text(t[int(random(5))],c%820,84);delay(int(random(a)));}


