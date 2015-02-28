
int w=400;float a,b,c;void setup(){size(w,w);}void draw(){a=z();b=z();c=z();for(int r=0;r<w*2;r++){fill(a,b,c,w);ellipse(r+a,r*b,a,a);fill(a,b,c,w);ellipse(r*c,w/2,a,a);}}float z(){return random(w);}


