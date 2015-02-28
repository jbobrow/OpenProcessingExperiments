
float hexagonSize = 100;
float a,b,c;
void setup(){
    background(0,0,50);
    size(384,384);
    
    c = hexagonSize;
    b = hexagonSize/2;
    a = sqrt((c*c) - (b*b));
    
    text("c = 100\nb = c/2\na = sqrt((c*c) - (b*b))",20,20);
}

void draw(){
    int cy = height/2, cx =width/2;
    
    noStroke();
    drawHexagon(cx,cy);
    
    //center
    fill(255,0,0);
    ellipse(cx,cy,8,8);
    
    //right triangle
    noStroke();
    fill(255,200,200);
    beginShape();
    vertex(cx,cy);
    vertex(cx,cy-b);
    vertex(cx+a,cy-b);
    endShape(CLOSE);
    
    fill(255,0,0);
    textAlign(CENTER);
    text("c",cx+a/2,cy-b/2+9);
    text("b",cx-7,cy-b/2);
    text("a",cx+a/2,cy-b);
    
    // equilateral triangle
    stroke(255,100,100);
    noFill();
    beginShape();
    vertex(cx,cy);
    vertex(cx,cy-c);
    vertex(cx+a,cy-b);
    endShape(CLOSE);
    
    noLoop();
}


void drawHexagon(float x, float y){
    beginShape();
    vertex(x+0,y-c);
    vertex(x+a,y-b);
    vertex(x+a,y+b);
    vertex(x+0,y+c);
    vertex(x-a,y+b);
    vertex(x-a,y-b);
    endShape(CLOSE);

}
