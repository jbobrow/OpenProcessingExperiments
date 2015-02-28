
int n = 10;
float[] y = new float[n];
float[] x = new float[n];
 
void setup() {  //setup function called initially, only once
    size(440,440);
    smooth();
    for(int i = 0; i < n; i++) {
        x[i] = (i+1)*width/(n+1);
        y[i] = random(height*0.25,height*0.75);
    }
}
 
void draw() {  //draw function loops
    background(#C5C8CB);
    ellipseMode(CENTER);
    fill(0,100);
    noStroke();
    for(int i = 0; i < n; i++) {
        ellipse(x[i],y[i],7,7);
    }
    noFill();
    stroke(0,100);
    for(int i = 0; i < n-1; i++) {
        float x1 = x[i];
        float x2 = x[i];
        float y1 = y[i];
        float y2 = y[i];
        for(float j = 0.0; j <= 1.1; j+= 0.1) {
            x1 = x2;
            x2 = lerp(x[i],x[i+1],j);
            y1 = y2;
            y2 = cos_lerp(y[i],y[i+1],j);
            line(x1,y1,x2,y2);
        }
    }
}
 
float cos_lerp(float a, float b, float x) {
    float f = (1-cos(x*PI))*0.5;
     
    return a*(1-f) + b*f;
}

void mouseClicked() {
    for(int i = 0; i < n; i++) {
        x[i] = (i+1)*width/(n+1);
        y[i] = random(height*0.25,height*0.75);
    }
}

void keyPressed() {
    for(int i = 0; i < n; i++) {
        x[i] = (i+1)*width/(n+1);
        y[i] = random(height*0.25,height*0.75);
    }
}
