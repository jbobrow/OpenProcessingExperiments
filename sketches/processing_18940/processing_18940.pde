
float num;
PVector magnitude;
PVector mouse;
void setup(){
    size(400, 400);
    mouse = new PVector(width/2, height/2);
    magnitude = new PVector(width, height);
    frameRate(15);
    noStroke();
    smooth();
    background(255);

}

void draw(){
  makeSaturatedLine(mouse);
}

void mouseMoved(){
  mouse.set(mouseX, mouseY,0);
}


void makeSaturatedLine(PVector mouse){
    fill(255);
    rect(0,0,width, height);
    num = random(150, 200);
    PVector center = mouse;
    pushMatrix();
    translate(center.x, center.y);
    float rad = TWO_PI / num;
    for(float i = 0; i < TWO_PI; i+=random(rad-0.02, rad+0.02)){
        PVector outside = new PVector(cos(i), sin(i));
        float seed = random(60, 130);
        PVector inside = new PVector(cos(i) *seed,
                                     sin(i) *seed); 
        outside.mult(magnitude.mag());
        PVector outsideNoiseA = new PVector(random(-5,10), random(-5, 10));
        PVector outsideNoiseB = new PVector(random(-10,5), random(-10, 5));
        fill(0);
        triangle(inside.x,inside.y,
                 outside.x + outsideNoiseA.x, outside.y + outsideNoiseA.y,
                 outside.x + outsideNoiseB.x, outside.y + outsideNoiseB.y);
    }
    popMatrix();

}
                                                                                                                
