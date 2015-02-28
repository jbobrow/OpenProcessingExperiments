
PImage i;void draw(){i=loadImage("http://207.251.86.248/cctv8.jpg");for(int j=0;j++<9;){int x=(int)random(320),y=(int)random(240);fill(i.get(x,y));rect(x,y,9,9);}filter(BLUR,1);filter(DILATE);}

