
int i,x,y;void draw(){smooth();filter(18);for(x=1;x<56;x++)for(y=1;y<56;y++)ellipse(x*5+n(mouseX+10)*2,y*5+n(mouseY-10)*2,n(0),n(0));i++;}float n(int k){return noise(x*0.1+k,y*0.1,i*0.03)*10;}

