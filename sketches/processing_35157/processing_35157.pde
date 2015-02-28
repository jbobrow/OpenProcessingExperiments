
void setup(){
size(450,450);
smooth();
stroke(255);
}
void draw(){
if(mousePressed){
fill(0,154,205);
} else{
fill (209,95,238);
}
triangle(mouseX,mouseY, 50,50,80,80);
}
                
                
