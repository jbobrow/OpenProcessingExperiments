
void setup(){
    size(300,200);
    background(255);
    smooth();
}
 
void draw(){
    fill(255,255,random(255));
     
    ellipse(random(width),random(height),20,20);
    
}
