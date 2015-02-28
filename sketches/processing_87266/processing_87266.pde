
int myX;
int myY;
 
void setup() {
size(300,300);
}
 
void draw() {
background(255);//white
myX=mouseX;
myY=mouseY;
 
if( (myX<=3) || (myY<=3)){
background(128,0,0);
}else {
}
 
fill(0);//black
ellipse(114,60,24,24);//left ear
ellipse(183,60,24,24);//right ear
fill(255,200,200);
ellipse(150,150,75,120);//body
ellipse(150,90,75,75);//head
fill(0,0,0);//black
ellipse(135,90,12,12);//left eye
ellipse(165,90,12,12);//right eye
ellipse(150,108,9,6);//nose
ellipse(114,135,45,45);//left hand
ellipse(183,135,45,45);//right hand
ellipse(114,189,54,54);//left foot
ellipse(183,189,54,54);//right foot
 
fill(255,200,200);
arc(150,114,18,15,myX/12+radians(5),radians(175));//smile
 
 
line(195,120,myX/12-50+204,myY/12+20+99);//L bamboo
line(195,120,myX/12+216,111);//R bamboo
 
}



