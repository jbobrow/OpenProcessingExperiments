
int x=0;
void setup(){
size(600,600);
colorMode(HSB);
}
void draw () {
background(0);
x= x+3;
strokeWeight(30);
stroke(random(x),x,255);
line(0,0,mouseX,mouseY);
strokeWeight(30);
stroke(x,random(x),255);
line(width,0,mouseX,mouseY);
strokeWeight(30);
stroke(random(x),x,255);
line(width/2,height,mouseX,mouseY);
if (x>255||x==0){
}
}
