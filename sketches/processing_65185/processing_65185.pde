
void setup(){
size(500,500);
background(0);
}

void draw(){
background(0);
for(int i =0;i<500;i+=4){
float distance = abs(mouseX - i);
fill(distance,random(100),255);
noStroke();
rect(i,0,10,height);
}
}
