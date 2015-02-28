
void setup(){
  size(500,500);
  background(10,7,255);
}


void draw(){
fill(255,166,0);
noStroke();
rect (180,180,150,150);
rect (120,350,260,280);
fill(255);
rect(190,200,50,50);//left eye
rect(270,200,50,50);//right eye
float leftEyePos = map(mouseX,0,width,190,220);
float rightEyePos = map(mouseX,0,width,270,300);
fill(0,0,0);
rect(leftEyePos,210,20,20);
rect(rightEyePos,210,20,20);
float lidPos = map(mouseY,0,height,0,500);
fill(10,7,255);
rect(0,0,width,lidPos);
float armPos = map(mouseY,0,height,0,500);
stroke(255,166,0);
line(380, mouseY, 360,mouseY-30);
line(380, mouseY, 380,mouseY-30);
line(380, mouseY, 400,mouseY-30);
line(120, mouseY, 100,mouseY-30);
line(120, mouseY, 120,mouseY-30);
line(120, mouseY, 140,mouseY-30);
line(380, mouseY, 380,height);
line(120, mouseY, 120,500);
}

