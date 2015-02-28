
int a,b;void setup(){a=900;b=128;size(900,128);background(0);}void draw(){strokeWeight(random(15,45));stroke(random(200),random(200),0);point(random(a),random(b));filter(BLUR);}

