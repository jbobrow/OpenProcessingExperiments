
int i;float[]a=new float[18];void draw(){smooth();stroke(key);if(!mousePressed)background(-1);a[9]=mouseY;a[0]=mouseX;for(i=0;++i<9;)line(a[i],a[i+9],a[i]+=(a[i-1]-a[i])/i,a[i+9]+=(a[i+8]-a[i+9])/i);}
