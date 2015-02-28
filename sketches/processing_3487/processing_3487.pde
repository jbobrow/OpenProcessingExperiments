
void setup(){size(300,300);colorMode(3,1);}void draw(){int w=width,h=height;for(int i=0;i<w*h;i++){float v=noise((i%w)*.01,i*.01/h,frameCount*.005);set(i%w,i/h,color(.3+v*.3,v,1,.05));}filter(15,2);}

