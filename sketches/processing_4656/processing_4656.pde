
int x=255;float[] v={x/2,x/2};void setup(){size(x,x);}
void draw(){float i=random(PI)*2;point(constrain(v[0]+=cos(i)*3,0,x),constrain(v[1]+=sin(i)*3,0,x));color(random(x));fill(x,9);rect(0,0,x,x);}

