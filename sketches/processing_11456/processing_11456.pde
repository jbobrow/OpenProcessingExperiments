
int col;
void setup(){

size(400,400);
background(0);
colorMode(HSB); 
col = 0;

}
void draw(){

col = (col+1) % 256;
fill(col,255,255,100);
ellipse(
random(mouseX-30, mouseX+30) ,random(mouseY-30,mouseY+30) 
, 20 , 20 );

}

void mousePressed(){

background(444);

}






