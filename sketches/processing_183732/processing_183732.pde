
void setup(){
size(300,300);
background(46,139,87);
noStroke();
frameRate(50);
smooth();
}

void draw(){
flash();
cross();
}
 



void flash(){
for(int x = 0; x <= 600; x += 50) {
for(int y = 0; y < 600; y += 50){



float a= random(255);
float b= random(50);
float c= random(45);
float d= random(255);

fill(a,b,c,d);
ellipse(150,150,x,y);
}}}


void cross(){
for(int z=255; z>=0;z=z+10){

fill(z,25,25,z);
ellipse(150,150,z,z);}}
