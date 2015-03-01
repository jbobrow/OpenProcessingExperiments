
float wRatio = 0.8;
float wOffset = 0.1;
float hRatio = 0.2;
float amp = 50;
float px = 0, py = 0; 
float step;
float alpha = 0;
float periodFrames = 100;
float valpha = TWO_PI / periodFrames;
int pointsOnWave;
int r = 10;
int pointNumRatio = 20;
color evilgrey = #292929;
color red = #FF0000;
float rectW, rectH = 50;
boolean points[];

void setup() {
    size(400,400);
    background(255);

    stroke(0);

    pointsOnWave = width / pointNumRatio;
    rectW = pointsOnWave;
    step = (TWO_PI) / (pointsOnWave);
    fill(255,0,0);
    rectMode(CENTER);
    points = new boolean[pointsOnWave];
}

void draw() {
    background(255);
    noStroke();

    for (int i = 0; i < pointsOnWave; ++i) {
        float x = i*pointNumRatio;
        float y = height/2+amp*-sin(i*step+alpha);
        float tmp = abs(sin(i*step+alpha));
        // point(i,height/2+hRatio*(height/2)*sin(step*i));
        //line(px,py,x,y);

        float tmpR;

        // float treshold = rectW + r;
        if(points[i]) {
            tmpR = r - r*map(tmp,0,1,1,0)/2;
            fill(red);
            ellipse(x, y, tmpR, tmpR);
            fill(evilgrey);
            rect(i*rectW, width/2, rectW, rectH);   
        }
        else {
            tmpR = r + r*map(tmp,0,1,1,0);
            
            fill(evilgrey);
            rect(i*rectW, width/2, rectW, rectH);   
            fill(red);
            ellipse(x, y, tmpR, tmpR);
        }

        if(py>y) {
            points[i] = false; // descending
        }
        else {
            points[i] = true; // ascending
        }
        
        px = x;
        py = y;
    }

    alpha+=valpha;
}
