
void setup(){
    size(300,200);
    background(255);
    smooth();
}
  
void draw(){
    fill(255,255,random(255));
    ellipse(random(width/2),random(height),20,20);
    
    
    fill(255,random(255),255);
    ellipse(random(width/2,width),random(height),20,20);
}
