
int i,j,l,w=110;void draw(){j+=1;textFont(createFont("",9));fill(255,20);rect(0,0,w,w);for(i=0;++i<w;l=int(noise(j/10&(i%10)*10,j/10&(i/10)*10)*100),fill(l*4))text(l,(i%10)*10,(i/10)*10);filter(11);}

