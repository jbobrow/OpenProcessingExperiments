
int c=int(random(256));String t="";int x;void draw(){textFont(createFont("",30));background(c,random(256),random(256));text(t,9,50);x=int(t);}void keyReleased(){t+=key;if(key==' '){t=str(abs(c-x));}}


