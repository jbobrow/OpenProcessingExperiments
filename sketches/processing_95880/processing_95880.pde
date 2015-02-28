
// Samantha Ticknor
// sticknor
// Hw 11
// Copyright 2013


final int MAX = 30;
int rad;
color[] col;
int[] x, y, z;


void setup()
{
    size(600, 600, P3D);
    noStroke();
    rad = 20;
    background(250, 247, 220);

    x = new int[MAX];
    y = new int[MAX];
    z = new int[MAX];
    col = new color[MAX];
    
    initLists();
}

void initLists(){
  for (int i = 0; i < MAX; i++){
    x[i] = round(random(50, width-50));
    y[i] = round(random(50, height-50));
    z[i] = round(random(50, width-50));
    int r = round(random(250, 255));
    int g = round(random(150, 200));
    int b = round(random(150, 200));
    col[i] = color(r, g, b);
  }
}


void draw()
{
    lights();
    background(250, 247, 220);
    drawBgShapes();
}


void drawBgShapes(){
    for (int i = 0; i < MAX; i ++){
        color fil = col[i];
        int xx = x[i];
        int yy = y[i];
        int zz = z[i];
        
        figure(xx, yy, zz, frameCount*2, frameCount*2, fil);
        figure(width-xx, height-yy, zz-5, -frameCount*2, -frameCount*2, fil);
    }
}

void figure(int xx, int yy, int zz, int yRot, int zRot, color fil){
  fill(fil);
  pushMatrix();
        translate(xx, yy, zz);
        rotateZ(radians(zRot));
        rotateY(radians(yRot));
        box(rad+10);
        sphere(rad);
        popMatrix();

}

