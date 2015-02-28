
void draw(){
float a = random(100); 
float b = random(100); 
strokeWeight(a/10); 
rect(b, a, a, b); 
rect(a, b, b, a); 
filter(DILATE);}
                
                
