
int centerX, half_centerX, centerY;
float cl, rl, pl;

void setup() {
    size(1000, 600);
    background(20);
    smooth();
    
    centerX = width/2;
    half_centerX = centerX / 2;
    centerY = height/2;
    
    cl = 100; //Crank Radius
    rl = 200; //Rod Length
    pl = 200; //Piston Length
}

void draw() {
    background(20);
    float t = millis()/1000; 

    //Pos of Crank Cirlces
    int cx = (int)(half_centerX + cl * cos(t));
    int cy = (int)(centerY - cl * sin(t));
    
    //Pos of Rod Circles
    int rx = (int)(half_centerX + cl* cos(t) + sqrt(rl*rl - (cl*cl*sin(t)*sin(t))));
    int ry = centerY;

    //Settings for Crank, Rod and Piston
    stroke(220);
    strokeWeight(40);
    
    //Draw Crank
    line(half_centerX, centerY, cx, cy);
    
    //Draw Rod
    line(cx, cy, rx, ry);
    
    //Draw Piston
    line(rx, ry, rx+pl, ry);
    
    //Draw Piston Head
    pHead(rx+pl, ry);
   
    //Draw Chamber
    chamber(half_centerX + rl - cl + pl + 35, centerY, rx + pl + 60);
    
    //Draw Center Circles
    circles(half_centerX, centerY);
    
    //Draw Crank Circles
    circles(cx, cy);
    
    //Draw Piston Circles
    circles(rx, ry);
}

void circles(int x, int y) {
    //Draw Inner Circle
    fill(20);
    stroke(220);
    strokeWeight(10);
    ellipse(x, y, 80, 80);
    
    //Draw Outer Circle
    fill(220);
    noStroke();
    ellipse(x, y, 50, 50);
}

void chamber(int x, int y, int b) {
    int w = cl*2+40; //Width of the chamber
    int h = 60; //Height of the chamber

    //Draw Chamber Interior
    int c = (((x+w)-b)/215)*255; 
    fill(color(255-c, c, 0));
    rect(b-1, y-h/2, (x+w)-b, h);
    
    //Draw Actual Chamber
    noFill();
    stroke(220);
    strokeWeight(2);
    beginShape();
    vertex(x, y-h/2);
    vertex(x+w, y-h/2);
    vertex(x+w, y+h/2);
    vertex(x, y+h/2);
    endShape();
}

void pHead(int x, int y) {
    int h = 60; //Height of the Piston Head
    y -= h/2;
    
    
    fill(220);
    noStroke();
    rect(x, y, 40, h, 10, 2, 2, 10);
    rect(x+45, y, 5, h, 2, 2, 2, 2);
    rect(x+55, y, 5, h, 2, 2, 2, 2);
}
