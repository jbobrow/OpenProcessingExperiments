
float base_line;
float wh;
float vp_y = 100; //vanishing point
float vp_x = 100; //vanishing point
float t = 1;
float top_line = 300;

class Particle{
    int x;
    int y;
    color c;

    Particle(int x, int y, color c){
        this.x = x;
        this.y = y;
        this.c = c;
    }
}

Vector vic = new Vector();

void plot(int x, int y, color c) {
    pixels[y * width + x] = c;

}

color randc(){
    return color(random(0xff),random(0xff),random(0xff));
}


void setup(){
    size(800, 800);
    background(0,0,0);
    base_line = height - 100;
    wh = width/2;

    for(int i = 0; i < 256; i++){
        Particle p = new Particle(int(random(width)),int(random(height)), randc());
        vic.add(p);
    }


}


void myline(float x1, float y1, float x2, float y2){
    pushMatrix();
    line(wh - x1, base_line - y1, wh - x2, base_line - y2);
    popMatrix();
}

void draw(){
    background(0,0,0);

    
    //Draw a starry background
    loadPixels();
    for(int i = 0; i < vic.size(); i++){
        Particle p = (Particle)vic.elementAt(i);
        plot(p.x, p.y, p.c);
        if (int(random(100)) % 10 == 0)
            p.y = (p.y + 1) % height;
        p.c = randc();
    }
    updatePixels();

    //Draw perspective lines
    float cell_width = 30; //Width of the cell along the base line
    //float y1 = 0;
    float y1 = (cos(t/4) * 100) + 50;
    //strokeWeight(abs(sin(t/40)*2) + 2);
    for (int i = -100; i < 100; i++){
        float x1 = cell_width * i;
        if ((vp_x-x1) == 0){
            myline(x1, 0, x1, top_line);
        }
        else{
            float theta = atan(vp_y/(x1 - vp_x));
            float y2 = top_line;
            float x2 = x1 - (y2/tan(theta));
            stroke(304, 0, 120);
            myline(x1, y1, x2, y2);
            stroke(204, 0, 120);
            myline(x1, y1, x2, -y2);
            myline(x1, top_line + 200, x2, y2);
            stroke(304, 0, 120);
            myline(x1, top_line + 200, x2, (top_line + 200) + y2);
        }
    }
    vp_y = (sin(t/2) * 100) + 500;
    vp_x = cos(t/3) * 100;
    t += 0.01;
    top_line = (sin(t/4) * 50) + 300;
}

// vim: ft=java sw=4 ts=4 expandtab :

