
void draw(){float d=400,i;rectMode(3);noStroke();boolean m=true;float o=max(0.01,mouseX/d);for (i=1.0;i>0;i-=o){fill(m?0:255);rect(d/2,d/2,d*i,d*i);fill(m?255:0);rect(d/4,d/4,d*i/2,d*i/2);m=!m;}}

