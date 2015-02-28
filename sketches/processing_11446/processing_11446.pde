
int w=400,x,y,nx,ny;
void setup(){background(255);size(w,w);noSmooth();for(int i=0;i<w*w;++i){set(i%w,i/w,color(255 - random(50) -100,255-random(60),255-random(20)));}}
void draw(){noStroke();/*fill(255,5);rect(0,0,w,w)*/;for(int i=0; ++i<w*w;){int dirX= int(random(-2,4)); int dirY = -dirX*i/w;
  x=i%w; y=i/w; nx=(i+dirX)%w; ny=(i+dirY)/w;if(x != nx && y == ny){ set(x,y, color((-x*.05+y*.5)*cos(frameCount*.025), (x*.25+y*.25)*sin(frameCount*.005)*1.5, (y)*255));}
  set(x,y, get(nx,ny));}}

