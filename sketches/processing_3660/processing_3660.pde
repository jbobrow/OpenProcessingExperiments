
float X,Y,x,y,i,z,s=200;float n(){return noise(++z);}void draw(){x=mouseX;y=mouseY;smooth();for(i=0;i<dist(X,Y,x,y)/5;i++){fill(n()*99+156);bezier(X,Y,X+n()*s-s/2,Y+n()*s-s/2,x,y,x,y);}X=x;Y=y;}

