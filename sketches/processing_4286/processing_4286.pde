
void draw(){int x,y,h=255;background(h);for(y=0;y<480;y=y+15){for(x=0;x<640;x=x+15){int a=color (r(h),200,210);fill(a,60);noStroke();ellipse(x,y,r(200),y+45);}}}float r(int a){return random(a);}


