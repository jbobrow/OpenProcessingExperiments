
int w=300,m=w*460,c=w/2;
void setup(){size(300,300);colorMode(RGB,2);}

int t;

void draw() { 
  for(int i=1;i<m;++i) {
    float a=i*3,r=sqrt(i/3);
    set((int)(c+sin(a)*r),(int)(c+cos(a)*r),color(sin(t*i*.001)+1));
   }
   t++;
 }


