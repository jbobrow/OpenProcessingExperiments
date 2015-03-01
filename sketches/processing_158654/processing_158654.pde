
int n, d;
float t;

void setup() {
    size(800, 800);
    background(255);
    
    n = 200;
    d = 3;
    strokeWeight(2);
}

void draw() {  //draw function loops 
    background(255);
    t = millis()/500;

    for (int i = 0; i < n; i+=.5) {
        int x = (width/2)+sin((i/n)*TWO_PI)*(125+cos(t+(i/n)*TWO_PI*64)*50);
        int y = (height/2)-sin((i/n)*TWO_PI)*(125+tan(t+(i/n)*TWO_PI*64)*50);
        
        noFill();
        stroke(0);
      //  line(width/2, height/2, x, y);
        noStroke();
        fill(0);
        ellipse(x, y, d, d);
    }
}
