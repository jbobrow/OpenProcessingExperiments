
void draw(){float c=50,s=PI/30,m=minute()*s-PI/2,h=hour()*5*s-PI/2;s=second()*s-PI/2;background(-1);line(c,c,c+cos(s)*c,c+sin(s)*c);line(c,c,c+cos(m)*35,c+sin(m)*35);line(c,c,c+cos(h)*9,c+sin(h)*9);}

