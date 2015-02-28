
int f,i,p[];void draw(){
loadPixels();p=pixels;
for(i=0;i++<65535;)p[i]++;filter(BLUR);
for(i=0;i++<65535;)p[i]--;updatePixels();
translate(128,128);rotate(++f/19f);fill(128,1);
rect(0,0,f/9,f/9);
}

