
float x=floor(random(500)),y=floor(random(500)),c,a,b;
void draw(){a=mouseX;b=mouseY;c=sqrt(sq(a-x)+sq(b-y))*0.36;background(255-c,0,c);if((a==x)&(b==y))background(255);}



