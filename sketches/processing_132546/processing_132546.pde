
int x=0;
int s=1;
void setup(){
size(500,500);
colorMode(HSB);
background(255);
}
void draw () {
x=x+s;
strokeWeight(random(20));
stroke(random(255),x,255);
line(0,0,mouseX,mouseY);
strokeWeight(random(20));
stroke(x,random(255),255);
line(width,0,mouseX,mouseY);
strokeWeight(random(20));
stroke(random(255),255,x);
line(width/2,height,mouseX,mouseY);
if (x>255||x==0){
s=s*-1;
}
}
