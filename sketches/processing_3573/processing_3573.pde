
int i,j;float e,f,g;void setup(){size(99,99);}void draw(){filter(BLUR);for(i=0;i<9;i++){for(j=0;j<9;j++){e=random(99);f=e*j;g=e*i;fill(g,f,e);rect(50,0,4,4);noStroke();translate(tan(e),atan(e));}}}

