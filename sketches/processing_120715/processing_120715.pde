
void setup() {
                size(500, 500);     
                frameRate(50);      
                float x =random(1,500);
                float y =random(1,500);
                predatorP = {x, y};
                rectMode(CENTER);
                float w =random(1,200);
                float x =random(1,200);
                float y =random(1,200);
                float z =random(1,200);
                fill(w,x,y,z);
}

void draw() {
                background(170);
                x = random(0,500);
                y = random(0,500);
                ellipse(x,y,20,20);
                float x =random(1,200);
                float y =random(1,200);
}
