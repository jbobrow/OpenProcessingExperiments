
float a = random(1);
    
void setup() {
    size(500, 500); 
    background(0); 
    frameRate(25);
    noStroke();
    colorMode(HSB);
}

void draw () {
    a+=.01;
    float n=noise(a);
    
    background(255);
    for(int i=150; i>0; i-=5){
        pushMatrix();
        translate(width/2,height/2);
        rotate(radians(frameCount*i/5.));
        
        // call to HTML5 canvas API
        externals.context.shadowOffsetX = cos(radians(5*i))*3;
        externals.context.shadowOffsetY = sin(radians(5*i))*3;
        externals.context.shadowBlur = min(i,5);
        externals.context.shadowColor = "black";

        fill(255);
        ellipse(0,0,10+i*10*sin(n*TWO_PI),30+i*20*cos(n*TWO_PI));
        popMatrix();
    }
 
}
