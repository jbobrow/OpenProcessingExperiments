
void draw(){int i=0,h=50,a=color(r(255),r(h),r(h));background(a);for(;++i<3;){fill(blendColor(a,color(r(h),r(h),r(h)),32));rect(20,20,360,r(560));filter(11,5);}}float r(int a){return random(a);}

