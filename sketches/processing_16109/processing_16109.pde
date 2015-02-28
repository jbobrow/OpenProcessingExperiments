
float x=100;
float y=100;
float tx,ty;

void setup(){
  size(200,200);
}
void draw(){
    background(255);
    if(mousePressed){
    tx= mouseX;
    ty= mouseY;
    }      
    x=x+(tx-x)+0.1;
    y=y+(ty-y)+0.1;
        ellipse(x,y,10,10);
}
