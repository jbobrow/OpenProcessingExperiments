
int x;
int y;
void setup(){
size(200,200);
background(100,random(255),50);}
void draw(){
x=mouseX;
y=mouseY;
for(int i=0;i<200;i+=3){
color c=get(x,y);
stroke(c+c);
line(i,x,y,i);
line(x,i,i,y);
}filter(BLUR);}

