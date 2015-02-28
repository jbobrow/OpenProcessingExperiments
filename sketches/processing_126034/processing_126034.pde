

int NUM = 5;
PVector[] pos = new PVector[NUM];
color[] col = new color[NUM];
 
void setup () {
    frameRate(120);
    size(700, 400);
    background (255);
    strokeWeight(2);
     
    for (int i=0; i < NUM; i++) {
    
        pos[i] = new PVector (350, 200);
        col[i] = color(0);
    }
}
 
void draw () {
     
    for (int i=0; i < NUM; i++) {
        
        pos[i].x += random (-5, 5);
        pos[i].y += random (-5, 5);
         
        if (pos[i].x < 0)
            pos[i].x = 0;
            
        if (pos[i].x > width)
            pos[i].x = width;
        // Oben
        if (pos[i].y < 0)
            pos[i].y = 0;
        // Unten
        if (pos[i].y > height)
            pos[i].y = height;
         
        stroke (col[i], 100);
         
        point (int (pos[i].x), int (pos[i].y));
    }
}

void keyPressed() {
  if (key == ' ') saveFrame();
}
