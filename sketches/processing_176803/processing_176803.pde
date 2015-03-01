
void setup(){
    size(400,400);
}
void draw(){
    background(255,255,255);
    if(mousePressed){
        fill(0,255,0);
        triangle(200,20,10,380,390,380);
    }
    fill(255,0,0);
    rect(190,200,20,70);
    fill(30,90,220);
    triangle(190,270,190,340,180,340);
    triangle(210,270,210,340,220,340);
    fill(240,200,220);
    triangle(190,200,140,195,140,200);
    triangle(210,200,215,260,220,260);
    ellipse(200,185,35,35);
    line(140,195,mouseX,mouseY);
    fill(150,40,220);
    ellipse(mouseX,mouseY,30,30);
    
}
