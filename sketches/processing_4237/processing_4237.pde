
int i,j=10,a=255;void setup(){size(a,a);noStroke();}void draw(){for(i=0;i++<a/30;){fill(random(a),random(a),random(a));rect(0,i*random(a),a,j*i);}fill(78,68,217);rect(j,j,235,235);}

