
int b,i,g[]={0,1,2,3,4,5};void draw(){for(b=0;b<6;g[b++]+=b){stroke(b*25);for(i=0;i<width;line(i++,0,i,(b>0?noise((i+b*1000+g[b])/50.0,0):1)*height));}}


