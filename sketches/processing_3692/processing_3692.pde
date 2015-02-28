
int t,x,X,Y,c,w=255,m;void draw(){t++;background(0);for(x=0;++x<w*w;){X=x%w+n();Y=x/w+n();c=50+(get(X,Y)>>8&w);set(X,Y,color(c,c,c*2));}}int n(){return int(noise(x%w/99f,x/w/99f,t/99f+m++%2)*w-w/2);}

