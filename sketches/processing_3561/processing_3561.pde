
float p,k,m,w;void draw(){smooth();w=width;p+=.02;k=noise(p);m=noise(p*.5+9);fill(#ff8800,8*m);rect(0,0,w-1,w-1);translate(w/2,w/2);rotate(k*TWO_PI);scale(m*w/12);stroke(#884400);rect(-9,-9,18,18);}

