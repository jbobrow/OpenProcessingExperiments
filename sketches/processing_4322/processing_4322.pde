
void setup(){
size(370,370);
}
void draw(){
background(255,255,255);
noStroke();
fill(0,4);
for(int i=7;i<170;i=i+13){
for(int o=7;o<170;o=o+13)
rect(i,o,(mouseX/2)+1,(mouseY/2)+1);
}
}


