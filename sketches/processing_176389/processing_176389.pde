
color c;
void setup(){
size(300,300);
noStroke();
rectMode(CORNER);
}
void draw(){
for(int m=0;m<=300;m++){
for(int l=0;l<=300;l++){

c=color(mouseX,m,l);
set(m,l,c);
}
}
for(int a=0;a<300;a+=25){
for(int b=0;b<300;b+=25){
//c= color(300-mouseX,a,b);
c=c+2;
fill(c,c,c);
rect(a+2,b+2,20,20);
}
}
}
}
