
float r = 0.0;

void setup(){
    size(1280, 720, P3D);
    noFill();
    strokeWeight(0.4);
    frameRate(120);
    smooth(8);
}

void draw(){
    
    int speed=100;
    int reds=220;
    int greens=220;
    int blues=220;
    if (mousePressed) {
        speed = 6;
        reds=255;
        greens=0;
        blues=0;
    }

    r += 0.01 + abs(sin(frameCount/50)/speed); // dodalem absa, przyspiesza przy obracaniu1


    
    stroke(255);
    pushMatrix();
    translate(width/2, height/2,200);
    rotateY(1.25);
    rotateX(-0.4);
    //ellipse(width/2, height/2, 160, 160);
    sphereDetail(32);
    //sphere(100);

    popMatrix();

    int ir = int(r);
    if (ir>16) {
        ir=1;
    }

    sphereDetail(ir);
    
    fill(255);
    textSize(42);
    //text("Shit", width/2+90, height/2);

    
    fill(15, 5);
    rect(0, 0, width, height);
    translate(0, 0, 200);
    noFill();
    
    translate(mouseX, mouseY, 0);
    scale(7);
    pushMatrix();
    rotateY( mouseX*0.01+r);
    rotateX( mouseY*0.01 );
    int alp = 1;
    stroke(reds, greens, blues);
    alp +=1;
    box(7);
    stroke(reds, greens, blues);
    sphere(15);
    
    popMatrix();
}
