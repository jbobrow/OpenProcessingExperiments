
int d, b;
float[] nArr;
int n;

void setup() {
    size(800, 800);
    background(255);
    smooth();
    
    noStroke();
    noCursor();
    
    nArr = {0, 0.5, 0.75, 0.875}; //Who needs functions anyways. God I'm tired.
    
    d = 15;
    b = 100;
    n = 2;
}

void mouseClicked() {
    n = (++n %4);
}

void draw() {  //draw function loops 
    background(255);

    fill(0);
    text("n = " + n, 10, 10);
    for (int i = (d/2)+b; i < width-b; i+=d) {
        for (int j = (d/2)+b; j < height-b; j +=d) {
            int distance = dist(i, j, mouseX, mouseY);
            
            distance = distance > 200? 0 : cos(((distance/(200*pow(2, n)))+nArr[n])*HALF_PI);

            ellipse(i*(1-distance)+mouseX*distance, j*(1-distance)+mouseY*distance, d-5, d-5);
        }
    }
   
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 50, 50);
}
