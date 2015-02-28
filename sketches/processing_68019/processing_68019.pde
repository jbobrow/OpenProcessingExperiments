
//请在屏幕上移动你的鼠标
//please put your mouse on the screen and then move it
void setup(){
size(400,400);
smooth();

}

void draw(){
  background(255);
  int R=10;
  fill(10);
  ellipseMode(RADIUS);
for (int x=R;x<=width-R;x+=2*R){
  for (int y=R;y<=height-R;y+=2*R){
    float d=dist(x,y,mouseX,mouseY);
    float power=d/20;
    if(power>R){
        ellipse(x,y,R,R);
     }else{
       ellipse(x,y,power,power);
    }
  }
 }
}
