
int x,y,i,w=512;
void setup(){
for(i=0;++i<w*w;)set(i%w,i/w,-1^r(1<<24));}
void draw(){
for(i=0;++i<w;){x=y;y=r(w);
set(x+r(3)-1,y+r(3)-1,get(x,y,r(99),r(99)));}}
int r(int a){return int(random(a));}

