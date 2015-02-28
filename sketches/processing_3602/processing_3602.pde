
int c;byte[]b=loadBytes("../c.pde");void draw(){textFont(createFont("",9));filter(12);fill(-1,9);rect(0,0,275,400);fill(-1<<16);rect(0,2*c,b[c],2);text(char(b[c]),150+c%8*16,9+c/8*16);c=c>198?36:c+1;}
