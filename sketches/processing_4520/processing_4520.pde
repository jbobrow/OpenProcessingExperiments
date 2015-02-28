
int x=floor(random(100)),y=floor(random(100)),a,b,i;
void draw(){if((a==x)&(b==y)){background(0);textFont(loadFont("a"));text(str(i),45,50);}}
void mouseReleased(){i++;a=mouseX;b=mouseY;}

