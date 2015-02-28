
int i,x,y;void draw(){colorMode(3,2);filter(11);for(x=9;x<291;x++)for(y=9;y<291;y++)set(x,y,color(n(mouseX)%2,1+n(10+mouseY)%1,1+n(20)%1));i++;}float n(int k){return noise(x*0.01,y*0.01,i*0.05+k)*5;}

