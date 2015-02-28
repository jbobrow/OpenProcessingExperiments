
void setup(){
size(500,500);
colorMode(HSB,360,100,100);
}
void draw(){
background(0);
for(int x=0;x<width;x+=5){
stroke(200,x,100);
noFill();
ellipse(250,x,x,x+5);
}
for(int x=0;x<width;x+=5){
stroke(200,x,100);
noFill();
ellipse(x,250,x,x-5);
}
for(int x=0;x<85;x+=5){
stroke(350,x,width);
noFill();
rect(x-5,x-5,x,x);
}
for(int x=0;x<40;x+=5){
stroke(350,x,width);
noFill();
rect(x-5,340-1.5*x,x,x);
}
for(int x=0;x<40;x+=5){
stroke(350,x,width);
noFill();
rect(345-1.5*x,x-5,x,x);
}
}

