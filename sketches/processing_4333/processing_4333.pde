
size(647,400,P3D);noStroke();lights();for(int z=0;z<100;z+=10){float x=0,y=320;for(int j=0;j<500;j++){x+=random(-7,10);y+=random(-x/30,x/34);translate(x,y,z);sphere(5);translate(-x,-y,-z);}}


