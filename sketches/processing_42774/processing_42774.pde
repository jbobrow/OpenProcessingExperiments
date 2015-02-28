
/**
 * Et løsningsforslag til kalejdoskop opgave
 * Warming up for the Processing workshop at Open Space Aarhus
 * http://osaa.dk/wiki/index.php/Processingworkshops
 */
 
void setup() {
    size(600,600);
    reset();
}


void reset() {
    smooth();
    background(0);
    colorMode(HSB);
}

void mouseClicked() {
    reset();
}

void draw() {
    //magisk beregning af diameter
    float d = 15 * (2+sin(5*frameCount/frameRate));
    //vælg farve
    fill((frameCount%255), 255, 255);
    //tegn 4 cirkler
    ellipse(mouseX        , mouseY         , d, d);
    ellipse(width - mouseX, mouseY         , d, d);
    ellipse(mouseX        , height - mouseY, d, d);
    ellipse(width - mouseX, height - mouseY, d, d);
}

