
int aumenta=0;
void setup(){
size(600,600);
background(48,23,49);
float relleno;
colorMode(HSB); 
}
void draw(){ 
fill(random(307),random(275),245);
ellipse(mouseX,mouseY, height/9,width/9);
}
