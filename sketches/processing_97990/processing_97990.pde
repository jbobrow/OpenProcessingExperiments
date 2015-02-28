
void setup()
{
    size(450, 200, P3D);
}

void draw()
{
    background(163, 12, 240);
    fill(240, 12, 160);
    
    pushMatrix();
    translate(width/3, height/2);
    rotateX(-PI/6);
    rotateY(radians(frameCount+35));
    box(50);
    popMatrix();
    
    pushMatrix();
    translate( (width/3) * 2, height/2);
    rotateX(-PI/6);
    rotateX(radians(frameCount+20));
    box(50, 40, 100);
    popMatrix();
    
    
    
     fill(12, 222, 240);
    pushMatrix();
    translate(width/6, height/4);
    rotateX(-PI/6);
    rotateY(radians(frameCount+15));
    box(20);
    popMatrix();
    
    pushMatrix();
    translate( (width/9) * 4, height/4);
    rotateX(-PI/6);
    rotateX(radians(frameCount+30));
    box(25, 20, 50);
    popMatrix();
}
