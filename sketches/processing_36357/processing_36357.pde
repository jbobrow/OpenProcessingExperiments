
void setup(){
size(300,300);
background(150);
}
int x= 50;
int a=255;
int b=0;
int c=width;
int d=height;
void draw(){
background(155);
if(mouseX<width/2){
fill(a,b,0);
ellipse(75,75,75,75);
line(x,200,x+40,200);  //car1
line(x,200,x-10,210);
line(x+40,200,x+50,210);
line(x-10,210,x+50,210);
fill(0);
ellipse(x+10,215,10,10);
ellipse(x+30,215,10,10);
}else{
fill(0,255,0);
ellipse(225,75,75,75);
line(mouseX,200,mouseX+40,200); //car2
line(mouseX,200,mouseX-10,210);
line(mouseX+40,200,mouseX+50,210);
line(mouseX-10,210,mouseX+50,210);
fill(0);
ellipse(mouseX+10,215,10,10);
ellipse(mouseX+30,215,10,10);
mouseX++;
}
strokeWeight(3);
line(width/2,0,width/2,height);
}
void mouseDragged(){
x=mouseX;
a=0;
b=255;
height=height/2;
}

