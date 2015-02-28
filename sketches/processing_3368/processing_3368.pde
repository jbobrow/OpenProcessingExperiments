
int a=600;int d=0;int[] e={255,0};void setup(){noFill();size(a,a);}void draw(){c();}float b(){return random(a);}void c(){d=(d>0)?0:1;stroke(e[0],e[d],e[1],9);bezier(b(),b(),b(),b(),b(),b(),b(),b());}

