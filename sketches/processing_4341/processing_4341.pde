
float w=254,r=w/2,d=16,t;
void setup(){size(286,346,P3D);}
void draw(){fill(0,99);rect(d,d,w,w);tint(w,w);translate(r,r,-w-mouseY*2);rotate(3*t,cos(t),0,sin(t));image(get(),-r,-r);t+=(mouseX-r)*1E-4;}
