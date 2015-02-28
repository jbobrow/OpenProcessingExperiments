
// Pressing Control-R will render this sketch.
 
void setup() {  // this is run once.   
    size(200,150);
    frameRate(30);    
    println(month());
} 
 
void draw() {  
    background(0)
    
    fill(255,0,0); stroke(255, 0, 0);
    rect(0,0, map(month(), 1, 12, 0, width), height/5);
    
    fill(255,128,0); stroke(255, 128, 0);
    rect(0,height/5, map(day(), 1, 31, 0, width), height/5);
    
    fill(128,255,128); stroke(128, 255, 128);
    rect(0,2*height/5, map(hour(), 0, 23, 0, width), height/5);
    
    fill(0,128,128); stroke(0, 128, 128);
    rect(0,3*height/5, map(minute(), 0, 59, 0, width), height/5);
    
    fill(0,map(second(), 0, 59, 0, 255),255); 
    stroke(0, map(second(), 0, 59, 0, 255), 255);
    rect(0,4*height/5, map(second(), 0, 59, 0, width), height/5);
}
