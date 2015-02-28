
void draw(){loadPixels();int c,i=0;while(i++<9999){c=125+millis()%(1+i)/79;pixels[i]=color(c,c-30,c-80);}updatePixels();}//#p5 #pixellax
