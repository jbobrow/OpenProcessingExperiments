
void setup(){
 size(350,350);
 smooth();
 stroke(0,154,205);
 }
void draw(){
if(mousePressed){
 fill(0);
} else {
fill (255);
}
rect(mouseX, mouseY,60,60,100,100);
}
                
                
