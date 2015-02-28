
float hexagonSize = 16;
float a, b, c, cy, cx;
void setup(){
    smooth();
    frameRate(5);
    size(384,256);
    background(0,0,100);
    noFill();
    stroke(255);
    
    c = hexagonSize;
    b = hexagonSize/2;
    a = sqrt((c*c) - (b*b));
    
    cy = height/2;
    cx = a*2;
}

void draw(){    
    if(random(3)<1)drawHexagon(cx,cy);
    if(random(3)<1)drawHexagon(cx+a,cy-(c+b));
    if(random(3)<1)drawHexagon(cx+a,cy+(c+b));

    cx += a*2;
    if(cx > width){
        background(0,0,100);
        cx = a*2;
    }
}

void drawHexagon(float x, float y){
    if(random(4) < 1) fill(255,200);
    else noFill();
    beginShape();
    vertex(x+0,y-c);
    vertex(x+a,y-b);
    vertex(x+a,y+b);
    vertex(x+0,y+c);
    vertex(x-a,y+b);
    vertex(x-a,y-b);
    endShape(CLOSE);
}
