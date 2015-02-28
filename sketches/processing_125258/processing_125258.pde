
int sx=250, sy=250;
int cav=0, tmp[]=new int[2];
color pal[]=new color[256];
float map[][]=new byte[sx][sy];
float sub=30, amp=1.34, dec=16;

void setup() {  //setup function called initially, only once
    size(sx, sy);
    background(0);  //set background
    // Set palette
    pal[0]=color(0, 0, 0);
    for(int n=0;n<36;n++) {
        int i=n*7;
        int v=i+10;
        pal[i+1]=color(0, 0, v);
        pal[i+2]=color(0, v, 0);
        pal[i+3]=color(v, 0, 0);
        pal[i+4]=color(0, v, v);
        pal[i+5]=color(v, 0, v);
        pal[i+6]=color(v, v, 0);
        pal[i+7]=color(v, v, v);
    }
    pal[253]=color(255, 255, 128);
    pal[254]=color(255, 255, 128);
    pal[255]=color(255, 255, 128);
    // Start value
    putpixel(sx/2, sy/2, 255);
 
}

void draw() {  //draw function loops 
int x, y;
float vcir, vpix, tf;

    for(x=cav ; x<sx ;x+=3)
        for(y=cav ; y<sy ; y+=3){
            GetCir(x, y, tmp);
            vcir=map[tmp[0]][tmp[1]];
            vpix=map[x][y];
            if(vcir==0) {
                if(vpix>sub) vcir=(vpix-sub)*amp;
            }
            else {
                if(vcir>dec) vcir-=dec;
                else vcir=0;
            }
            if(vpix==0) {
                if(vcir>sub) vpix=(vcir-sub)*amp;
            }
            else {
                if(vpix>dec) vpix-=dec;
                else vpix=0;
            }
            tf=(vpix+vcir)/4.0
            putpixel(x, y, vpix/2.0+tf);
            putpixel(tmp[0], tmp[1], vcir/2.0+tf);
        }
        cav++;
        if(cav>2) cav=0;

}

void GetCir(int x, int y, int i[]) {
int cir=int(random(8));
    // X
    if(cir<3) i[0]=-int(random(2))-1;
    else if((cir==7) || (cir==3)) i[0]=0;
    else i[0]=int(random(2))+1;
    i[0]+=x;
    if(i[0]<0) i[0]=0;
    if(i[0]>=sx) i[0]=sx-1;
    // Y
    if((cir==0) || (cir>5)) i[1]=-int(random(2))-1;
    else if((cir==1) || (cir==5)) i[1]=0;
    else i[1]=int(random(2))+1;
    i[1]+=y;
    if(i[1]<0) i[1]=0;
    if(i[1]>=sy) i[1]=sy-1;
}

void putpixel(int x, int y, float c) {
if(c>255) c=255;
if(c<0) c=0;
    set(x, y, pal[int(c)]);
    map[x][y]=c;
}




