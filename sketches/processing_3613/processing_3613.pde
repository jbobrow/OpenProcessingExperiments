
int i,y,x,h=16;void draw(){textFont(createFont("",h));x=i%h*h;if(x<1){noStroke();fill(239|i&16);rect(90,y+2,999,h);fill(0);text(hex(i),0,y=i+h);}text(hex(i,2),99+x*2,y);text(char(i),620+x,y);i++;}

