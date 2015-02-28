
float x;
float y;
float m;
float n;
float colour;

void setup(){
    size(500,500);
    background(255);
    smooth();
    frameRate(20);
}

void draw(){

//give variables random values

    x = random(500);
    y = random(500);
    m = random(500);
    n = random(500);
    colour = random(255);
    
    stroke(colour);
    line(width/2,y,mouseX,mouseY)
    
    stroke(mouseY,100,mouseX);
    line(x,height/2,mouseX,mouseY);
}
