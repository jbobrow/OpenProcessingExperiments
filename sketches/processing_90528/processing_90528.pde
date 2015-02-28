
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;

int s = 20;


void setup() {
    size(600, 600);
    background(palette[0]);
    smooth();
    
    
    
    
    for(int x = 0; x < width; x += s) {
        for(int y = 0; y < height; y += s) {
        fill(palette[int(random(1,4))]);
        ellipse(x, y, s, s);
        
        }
    } 
    
}


void draw() {

    {fill(palette[int(random(1,4))]);
    
    int x = int(random(width/s))*s;
    int y = int(random(height/s))*s;
    int u = 600;
    noStroke();
    ellipse(x, y, s, s);
    
    if(mouseX > width/2){
    s += .5;
}     else    {
    s-= .5;
    }
    
    }
    
    int e = width/2;
    int r = width/2;
    int t = 0;
    int u = 600;
    
    stroke(palette[4]);
    strokeWeight(8);
    line(e, t, r, u);
    
    
}
