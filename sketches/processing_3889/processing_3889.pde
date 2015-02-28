
void setup(){
size(500,300);}
void draw(){
background(random(200),random(200),random(200));for(int i=0;i<500;i++){blend(i,int(random(300)),i,8,int(random(500)),i-int(random(200)),9,i,SOFT_LIGHT);}}

