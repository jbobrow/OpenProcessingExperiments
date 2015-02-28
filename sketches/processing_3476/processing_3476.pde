
float t,s,c,v=99;
int w=255,i=20;
void setup(){
size(w,w);
}
void draw(){
background(w); 
s=(sin(t)+1)*v;
c=(cos(t)+1)*v;
t+=.03;
fill(0);
ellipse(s,v,i-c,c);
ellipse(9+c,w,i-c,c);
noFill();   
bezier(s,v,v,5,w,s,9+c,w);
}


