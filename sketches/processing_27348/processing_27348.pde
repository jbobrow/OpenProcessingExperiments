
int amp = 108;
int freq = 4;
int gx;
int dx=0;
int n;
string bits = "01010000011100100110111101100011011001010111001101110011011010010110111001100111"; //Processing
int modu=0;

void setup() {
    size(360,360);
    frameRate(60);
}
void draw() {
    background(#003300);
    drawgrid();
    stroke(#33FF33);
    for (x=0; x<=360; x++) {
        gx=x+dx;
        n = floor(gx / 90) % bits.length;
        switch (modu) {
            case 0:
                y = height/2 - int(bits[n]) * amp * sin(freq*radians(gx)); //ASK
            break;
            case 1:
                y = height/2 - amp * sin((int(bits[n])+1) * freq*radians(gx)); //FSK
            break;
            case 2:
                y = height/2 - amp * sin(freq*radians(gx)+(int(bits[n])*HALF_PI)); //PSK
            break;
        }
        point(x,y);
    }
    dx+=15;
}
void mouseClicked() {
    modu++;
    if (modu>2) {
        modu=0;
    }
}
void drawgrid() {
    stroke(#000000);
    for (x=0; x<360; x+=36) {
        for (y=0; y<360; y+=2) {
            point(x,y);     
        }
    }
    for (y=0; y<360; y+=36) {
        for (x=0; x<360; x+=2) {
            point(x,y);     
        }
    }
}               
