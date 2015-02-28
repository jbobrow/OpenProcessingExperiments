
size(800,600);
float xnoise=0.0;
float ynoise=0.0;
float inc=0.005;
colorMode(HSB,360,100,100);
for (int y=0; y<height; y++) {
    for (int x=0; x< width; x++) {
        float S=noise(xnoise,ynoise)*100;
        stroke(220,S,100);
        point(x,y);
        xnoise=xnoise+inc;
    }
    xnoise=0;
    ynoise=ynoise+inc;
}
