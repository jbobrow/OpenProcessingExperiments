
PImage l;int c,i,p=200,q=280;void setup(){size(500,500);smooth();}void draw(){l=get();c++;translate(250,250);rotate(c*.01);for(i=0;i<3;i++){rotate(2);rect(-p,-p,q,q);image(l,-p,-p,q,q);}}

