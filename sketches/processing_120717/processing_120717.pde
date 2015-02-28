
void setup() {
                size(500, 500);           
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
                predator = ellipse(predatorP[0], predatorP[1], 20, 20);
}

