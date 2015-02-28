
boxSize = 40;
gapFactor = 0.2;

void setup() {  //setup function called initially, only once
  size(480, 360);
}

void draw() {  //draw function loops 
    background(192, 168, 0);
    scale(0.5);
    translate(20, 20);
    drawBoxes(int(millis()/250));
}

void drawBoxes(int qty) {
    float[] gridTick;
    gridTick[0] = boxSize * (1 + gapFactor);
    gridTick[1] = gridTick[0] * (1 + gapFactor);
    
    fill(255);
    noStroke();

    int count = 0;
    int[] row = {0, 0};
    int[] col = {0, 0};
    
    while (qty - count > 0) {
        scratch = count;
        pushMatrix();
        if (scratch > 1000) {
            translate(0, int(scratch/1000) * gridTick[1]);
            scratch = scratch % 1000;
        }
        if (scratch > 100) {
            translate(int(scratch/100) * gridTick[1], 0);
            scratch = scratch % 100;
        }
        if (scratch > 10) {
            translate(0, int(scratch/10) * gridTick[0]);
            scratch = scratch % 10;
        }
        translate(scratch * gridTick[0], 0);
        rect(0, 0, boxSize, boxSize);

        popMatrix();
        count++;
    }
}
