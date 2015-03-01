
///////////////////////////////////////////////////////////
// Variable definitions ///////////////////////////////////
///////////////////////////////////////////////////////////
int chosenFunction = 0;
float particleAngle = 0;
float particleFormation = 0;
float radius = 150;
Particle[] particles;
PImage arrowImage;


///////////////////////////////////////////////////////////
// Init ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////
void setup() {
    size(200, 200, P2D); // Set window size and renderer
    noStroke();
    particles = new Particle[11]; // Create particles
    for(int n = 0; n < particles.length; n++)
        particles[n] = new Particle(width/2, height/2);
    arrowImage = createArrowImage();
}


///////////////////////////////////////////////////////////
// Create the arrow image /////////////////////////////////
///////////////////////////////////////////////////////////
PImage createArrowImage() {
    PGraphics buffer = createGraphics(14, 14, P2D);
    buffer.beginDraw();
    buffer.background(#000000, 0);
    buffer.noStroke();
    buffer.fill(#c6c6c6);
    buffer.beginShape();
    buffer.vertex(5, 0);
    buffer.vertex(9, 0);
    buffer.vertex(9, 6);
    buffer.vertex(14, 6);
    buffer.vertex(8, 14);
    buffer.vertex(0, 6);
    buffer.vertex(5, 6);
    buffer.endShape();
    buffer.endDraw();
    return buffer.get();
}


///////////////////////////////////////////////////////////
// Render /////////////////////////////////////////////////
///////////////////////////////////////////////////////////
void draw() {
    background(#c6c6c6); // Fill background
    particleFormation = particleFormation < 1 ? particleFormation+0.005 : 1;
    particleAngle += 0.02;
    switch(chosenFunction) { // Choose sin/cos-function & calculate position
        case 1:
            float midX = width/2;
            float midY = height/2 - (polyCos(0, 3) + polyCos(PI, 3)) * radius * 0.5;
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = midX + polySin(a, 3) * radius;
                particles[n].targetY = midY + polyCos(a, 3) * radius;
            }
            displayInfo("polySin(a, 3) / polyCos(a, 3)");
        break;
        case 2:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + polySin(a, 4) * radius;
                particles[n].targetY = height/2 + polyCos(a, 4) * radius;
            }
            displayInfo("polySin(a, 4) / polyCos(a, 4)");
        break;
        case 3:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + polySin(a, 5) * radius;
                particles[n].targetY = height/2 + polyCos(a, 5) * radius;
            }
            displayInfo("polySin(a, 5) / polyCos(a, 5)");
        break;
        case 4:
            float midX = width/2;
            float midY = height/2 - (polyCos(0, 3) + polyCos(PI, 3)) * radius * 0.5;
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = midX + polySin(a, 4) * radius;
                particles[n].targetY = midY + polyCos(a, 3) * radius;
            }
            displayInfo("polySin(a, 4) / polyCos(a, 3)");
        break;
        case 5:
            float midX = width/2;
            float midY = height/2 - (polyCos(0, 3) + polyCos(PI, 3)) * radius * 0.5;
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = midX + sin(a) * radius;
                particles[n].targetY = midY + polyCos(a, 3) * radius;
            }
            displayInfo("sin(a) / polyCos(a, 3)");
        break;
        case 6:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + infSin(a) * radius;
                particles[n].targetY = height/2 + infCos(a) * radius;
            }
            displayInfo("infSin(a) / infCos(a)");
        break;
        case 7:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + infSin(a) * radius;
                particles[n].targetY = height/2 + polyCos(a, 4) * radius;
            }
            displayInfo("infSin(a) / polyCos(a, 3)");
        break;
        case 8:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + sin(a) * radius;
                particles[n].targetY = height/2 + infCos(a) * radius;
            }
            displayInfo("sin(a) / infCos(a)");
        break;
        default:
            for(int n = 0; n < particles.length; n++) {
                float a = particleAngle + PI*2 / particles.length * n;
                particles[n].targetX = width/2 + sin(a) * radius;
                particles[n].targetY = height/2 + cos(a) * radius;
            }
            displayInfo("sin(a) / cos(a)");
        break;
    }
    fill(#0078ff); // Update & render particles
    particles[0].updateAndRender();
    fill(#ffffff);
    for(int n = 1; n < particles.length; n++)
        particles[n].updateAndRender();
}


///////////////////////////////////////////////////////////
// Display info text //////////////////////////////////////
///////////////////////////////////////////////////////////
void displayInfo(String infoText) {
    fill(#ffffff);
    text("Option "+chosenFunction+": "+infoText, 10, 20);
    fill(#0078ff);
    text("Angle: "+(round((particleAngle % TWO_PI)*100)/100), 10, height-10);
}


///////////////////////////////////////////////////////////
// Mouseclicked ///////////////////////////////////////////
///////////////////////////////////////////////////////////
void mousePressed() {
    chosenFunction = (chosenFunction+1) % 9;
    particleAngle += HALF_PI;
    particleFormation = 0;
}


///////////////////////////////////////////////////////////
// Infinity sinus /////////////////////////////////////////
///////////////////////////////////////////////////////////
float infSin(float angle) {
    return angle % TWO_PI < PI ? sin(angle*2 + HALF_PI)*0.5 - 0.5 : sin(HALF_PI - (angle-HALF_PI)*2)*0.5 + 0.5;
}


///////////////////////////////////////////////////////////
// Infinity cosinus ///////////////////////////////////////
///////////////////////////////////////////////////////////
float infCos(float angle) {
    return angle % TWO_PI < PI ? cos(angle*2 + HALF_PI)*0.5 : cos(HALF_PI - (angle-HALF_PI)*2)*0.5;
}


///////////////////////////////////////////////////////////
// Polygon sinus //////////////////////////////////////////
///////////////////////////////////////////////////////////
float polySin(float angle, int edges) {
    float arc = TWO_PI / edges;
    int index = floor(angle / arc);
    float factor = (angle - index*arc) / arc;
    return sin(index*arc) * (1-factor) + sin((index+1)*arc) * factor;
}


///////////////////////////////////////////////////////////
// Polygon cosinus ////////////////////////////////////////
///////////////////////////////////////////////////////////
float polyCos(float angle, int edges) {
    float arc = TWO_PI / edges;
    int index = floor(angle / arc);
    float factor = (angle - index*arc) / arc;
    return cos(index*arc) * (1-factor) + cos((index+1)*arc) * factor;
}


///////////////////////////////////////////////////////////
// Particles class ////////////////////////////////////////
///////////////////////////////////////////////////////////
class Particle {
    
    
    ///////////////////////////////////////////////////////////
    // Variable definitions ///////////////////////////////////
    ///////////////////////////////////////////////////////////
    float targetX;
    float targetY;
    PVector[] blur;
    
    
    ///////////////////////////////////////////////////////////
    // Constructor ////////////////////////////////////////////
    ///////////////////////////////////////////////////////////
    Particle(float x, float y) {
        targetX = x;
        targetY = y;
        blur = new PVector[18];
        for(int n = 0; n < blur.length; n++)
            blur[n] = new PVector(x, y, 0);
    }
    
    
    ///////////////////////////////////////////////////////////
    // Update & render ////////////////////////////////////////
    ///////////////////////////////////////////////////////////
    void updateAndRender() {
        for(int n = blur.length-1; n > 0; n--) {
            blur[n].x = blur[n-1].x;
            blur[n].y = blur[n-1].y;
            ellipse(blur[n].x, blur[n].y, 20, 20);
        }
        float movementAngle = atan2(targetX-blur[0].x, targetY-blur[0].y);
        blur[0].x = blur[0].x*(1-particleFormation) + targetX*particleFormation;
        blur[0].y = blur[0].y*(1-particleFormation) + targetY*particleFormation;
        ellipse(blur[0].x, blur[0].y, 20, 20);
        pushMatrix();
        translate(blur[0].x, blur[0].y);
        rotate(-movementAngle);
        image(arrowImage, -arrowImage.width/2, -arrowImage.height/2);
        popMatrix();
    }
    
    
}
