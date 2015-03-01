
String test;
void setup(){
    size(200,200);
    test = "testing";
}

void draw(){
    noCursor();
    background(255,255,255);
    if(millis()%100 == 0){
        fill(random(255),random(255),random(255));
    }
    ellipse(mouseX, mouseY, 30, 30);
}
