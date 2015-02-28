
float x=-1,y=-1,a,b;void setup(){size(320,240);}void draw(){if(y>240)b=-1;if(y<0)b=1;if(x>320)a=-1;if(x<0)a=1;background(99);x+=a*1.5+cos(240/y);y+=b*2+sin(240/y);point(x,y);if(random(140)<2)a*=-1.2;}

