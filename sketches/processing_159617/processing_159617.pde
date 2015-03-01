
float cx ;
float cy ;
float wid ;
float hei ;
float rad ;
float t ;
void setup(){
size(600,600);
}
void draw(){
background(0,255,0);
//cx = width/2;
cy = height/2;
wid = 100;
hei = 100;
rad = dist(width/2,height/2,mouseX,mouseY);
t = t + 1
cx = 0 + t
fill(0);
ellipse(cx,cy,wid,hei);
}
