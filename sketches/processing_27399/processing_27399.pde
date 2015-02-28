
int canvasSize = 400;
PolyShape ps;
ArrayList psList = new ArrayList();
int col;

void setup() {
    size(canvasSize, canvasSize);

    noStroke();
    smooth();
    frameRate(30);

}

void draw() {
    // fade background
    fill(0, 100);
    rect(0, 0, width, height);
    if (mousePressed) {

        col = color(random(255), random(255), random(255));
        ps = new PolyShape(mouseX, mouseY, col, 50);
        psList.add(psList.size(), ps);
    }
    if (!psList.isEmpty()) {
        for (Iterator i = psList.iterator(); i.hasNext();) {
            PolyShape tmpPs = (PolyShape) i.next();
            tmpPs.draw();
            tmpPs.move();
        }
        if (psList.size() > 30) {
            psList.remove(0);

        } 
    }
}

class PolyShape {

    // center point
    float centerX = 200, centerY = 200;

    float radius = 45, rotAngle = -90;
    float accelX, accelY;
    float springing = (float) 0.001, damping = (float) 0.18;

    // corner nodes
    int nodes = 6;
    float nodeStartX[] = new float[nodes];
    float nodeStartY[] = new float[nodes];
    float[] nodeX = new float[nodes];
    float[] nodeY = new float[nodes];
    float[] angle = new float[nodes];
    float[] frequency = new float[nodes];

    // soft-body dynamics
    float organicConstant = (float) 1;

    int col;
    int opac;

    PolyShape() {

    }

    PolyShape(int tmpCenterX, int tmpCenterY, int tmpCol, int tmpOpac) {
        centerX = tmpCenterX;
        centerY = tmpCenterY;
        col = tmpCol;
        opac = tmpOpac;
    }

    void draw() {

        text(psList.size(),centerX,centerY);
        // iniitalize frequencies for corner nodes
        for (int i = 0; i < nodes; i++) {
            frequency[i] = random(5, 10);
        }

        // calculate node starting locations
        for (int i = 0; i < nodes; i++) {
            nodeStartX[i] = centerX + cos(radians(rotAngle)) * radius;
            nodeStartY[i] = centerY + sin(radians(rotAngle)) * radius;
            rotAngle += 360.0 / nodes;
        }

        // draw polygon
        curveTightness(organicConstant);

        fill(col, opac);
        stroke(255);
        beginShape();
            curveVertex(nodeStartX[0], nodeStartY[0]);
        for (int i = 0; i < nodes; i++) {
            curveVertex(nodeStartX[i], nodeStartY[i]);
        }
            curveVertex(nodeStartX[nodes-1], nodeStartY[nodes-1]);
        endShape(CLOSE);
    }

    void move() {
        // move center point
        float deltaX = mouseX - centerX;
        float deltaY = mouseY - centerY;

        // create springing effect
        deltaX *= springing;
        deltaY *= springing;
        accelX += deltaX;
        accelY += deltaY;

        // move predator's center
        centerX += accelX;
        centerY += accelY;

        // slow down springing
        accelX *= damping;
        accelY *= damping;

        // change curve tightness
        // organicConstant = 1-((abs(accelX)+abs(accelY))*.1);

        // move nodes
        for (int i = 0; i < nodes; i++) {
            nodeX[i] = nodeStartX[i] + sin(radians(angle[i]))
                    * (accelX * 2);
            nodeY[i] = nodeStartY[i] + sin(radians(angle[i]))
                    * (accelY * 2);
            angle[i] += frequency[i];
        }
    }
}
                
