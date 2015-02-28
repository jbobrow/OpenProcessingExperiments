
int i,d,w=255,a[]={2,3*w,3,4*w,-4,-w};
void draw(){
loadPixels();
for(i=4*w;++i<w*w-w*4;){
d=abs(i%w/2-i/w^i%w/2+i/w);
d=(d%33)%9;
pixels[i]=color(d<6?(pixels[i+a[d]]&w)+d:0);
}
updatePixels();
}

