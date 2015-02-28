
float e,f,g,i,j;void setup(){size(600,400);}void draw(){filter(BLUR);for(i=0;i<9;i++){for(j=0;j<9;j++){e=random(99);f=e*j;g=e*i;fill(g,f,e);rect(99,0,4,4);noStroke();translate(tan(e)*2,atan(e)*4);}}}

