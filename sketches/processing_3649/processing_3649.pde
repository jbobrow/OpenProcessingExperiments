
float n,z=0;int x,y,d=200;void draw(){loadPixels();z=noise(n)*d;for(x=0;x<d;x++){for(y=0;y<d;y++){pixels[y*d+x]=color(dist(x,y,z,z)/dist(x,y,noise(n,n)*d,noise(n,n,n)*d)*9);}}updatePixels();n+=0.1;}

