
noStroke();background(59,6,5);for(int z=50;z<220;z+=25){float x=0,y=350;for(int j=0;j<500;j++){x+=random(-7,10);y+=random(-x/17,x/19);for(int i=10;i>=1;i-=3){fill(z-i*5.0);ellipse(x+i,y+i,i*3,i*3);}}}


