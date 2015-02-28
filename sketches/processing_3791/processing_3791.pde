
int L=400,i;float A,x,y;void setup(){size(L,L);}void draw(){fill((1+cos(float(millis())/4000))*123);ellipse(abs(x+=9*cos(A+=.5-noise(i++)))%L,abs(y+=9*sin(A))%L,40,40);filter(18);filter(11);}

