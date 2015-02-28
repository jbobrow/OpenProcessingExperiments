
void setup(){ 
size(500,500);} 
void draw(){float x= mouseX;float y=mouseY;float p=random(x);float r=255+p;background(p);rect(x,r,y,p);fill(r/2,x/2,p);translate(y,x);rect(p,y,r,x);fill(p,y/2,r/2);} 


