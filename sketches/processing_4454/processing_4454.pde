
void setup(){size(500,500,P3D);}void draw(){noFill();background(255);int a=mouseX,b=mouseY,c=1;camera(b,b,a,b,50,0,0,1,0);translate(50, 50, 0);for(;c++<100;){rotateX(-PI/c); rotateY(PI/c);box(13*c);}} 


