
void setup(){
    size(200,200);
    strokeWeight(3); //DICKE!
}

void draw(){ //diese Funktion wird ganz oft ausgeführt!
    background(100,200,255);
    if(mousePressed){
    line(0,0,mouseX,mouseY);
    line(199,0,mouseX,mouseY);
    line(0,199,mouseX,mouseY);
    line(199,199,mouseX,mouseY);
    }
    text(""+mouseX+"\n"+mouseY,mouseX+20,mouseY);
}
