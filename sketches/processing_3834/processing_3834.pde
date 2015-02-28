
void setup(){
size(500,300);
background(0);}
void draw(){
stroke(random(155),random(255),random(155));strokeWeight(8);filter(BLUR);for(int i=0;i<mouseX;i++){rotate(2*3);point(mouseX+i,mouseY-i);}}

