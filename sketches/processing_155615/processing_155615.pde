
int t;

void setup(){
size(400,400);
background(255);
fill(255);
}

void draw() {
fill(237,202,156);
ellipse(height/2,width/2.1,300,340);
fill(0);
ellipse(height/3,width/2.2,70,85);
ellipse(height/1.50,width/2.2,70,85);
fill(237,202,156);
stroke(237,202,156);
ellipse(height/3,width/2.09,69,84);
ellipse(height/1.5,width/2.09,69,84);
fill(0);
ellipse((height/2)+((mouseX-200)/5), width/1.65,180,130);
fill(237,202,156);
ellipse((height/2)+((mouseX-200)/5), width/1.7,179,129);
if (t==1){
fill(255,205,188);
ellipse(height/3.2,width/1.9,65,35);
ellipse(height/1.45,width/1.9,65,35);
}
if (t==0){
fill(237,202,156);
ellipse(height/3,width/2,50,30);
ellipse(height/3,width/2,50,30);
}
}

void keyPressed() {
switch (keyCode) {
case  LEFT:
t=0;
break;
case RIGHT:
t=1;
}
}






