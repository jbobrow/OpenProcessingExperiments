
// Pressing Control-R will render this sketch.
 
float h;
void setup() {  // this is run once.   
    
    // set the background color
    background(0);
    
    size(300, 300); 
    
    // limit the number of frames per second
    frameRate(30);
    
    
    // wave line
    stroke(255);
    smooth();
    noFill();
    strokeJoin(ROUND);
    strokeWeight(3);
    
    h = height / 12.0f;
} 
 
void draw() {  // this is run repeatedly.  
    background(0);
    
    float res = 1;
 
    beginShape();
    for(float  x = 0; x <= width; x += res){
        float y = (h*cos(x * (PI*4)/width) - (h*1.2)) * (cos((frameCount * -0.2)  + x * (PI*44) / width));
        y += height/2;
        vertex(x,y);
    }
    endShape();
}
