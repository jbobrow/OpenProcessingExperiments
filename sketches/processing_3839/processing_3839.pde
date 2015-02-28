
int e=1;
void setup(){
size(500,300);
background(0);}
void draw(){fill(0);for(int i=0;i<500;i++){ellipse(i,random(300),9,9);}fill(255);if(e<=50){e++;}else{e=1;}ellipse(mouseX,mouseY,e,e);filter(BLUR);}

