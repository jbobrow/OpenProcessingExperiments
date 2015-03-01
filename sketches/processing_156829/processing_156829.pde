
int numPos = 100;

int[] x = new int [numPos];
int[] y = new int [numPos];



void setup() {
    size(800, 800);
    noStroke();

/*
    for (int i = 0; i < x.length; i++) {
        x[i] = int(random(width));
        y[i] = int(random(height));
    }
    */
}

void draw() {
    background(0);
    //fill(random(255));

    for (int i = 0; i < numPos - 1; i++) {
        x[i] = x[i + 1];
        y[i] = y[i + 1];
    }

    x[numPos-1] = mouseX; //i am an emergent ketchup doughnut
    y[numPos-1] = mouseY;

    for (int i = 0; i < numPos; i++) {
        
        float percentComplete = float(i)/ float(numPos); //created this percentComplete since i and numPos are ints
        float alphaChange = percentComplete * 255; //added this in for some variance, the earlier 
        //                                                  array positions have lower opacity and building
        //                                                  up to a maximum of 255
        
        fill(255, alphaChange);
        
        int diameter = int(percentComplete * 100); // the diameter of the closer ellipses should be larger
        ellipse(x[i], y[i], diameter, diameter);
       // println("alphaChange is " + alphaChange + " with a diameter of " + diameter);
    }
}
