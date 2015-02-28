
int n = 100;
PVector[] pos = new PVector[n];
PVector[] vel = new PVector[n];

void setup(){
    size(400,400);
    background(255);
    for(int i = 0; i<n; i++){
        pos[i] = new PVector(random(width), random(height));
        vel[i] = new PVector(0,0);
    }
    
    noiseDetail(7);
}

void draw(){
    for(int i=0; i<n; i++){
        stroke(0,14);
        point(pos[i].x, pos[i].y);
        vel[i].x = noise(pos[i].x*.05, pos[i].y*0.05)*cos(4*PI*noise(pos[i].x*.005, pos[i].y*.005);
        vel[i].y = noise(pos[i].x*.05, pos[i].y*0.05)*sin(4*PI*noise(pos[i].x*.005, pos[i].y*.005);
        
        pos[i].add(vel[i]);
        
        if(0 > pos[i].x || pos[i].x > width || pos[i].y > height || pos[i].y < 0){
            pos[i].x = random(width);
            pos[i].y = random(height);
        }
    }
}
