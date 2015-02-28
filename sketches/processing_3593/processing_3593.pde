
void setup(){size(1,1,P3D);noStroke();}void draw(){background(0);directionalLight(mouseX,mouseY,0,(mouseY/420f-0.5)*2,(mouseX/420f-0.5)*2,-1);for(int i=0;i<9;){translate(9*i,9*i);sphere(15*i++);}}

