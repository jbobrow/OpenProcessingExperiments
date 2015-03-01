
void setup() {
size(600,600);
colorMode(HSB);
}
void draw(){
for(int i=500; i>0;i=i-1){ 

stroke((i/2)+(mouseX/5),550,450);
ellipse(i,300,i,i);
}
}
