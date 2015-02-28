
// ©2012 Gaston Yagmourian
// yagmourian.com/gaston
// gastony@gmail.com

// experiment from my class at The Crucible
// rotates (following the mouse) an ever-rotating geometric object

float rot;

void setup(){
    size(390, 390, P3D);
    background(0);
}

void draw(){
    // translate(width/2, height/2, 0);
    translate(mouseX, mouseY, 0);

        pushMatrix();
        strokeWeight(2);
        stroke(255, 128/4);
        rot -= 0.01;
        rotateY(rot);
        rotateX(-rot);

            pushMatrix();
            rotateY(radians(90));
            line(-60, 0, 0, 60, 0, 0);
            line(0, -60, 0, 0, 60, 0);
            line(-60, 0, 0, 0, -60, 0);
            line(60, 0, 0, 0, 60, 0);
            line(0, 60, 0, -60, 0, 0);
            line(60, 0, 0, 0, -60, 0);
            popMatrix();

            pushMatrix();
            rotateX(radians(90));
            line(-60, 0, 0, 60, 0, 0);
            line(0, -60, 0, 0, 60, 0);
            line(-60, 0, 0, 0, -60, 0);
            line(60, 0, 0, 0, 60, 0);
            line(0, 60, 0, -60, 0, 0);
            line(60, 0, 0, 0, -60, 0);
            popMatrix();

            pushMatrix();
            rotateZ(radians(90));
            line(-60, 0, 0, 60, 0, 0);
            line(0, -60, 0, 0, 60, 0);
            line(-60, 0, 0, 0, -60, 0);
            line(60, 0, 0, 0, 60, 0);
            line(0, 60, 0, -60, 0, 0);
            line(60, 0, 0, 0, -60, 0);
            popMatrix();
        popMatrix();
}

void mousePressed(){
    background(0);  
}
