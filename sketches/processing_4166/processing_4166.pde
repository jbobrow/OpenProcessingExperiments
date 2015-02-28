
void draw(){
smooth();
background(255);
for(int i=0;i<3249;i++){
float a,x=i/57*10,y=i%57*10;
pushMatrix();
translate(x,y);
a=atan2(mouseY-y,mouseX-x);
rotate(a);
line(0,0,5,0);
popMatrix();}}

