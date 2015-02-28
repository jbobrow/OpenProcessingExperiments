
void setup(){
    size(500,500);
    x = 250
    y = 50
}
 
void draw(){
    background(225);
    ellipse(x,(y++)%width, 20, 20);
}
