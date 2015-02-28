
float h2;
float h4;
float scale=.07;

float[] lerps;
float[] offsets;

void setup() {
   size(500,500); 
   h2=height/2.;
   h4=height/4.;
   background(0);
   lerps=new float[height/2];
   for (int i=0; i<lerps.length; i++) lerps[i]=lerp(0,1,(float)i/lerps.length);
   offsets=new float[height/2];
   for (int i=0; i<offsets.length; i++) offsets[i]=0;
}

void draw() {
  for (int i=0; i<offsets.length; i++) offsets[i]+=lerps[i];

  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    float x=i%width;
    float y=i/width;
    if (y<h2) {
       float r=(y>h4) ? (y-h4)/h4*255. : 0;
       float g=0;
       float b=(h4-abs(y-h4))/h2*255.;
       pixels[i]=color(r,g,b);
    }
    else {
      float n=noise((x*scale)-offsets[(int)(y-h2)],y/scale,millis()/5000.);
      float a=255*(1-n);
      pixels[i]=color(a,a,255);
    }
  }
  updatePixels();
}


