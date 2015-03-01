
int x=0;
int s=1;
void setup(){
size(500,500);
colorMode(HSB);
background(30);
}
void draw () {
x=x+s;
strokeWeight(random(15));
stroke(random(150),x,255);
line(0,0,mouseX,mouseY);
//strokeWeight(random(50));
stroke(x,random(255),150);
line(width,0,mouseX,mouseY);
strokeWeight(random(70));

if (x>255||x==0){
s=s*-1;
}
}

