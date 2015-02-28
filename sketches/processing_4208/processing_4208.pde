
float r=.5,w=250,k;void draw(){if(k>0){k=0;textFont(createFont("",55));
translate(w,w);fill(0);textAlign(3);text(key,0,13+15*r);
rotate(2/r);r+=1/r;image(get(),-w,-w,w*2,w*2);
}}void keyTyped(){k=1;}

