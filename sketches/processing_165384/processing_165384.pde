
byte num;
void setup(){
size(400,400);
}

void draw(){
num +=1;
strokeWeight(1);
fill(255,255,255,200);
rect(25,25,100,100);
fill(#A7A2A2);
rect(150,25,100,100);
fill(0,0,0,20);
rect(275,25,100,100);
fill(255,0,0,15);
rect(25,150,100,100);

fill(0,0,255);
rect(275,150,100,100);
fill(#FF0DFC,0);
rect(25,275,100,100);
fill(#FEFF12);
rect(150,275,100,100);
fill(#05FFF9);
rect(275,275,100,100);
stroke(255);
fill(0,255,0,25);
rect(mouseX,mouseY,num,num);
stroke(255,0,0,10);
strokeWeight(50);
line(0,0,400,400);
line(400,0,0,400);
}


