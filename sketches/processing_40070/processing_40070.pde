
float x,y;int i,b=256;void setup(){size(b,b);colorMode(3);}void draw(){for(i=0;i++<b*b;){x=i%b-b/2;y=i/b-b/2;set(i%b,i/b,color((b*(atan2(y,x)/PI-log(dist(0,0,x,y)))+millis()/4)%b,b,b));};}

