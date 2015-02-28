
float i,a,r,f;void setup(){filter(16);}void draw(){for(i=0;i<width*20;i++){a=random(2*PI);point(sin(a)*random(width/2)+width/2,cos(a)*random(height/2)+height/2);}filter(11);filter(18);filter(18);}

