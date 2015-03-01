
//Assignment 6a: Design something by using mousePressed() and/or mouseReleased().
//Assignment 6b: Design something by using mouseMoved() and/or mouseDragged(). 
float x=random(255);
void setup (){
size(400,400);
}
void draw (){
background(255);
noStroke();
fill(x,120,140);
for(int a=20;a<400;a=a+20){
for(int z=400;z>20;z=z-20){
rect(a,3,z,a);
}
}
}
void mouseDragged(){
ellipse(20,20,20,20);
}

