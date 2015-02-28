
//Idea and general structure taken from: http://processing.org/examples/sinewave.html
//tangent!
float theta = 0.0;
float x;
float height = 100;
float dWidth;
float dx = .1;
float[] yvalues;

void setup() {  //setup function called initially, only once
  size(500, 500);
  dWidth = 5;
  yvalues = new float[25];
}

void draw() {  //draw function loops 
    background(0);
    calcPos();
    drawPos();
}

void calcPos(){
    theta += .02;
    x = theta;
    for(int i = 0; i< yvalues.length; i++){
        yvalues[i] = height*tan(x);
        x+=dx;
    }
}

void drawPos(){
    noStroke();
    fill(255);
    // A simple way to draw the wave with an ellipse at each location taken from Daniel Shiffman. 
    for (int x = 0; x < yvalues.length; x++) {
        ellipse(x*3+200, yvalues[x]+200, 4, 4);
    }
}
