
int y=50;
void setup(){
 size (500,500);
 background(161,222,11);
}
void draw(){
line(5,y,500,y);
line(1,470,500,470);
line(50,500,50,9);
line(450,500,450,9);
 fill(126,27,242);
ellipse(25,25,y,y);
ellipse(475,25,y,y);
ellipse(25,500,y,y);
ellipse(477,500,y,y);
fill(237,168,19);
rect(100,40,100,20,100,20);
rect(200,40,100,20,100,20);
rect(300,40,100,20,100,20);
fill(242,242,27);
rect(100,460,100,20,100,20);
rect(200,460,100,20,100,20);
rect(300,460,100,20,100,20);
fill(255,3,180);
rect(0,50,y,y,y,y);
rect(0,100,y,y,y,y);
rect(0,150,y,y,y,y);
rect(0,200,y,y,y,y);
rect(0,250,y,y,y,y);
rect(0,300,y,y,y,y);
rect(0,350,y,y,y,y);
rect(0,400,y,y,y,y);
rect(450,400,y,y,y,y);
rect(450,350,y,y,y,y);
rect(450,300,y,y,y,y);
rect(450,250,y,y,y,y);
rect(450,200,y,y,y,y);
rect(450,150,y,y,y,y);
rect(450,100,y,y,y,y);
rect(450,50,y,y,y,y);
fill(247,235,235);
ellipse(250,250,10,10);
fill(5,0,5);
ellipse(mouseX,mouseY,pmouseX,pmouseY);
fill(224,15,4);
line(mouseX,mouseY,pmouseX,pmouseY);
rect(mouseX,mouseY,pmouseX,pmouseY);
rect(mouseX,mouseY,pmouseX,pmouseY);
//draw pupil
fill(5,0,0);
noStroke();
fill(149,97,0);
ellipse(mouseX,mouseY,60,60);
}

