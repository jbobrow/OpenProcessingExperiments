
float x=0;
float y=1;
void setup () {
size(500,500);
colorMode(HSB);
}
void draw (){
background(255);
fill(x/2,200,255);
x+=y;
if(x>255 || x==0) {
y=y*-1;
}
noStroke();
triangle(mouseX,mouseY,(width/2)-30,height/2,(width/2)+30,height/2);
triangle(width-mouseX,height-mouseY,width/2,(height/2)-30,width/2,(height/2)+30);
triangle(mouseY,mouseX,(width/2)+30,height/2,(width/2)-30,height/2);
triangle(width-mouseY,height-mouseX,width/2,(height/2)+30,width/2,(height/2)-30);
}
