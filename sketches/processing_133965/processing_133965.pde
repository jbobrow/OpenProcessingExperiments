
float x=0;
float y=1;
void setup () {
size(500,500);
colorMode(HSB);
}
void draw (){
background(x/3,200,255);
fill(x/2,200,255);
x+=y;
if(x>255 || x==0) {
y=y*-1;
}
noStroke();
quad(0, height/3, 0, (height/3)*2, (width/3), (height/3)*2, width/3, height/3);
quad(width/3,0, width/3,height/3, (width/3)*2, (height/3), (width/3)*2, 0);
quad((width/3)*2, (height/3), (width/3)*2, (height/3)*2, width, (height/3)*2, width, height/3);
quad(width/3, (height/3)*2, width/3, height, (width/3)*2, height, (width/3)*2, (height/3)*2);
fill(x/1,200,255);
quad(width/6, 0,0, height/6, width/6, (height/6)*2, (width/6)*2, (height/6));
quad((width/6), (height/6)*4,0, (height/6)*5, width/6, height, (width/6)*2, (height/6)*5);
quad((width/6)*5, 0,(width/6)*4, height/6, (width/6)*5, (height/6)*2, (width/6)*6, (height/6));
quad((width/6)*5, (height/6)*4,(width/6)*4, (height/6)*5, (width/6)*5, height, width, (height/6)*5);
quad((width/2), (height/6)*2,(width/6)*2, (height/6)*3, width/2, (height/6)*4, (width/6)*4, height/2);
}
