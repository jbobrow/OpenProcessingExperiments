
int w=768,c,i,x,y,k;
void draw(){
for(i=0;++i<9999;){
c+=mouseX;c%=w*w;x=c%w;y=c/w;
k=((x^y)&(1<<mouseY/60))>0?millis():0;
set(x,y,color(k%256,k*2%256,k*3%256));
}
blend(1,1,w-1,w-1,0,0,w,w,1);
}


