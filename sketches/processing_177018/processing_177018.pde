
void setup(){
size(1000,700);
smooth();
}

background(255,0,0,160);
void draw(){
if(mousePressed){
fill(200,0,0)
}else{
fill(255);
}
triangle(mouseX,mouseY,100,160,245,13);
}

