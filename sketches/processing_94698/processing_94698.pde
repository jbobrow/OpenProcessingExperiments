
int a,b,i,x,y;void draw(){a=100;b=51;for(i=0;i<=b*b;i++){x=i%b;y=i/b;stroke(255*sin(0.01*frameCount*(sqrt(sq(a/2-x)+sq(a/2-y)))));point(x,y);point(a-x,y);point(x,a-y);point(a-x,a-y);}}
