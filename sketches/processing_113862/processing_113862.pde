
void setup(){
    size(300,300);
    background(255);
    smooth();
}

void draw(){
    stroke(0,0,0);
    strokeWeight(5);
// Lineas Horizontales
    line(0,60,300,60)   ;
    line(0,120,300,120);
    line(0,200,300,200);
    line(0,260,300,260);

//Lineas verticales
    line(40,0,40,300);
    line(100,0,100,300);
    line(160,0,160,300);
    line(260,0,260,300);

//Rellenos
    fill(230,120,20);
    rect(40,60,60,60);
    fill(20,89,45);
    rect(100,120,60,80);
    fill(45,45,140);
    rect(260,120,100,80);

}
